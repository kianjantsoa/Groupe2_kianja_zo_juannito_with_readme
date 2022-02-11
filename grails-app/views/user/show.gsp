<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
        <div class="form-group">
            <label for="inputPassword">Password*</label>
            <input readonly type="text" class="form-control" name="password" value="${user.password}" id="inputPassword" placeholder="votre mot de passe">
        </div>
        <div class="form-group">
            <label for="inputUsername">Username*</label>
            <input readonly type="text" class="form-control" id="inputUsername" name="username" value="${user.username}" placeholder="votre nom">
        </div>

        <div class="form-group">
            <div class="form-check">
                <input readonly type="hidden" name="_passwordExpired" />
                <g:if test="${user.passwordExpired == true}">
                    <input readonly type="checkbox" name="passwordExpired"   checked="checked" class="form-check-input" id="passwordExpired"  />
                </g:if>
                <g:else>
                    <input readonly type="checkbox" name="passwordExpired"   class="form-check-input" id="passwordExpired"  />
                </g:else>
                <label class="form-check-label" for="passwordExpired">
                    Password Expired
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="form-check">
                <input readonly type="hidden" name="_accountLocked" />
                <g:if test="${user.accountLocked == true}">
                    <input readonly type="checkbox" name="accountLocked"   checked="checked" class="form-check-input" id="accountLocked"  />
                </g:if>
                <g:else>
                    <input readonly type="checkbox" name="accountLocked"      class="form-check-input" id="accountLocked"  />
                </g:else>
                <label class="form-check-label" for="passwordExpired">
                    Account Locked
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="form-check">
                <input readonly type="hidden" name="_accountExpired" />
                <g:if test="${user.accountExpired == true}">
                    <input readonly type="checkbox" name="accountExpired"  checked="checked" class="form-check-input" id="accountExpired"  />
                </g:if>
                <g:else>
                    <input readonly type="checkbox" name="accountExpired"   class="form-check-input" id="accountExpired"  />
                </g:else>
                <label class="form-check-label" for="accountExpired">
                    Password Expired
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="form-check">
                <input readonly type="hidden" name="_enabled" />
                <g:if test="${user.enabled == true}">
                    <input readonly type="checkbox" name="enabled" checked="checked" class="form-check-input" id="enabled"  />
                </g:if>
                <g:else>
                    <input readonly type="checkbox" name="enabled"  class="form-check-input" id="enabled"  />
                </g:else>
                <label class="form-check-label" for="enabled">
                    Enabled
                </label>
            </div>
        </div>
        <g:form resource="${this.user}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="btn btn-primary save mt-2 " type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </body>
</html>
