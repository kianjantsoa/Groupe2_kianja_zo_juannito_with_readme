
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title><g:message code='springSecurity.login.title'/></title>

  <!-- Google Font: Source Sans Pro-->
  <asset:stylesheet src="all.min.css"/>
  <asset:stylesheet src="icheck-bootstrap.min.css"/>
  <asset:stylesheet src="adminlte.min.css"/>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>Lecoincoin</b>Admin
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">

      <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" class="form-control" name="${passwordParameter ?: 'password'}" id="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <!-- /.col -->
          <div class="col-4">
          <input type="submit" id="submit" class="btn btn-primary btn-block" value="${message(code: 'springSecurity.login.button')}"/>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <!-- /.social-auth-links -->


    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

</body>
</html>