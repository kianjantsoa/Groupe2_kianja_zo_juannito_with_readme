<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <div class="col-12">
            <div class="form-group">
                <label for="title">Title</label>
                <input readonly type="text" class="form-control" value="${this.annonce.title}" name="title" id="title" placeholder="entrer le titre">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input readonly type="text" class="form-control" value="${this.annonce.description}" id="description" name="description" placeholder="entrer la description">
            </div>
            <div class="form-group">
                <label for="price">Prix</label>
                <input readonly type="number decimal"   class="form-control" value="${this.annonce.price.toString().replace('.',',')}" id="price" name="price" placeholder="entrer le prix">
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input readonly type="hidden" name="_status" />
                    <g:if test="${this.annonce.status == false}">
                        <input readonly type="checkbox" name="status" class="form-check-input" value="${this.annonce.status}"  id="status"  />
                    </g:if>
                    <g:else>
                        <input readonly type="checkbox" name="status" class="form-check-input" checked="checked"  id="status"  />
                    </g:else>
                    <label class="form-check-label" for="status">
                        Status
                    </label>
                </div>
            </div>

            <div id="illustrationList">
                <g:each in="${this.annonce.illustrations}" var="illustration">
                    <img src="${resource(dir: 'images', file: "${illustration.filename}")}">
                </g:each>

            </div>

            <div class="mt-2">
                <label for="author">Author</label>
                <input readonly type="text"   class="form-control" value="${this.annonce.author.username}" id="author" name="author" placeholder="">
            </div>

        <g:form resource="${this.annonce}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="btn btn-primary save mt-2 " type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
    </body>
</html>
