<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="col-12">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-bordered" collection="${annonceList}">
            <thead>
            <tr>
                <g:sortableColumn property="title" title="Title" />
                <g:sortableColumn property="description" title="Description" />
                <g:sortableColumn property="price" title="Price" />
                <g:sortableColumn property="status" title="Status" />
                <g:sortableColumn property="illustrations" title="Illustration" />
                <g:sortableColumn property="author" title="Author" />

                <th>*</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${annonceList}" var="annonce">
                <tr>
                    <td>${annonce.title}</td>
                    <td>${annonce.description}</td>
                    <td>${annonce.price}</td>
                    <td>${annonce.status}</td>
                    <td>
                        <g:each in="${annonce.illustrations}" var="illustration">
                            <img src="${resource(dir: 'images', file: "${illustration.filename}")}">
                        </g:each>
                    </td>
                    <td>${annonce.author.username}</td>
                    <td> <a href="/annonce/edit/${annonce.id}" class="fas fa-edit"></a>
                        <a href="/annonce/show/${annonce.id}" class="fas fa-info-circle"></a></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${annonceCount ?: 0}" />
        </div>
    </div>
    </body>
</html>