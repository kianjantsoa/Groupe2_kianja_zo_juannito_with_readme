<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
    <div class="row offset-2 col-sm-8" >
        <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

            <div class="col-sm-12" >
                <form action="/user/save" method="post">
                    <div class="form-group">
                        <label for="inputPassword">Password*</label>
                        <input type="text" class="form-control" name="username" id="inputPassword" placeholder="votre mot de passe">
                    </div>
                    <div class="form-group">
                        <label for="inputUsername">Username*</label>
                        <input type="text" class="form-control" id="inputUsername" name="password" placeholder="votre nom">
                    </div>

                    <div class="form-group">
                        <div class="form-check">
                            <input type="hidden" name="_passwordExpired" />
                            <input type="checkbox" name="passwordExpired" class="form-check-input" id="passwordExpired"  />
                            <label class="form-check-label" for="passwordExpired">
                                Password Expired
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-check">
                            <input type="hidden" name="_accountLocked" />
                            <input type="checkbox" name="accountLocked" class="form-check-input" id="accountLocked"  />
                            <label class="form-check-label" for="passwordExpired">
                                Account Locked
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-check">
                            <input type="hidden" name="_accountExpired" />
                            <input type="checkbox" name="accountExpired" class="form-check-input" id="accountExpired"  />
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
                  <!--  <div class="col-sm-4 mb-2">
                        <label class="form-check-label" for="role">Role </label>
                        <select class="custom-select" id="role" name="role">
                            <option value="1">ROLE_ADMIN</option>
                            <option value="2">ROLE_MODO</option>
                            <option value="3">ROLE_CLIENT</option>
                        </select>
                    </div> -->
                    <g:submitButton name="create" class="btn btn-primary save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </form>
            </div>
    </div>
</body>
</html>