<?php
session_start();
if(isset($_SESSION['username'])){
  header('Location: ../view/home.php');
  exit; // Añade esta línea para detener la ejecución del script después de redireccionar
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login | sistem</title>
  </head>
  <style>
.swal2-popup{
  font-size:0.7rem !important;
}
#namesistem{
  font-size: 10px;
}
#body_fonnd:before {
    content: '';
    position: fixed;
    width: 100vw;
    height: 100vh;
    /*background-image: url(https://i.postimg.cc/8cf6v1rk/1.jpg);*/
  background-image: url('../images/banner.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    -webkit-background-size: cover;
    filter: blur(3px);
}

</style>
  <body id="body_fonnd">
  
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
       
      </div>
      <div class="login-box" style="border-radius: 10px">
        <div class="login-form" autocomplete="false" onsubmit="verifyUser(this); return false;">
          <h3 class="login-head">
            <img src="../images/logo.png">
            <p id="namesistem" class="semibold-text mb-2">Sistema de Gestión de Recursos Humanos</p></h3>
            
          <div class="form-group">
          	<div id="msg_login"></div>
            <label class="control-label">USERNAME</label>
            <input class="form-control" type="text" placeholder="Email" id="txt_user" autofocus autocomplete="off">
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" placeholder="Password" id="text_paswoed">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label>
              </div>
             
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block" onclick="verifyUser(this)"><span class="spinner-border spinner-border-sm"  style="display: none;"></span><i id="icono"  class="fa fa-check-circle-o" aria-hidden="true"></i>Ingresar</button>
          </div>
        </div>
       
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="../Public/jquery-3.3.1.min.js"></script>
    <script src="../Public/popper.min.js"></script>
    <script src="../Public/bootstrap.min.js"></script>
    <script src="../Public/main.js"></script>
        <script type="text/javascript" src="../Public/plugins/sweetalert2/sweetalert2.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="../Public/plugins/pace.min.js"></script>
      <script src="../js/config.js"></script>
     <script src="../js/user.js"></script>

  
  </body>
</html>