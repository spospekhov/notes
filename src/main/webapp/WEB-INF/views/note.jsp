<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <title>Менеджер зематок</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
        .btn {
            padding: 2px 2px;
            width: 5em;
            height: 2em;
            background-color: #4d3a1e;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
        }
        .btn:hover, .btn:focus {
            border: 1px solid #4d3a1e;
            background-color: #fff;
            color: #000;
        }
        a.aEdit:link, a.aDelete:link {
            color: #a83016;
        }
        a.aEdit:visited, a.aDelete:visited {
            color: #947872;
        }
        a.aEdit:hover, a.aDelete:hover {
            color: #60a870;
        }
        a.aEdit:active, a.aDelete:active {
            color: #ded728;
        }
        a.aCreateUser:link {
            color: #d1cbbc;
        }
        a.aCreateUser:visited {
            color: #c4bba5;
        }
        a.aCreateUser:hover {
            color: #a0cc95;
        }
        .panel-footer a{
            font-size: 1.2em;
        }
        .panel-footer a:link {
            color: #d1cbbc;
        }
        .panel-footer a:visited {
            color: #c4bba5;
        }
        .panel-footer a:hover {
            color: #a0cc95;
        }
        .panel-footer a:active {
            color: #52de2d;
        }
    </style>
</head>
<body>

<h2>Менеджер записей</h2>

<form:form method="post" action="add" commandName="note">

    <table>
        <tr>
            <td><form:label path="text">
                Текст
            </form:label></td>
            <td><form:input path="text" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Добавить запись" /></td>
        </tr>
    </table>
</form:form>

<div class="panel-heading" style="background-color:#786455">
    <h3 class="panel-title ">
        <div align="left"><a class="aCreateNote" href="createNote">Создать новую заметку</a></div>
    </h3>
</div>

<h3>Заметки</h3>
<c:if test="${empty userList}">
    Заметок пока что нет.
</c:if>
<c:if test="${!empty noteList}">
    <table class="data">
        <tr>
            <th>Текст></th>
            <th>Статус</th>
            <th>Дата создания</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach items="${noteList}" var="note">
            <tr>
                <td>${note.text}</td>
                <td>${note.status}</td>
                <td>${note.createdDate}</td>
                <td><a href="delete/${note.id}">Удалить</a></td>
                <td><c:if test="${note.status != 'Выполнена'}">
                    <a href="complete/${note.id}">Выполнить</a></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div align="center" class="panel-footer" style="background-color:#786455" id="pagination">
    <c:url value="/" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Предыдущая</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Следующас</a>
    </c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>