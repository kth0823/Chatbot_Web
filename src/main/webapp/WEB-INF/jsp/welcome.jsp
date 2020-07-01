<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style> 
    body { background-color: lightblue; } 
    h1 { background-color: rgb(255,128,0); } 
    p { background-color: #FFFFCC; } 
    
    a:link    { color: teal; } 
    a:visited { color: maroon; text-decoration: none } 
    a:hover   { color: yellow; text-decoration: none } 
    a:active  { color: red; text-decoration: none }
</style>

<body>

<h1>
	book list  
</h1>
 <form action = "student" method = "post">
        student id : <input type = "text" name = "id"><br/>
        <input type = "submit" value = "전송">
    </form>





</body>
</html>