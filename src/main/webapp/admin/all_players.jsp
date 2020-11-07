<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="com.androidbook.triviaquizserver.PMF" %>
<%@ page import="com.androidbook.triviaquizserver.PlayerPersistentData" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of all Been There, Done That! Players</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container pt-4">
    <h2>New Player</h2>
    <div class="row">
        <div class="col">
            <form action="/receive" method="get">
                <div class="form-row my-2">
                    <div class="col-2"><label for="updateId">Id: </label></div>
                    <div class="col">
                        <input type="text" id="updateId" name="updateId" class="form-control"/>
                    </div>
                </div>
                <div class="form-row my-2">
                    <div class="col-2"><label for="nickname">Nickname: </label></div>
                    <div class="col">
                        <input type="text" id="nickname" name="nickname" class="form-control"/>
                    </div>
                </div>
                <div class="form-row my-2">
                    <div class="col-2"><label for="email">Email: </label></div>
                    <div class="col">
                        <input type="text" id="email" name="email" class="form-control"/>
                    </div>
                </div>
                <div class="form-row my-2">
                    <div class="col-2"><label for="password">Password: </label></div>
                    <div class="col">
                        <input type="text" id="password" name="password" class="form-control"/>
                    </div>
                </div>
                <div class="form-row my-2">
                    <div class="col-2"><label for="score">Score: </label></div>
                    <div class="col">
                        <input type="text" id="score" name="score" class="form-control"/>
                    </div>
                </div>
                <div class="form-row">
                    <input type="submit" class="btn btn-primary mx-auto" value="Do it!"/>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>
    <h2>All Players</h2>
    <div class="card-columns mt-3">
        <%
            PersistenceManager pm = PMF.get().getPersistenceManager();
            String query = "select from " + PlayerPersistentData.class.getName() + " order by nickname";
            List<PlayerPersistentData> players = (List<PlayerPersistentData>) pm.newQuery(query).execute();
            String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            if (players.isEmpty()) {
        %>No players<%
    } else {
        for (PlayerPersistentData player : players) {
    %>
        <div class="card">
            <img class="card-img-top" src="<%= baseUrl%><%= player.getAvatarUrl() %>"
                 alt="avatar<%=player.getId()%>">
            <div class="card-body">
                <h3 class="card-title">Id: <%=player.getId()%>
                </h3>
                <h4 class="card-text">Nickname: <%=player.getNickname()%>
                </h4>
                <p class="card-text">Email: <%=player.getEmail() %>
                </p>
                <p class="card-text">Score: <%=player.getScore()%>
                </p>
                <form action="/receive" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="updateId" value="<%=player.getId()%>"/>
                    <input type="file" class="form-control-file border" name="avatar"/>
                    <input type="submit" class="btn btn-primary btn-sm" value="Upload"/>
                </form>
            </div>
        </div>
        <%
                }
            }
            pm.close();
        %>
    </div>
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
