<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="com.androidbook.triviaquizserver.PMF" %>
<%@ page import="com.androidbook.triviaquizserver.TriviaQuizQuestions" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Questions Admin Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container pt-4">
    <h2>New question</h2>
    <div class="row">
        <div class="col">
            <form action="questions" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="number">Number:</label>
                    <input type="text" id="number" name="number" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="question">Question:</label>
                    <input type="text" id="question" name="question" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="imageUpload">Image:</label>
                    <input type="file" class="form-control-file border" id="imageUpload" name="imageUpload"/>
                </div>
                <div class="form-row">
                    <input type="submit" name="submit" class="btn btn-primary mx-auto" value="Gogogo!"/>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>

    <h2>All questions:</h2>
    <table class="table table-striped mt-3">
        <thead class="thead-dark">
        <tr>
            <th>Number</th>
            <th>Approved?</th>
            <th>Question</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        </thead>
        <%

            PersistenceManager pm = PMF.get().getPersistenceManager();
            String query = "select from " + TriviaQuizQuestions.class.getName() + " order by number desc";
            List<TriviaQuizQuestions> questions = (List<TriviaQuizQuestions>) pm.newQuery(query).execute();
            String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            System.out.println("base url: " + baseUrl);
            if (!questions.isEmpty()) {
                for (TriviaQuizQuestions question : questions) {
                    String delUrl = "questions?action=delete&key=" + question.getId();
                    String approveUrl = "questions?action=approve&key=" + question.getId();
        %>
        <tr>
            <td><%=question.getNumber() %>
            </td>
            <td><%=question.getApproved() %>
            </td>
            <td><%=question.getTriviaQuestion() %>
            </td>
            <td><img src="<%= baseUrl%><%= question.getQuestionImageUrl() %>" style="width: 10%"/></td>
            <td><a href="<%=delUrl %>">Delete</a> | <a href="<%=approveUrl %>">Approve</a></td>
        </tr>
        <%
                }
            }
            pm.close();
        %>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
</body>
</html>
