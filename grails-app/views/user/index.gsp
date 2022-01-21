<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
<!--
       <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table class="test" collection="${userList}" except="['password']" />

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
-->
    <div class="row">
        <div class="col-md-12">
            <h1>Liste des utilisateurs de <b>Lecoincoin</b></h1>
            <table class="table table-bordered" collection="${userList}">
                <thead>
                <tr>

                    <g:sortableColumn property="id" title="id" />
                    <g:sortableColumn property="username" title="sername" />
                    <g:sortableColumn property="passwordExpired" title="Password Expired" />
                    <g:sortableColumn property="accountLocked" title="Account Locked" />
                    <g:sortableColumn property="accountExpired" title="Account Expired" />
                    <g:sortableColumn property="enabled" title="Enabled" />
                </tr>
                </thead>
                <tbody>
                 <g:each in="${userList}" var="user">
                     <tr>
                         <td>${user.id}</td>
                         <td>${user.username}</td>
                         <td>${user.passwordExpired}</td>
                         <td>${user.accountLocked}</td>
                         <td>${user.accountExpired}</td>
                         <td>${user.enabled}</td>
                     </tr>
                 </g:each>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <g:paginate total="${userCount ?: 0}" />
                </ul>
            </nav>

        </div>
    </div>
    </body>
</html>