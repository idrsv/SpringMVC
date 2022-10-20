<%--
  Created by IntelliJ IDEA.
  User: idrsv
  Date: 13.10.2022
  Time: 18:20
  To change this template use File | Settings | File Templates.
  
  action-какой адрес должен срабатывать

  form:form-контейнер
  form:imput-строчка
  form:select-выпадающий список
  form:radiobutton-выбор кружка()
  form:checkbox - несколько флажков
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<body>
    <h2>
        Dear Employee, Please enter your details.
    </h2>

    <br>
<form:form action="showDetails" modelAttribute="employee">
    Name <form:input path="name"/>
    <form:errors path="name"/>
    <br>
    Surname <form:input path="surname"/>
    <form:errors path="surname"/>
    <br>
    Salary <form:input path="salary"/>
    <form:errors path="salary"/>
    <br>
    Department <form:select path="department">
    <form:options items="${employee.departments}"/>
        </form:select>
    <br>
    Which car do you want?
    <form:radiobuttons path="carBrand" items="${employee.carBrands}"/>
    <br>
    Foreign Language(s)
    <form:checkboxes path="languages" items="${employee.languagesMap}"/>
    <br>
    Phone Number <form:input path="phoneNumber"/>
    <form:errors path="phoneNumber"/>
    <br>
    Email <form:input path="email"/>
    <form:errors path="email"/>
    <br>
    <input type="submit" name="OK">
</form:form>
</body>
</html>
