<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Enter Suggestion</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="container pt-4">
    <h2>Suggest a Question</h2>
    <div class="row">
        <div class="col">
            <form action="/suggest" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    PlayerId: <input type="text" name="playerId" class="form-control"/>
                </div>
                <div class="form-group">
                    Question: <input type="text" name="question" class="form-control"/>
                </div>
                <div class="form-group">
                    Image: <input type="file" name="questionImage" class="form-control-file border"/>
                </div>
                <div class="form-row">
                    <input type="submit" name="submit" value="Suggest" class="btn btn-primary mx-auto"/>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>
    <div class="alert alert-info">
        <h5>Tip: If you don't know your playerId, you probably shouldn't be using this form. :)</h5>
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
