<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />

        <asset:javascript src="myFunction.js" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">

            <g:form resource="${this.annonce}" method="POST">
                <fieldset class="form">
                    <f:all bean="${annonce}"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
-->
    <div class="row offset-2 col-sm-8 ">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="col-12">
            <form action="/annonce/save" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="entrer le titre">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" class="form-control" id="description" name="description" placeholder="entrer la description">
                </div>
                <div class="form-group">
                    <label for="price">Prix</label>
                    <input type="number decimal"  class="form-control" id="price" name="price" placeholder="entrer le prix">
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input type="hidden" name="_status" />
                        <input type="checkbox" name="status" class="form-check-input" id="status"  />
                        <label class="form-check-label" for="status">
                            Status
                        </label>
                    </div>
                </div>
                <div class="pImage">
                    <label>Illustration</label>
                    <button  onclick="addimg()"  type="button" style="background:none; border:none"><i class="fa fa-plus-square"></i></button>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">upload file</div>
                        </div>
                        <input type="file" class="form-control"  >
                        <button onclick="removeimg(this)"  type="button" style="background:none; color:red;border:none"><i class="fa fa-minus-square"></i></button>
                    </div>

                </div>

                <div class="mt-2">
                    <label for="author">Author</label>
                    <select class="form-control " name="author.id"id="author" >
                        <g:each in="${params.author}" var="auth">
                            <option value="${auth.id}">${auth.username}</option>
                        </g:each>
                    </select>
                </div>

                <g:submitButton name="create" class="btn btn-primary save mt-2" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </form>
        </div>

    </div>
    </body>
</html>
