<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <!--
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="PUT">
                <g:hiddenField name="version" value="${this.user?.version}" />
                <fieldset class="form">
                    <f:all bean="user"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    -->
    <div class="row offset-2 col-sm-8" >
    <!--<div>
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        </div>
        -->

        <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="col-sm-12" >
            <form action="/user/update/${user.id}" method="post">
                <input type="hidden" name="_method" value="PUT" id="_method" />
                <input type="hidden" name="version" value="${user.version.value}" id="version" />
                <div class="form-group">
                    <label for="inputPassword">Password*</label>
                    <input type="text" class="form-control" name="password" value="${user.password}" id="inputPassword" placeholder="votre mot de passe">
                </div>
                <div class="form-group">
                    <label for="inputUsername">Username*</label>
                    <input type="text" class="form-control" id="inputUsername" name="username" value="${user.username}" placeholder="votre nom">
                </div>

                <div class="form-group">
                    <div class="form-check">
                        <input type="hidden" name="_passwordExpired" />
                        <input type="checkbox" name="passwordExpired" value="${user.passwordExpired}" class="form-check-input" id="passwordExpired"  />
                        <label class="form-check-label" for="passwordExpired">
                            Password Expired
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-check">
                        <input type="hidden" name="_accountLocked" />
                        <input type="checkbox" name="accountLocked" value="${user.accountLocked}"   class="form-check-input" id="accountLocked"  />
                        <label class="form-check-label" for="passwordExpired">
                            Account Locked
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-check">
                        <input type="hidden" name="_accountExpired" />
                        <input type="checkbox" name="accountExpired" value="${user.accountExpired}" class="form-check-input" id="accountExpired"  />
                        <label class="form-check-label" for="accountExpired">
                            Password Expired
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-check">
                        <input type="hidden" name="_enabled" />
                        <input type="checkbox" name="enabled" checked="checked" class="form-check-input" id="enabled"  />
                        <label class="form-check-label" for="enabled">
                            Enabled
                        </label>
                    </div>
                </div>
                <input class="save btn btn-outline-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </form>
        </div>
    </div>
    </body>
</html>
