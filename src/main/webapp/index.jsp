<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<hr>
<c:forEach var="counter" begin="1" end="10" step="1">
   <c:out value="${counter}   test"> ≈</c:out><hr>
</c:forEach>

<!-- Java Class Codes Spagetti code -->
<%= "IP" + request.getRemoteAddr()%>
<table>
    </h1>
<%@ page import="java.sql.*" %>
<%
    Connection con;
    Statement statement = null;
    ResultSet resultSet = null;

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/sys";
    String userName = "root";
    String password= "Aa123456";

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url ,userName,password);
    }catch (Exception e){
        e.printStackTrace();
       throw  new RuntimeException(e);
    }
    String sqlQuery = "select * from sys.person";
    try {
        statement = con.createStatement();
        resultSet = statement.executeQuery(sqlQuery);
        while (resultSet.next()){
        %>
           <tr>
               <td> <%= resultSet.getString("name") %> </td>
               <td> <%= resultSet.getString("sureName") %> </td>
           </tr>
        <%
        }

    }catch(Exception e){
        e.printStackTrace();
        throw  new RuntimeException(e);
    } finally {
        if(con != null){
            con.close();
        }
        
        if(statement != null){
            statement.close();
        }
        
        if(resultSet != null){
            resultSet.close();
        }
        }
%>
</table>

</body>
</html>