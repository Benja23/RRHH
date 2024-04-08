<?php
session_start();
if(!isset($_SESSION['username'])){
  header('Location: ../Login/login.php'); 
}
require_once "../Public/Config/config.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
  <!-- Twitter meta-->

  <title>HR365 | Home</title>
  <link rel="shortcut icon" href="../images/logo.png">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <link rel="stylesheet" type="text/css" href="../css/responsive.css">
  <link rel="stylesheet" href="../Public/DataTables/datatables.min.css">
  <!-- Font-icon css-->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body class="app sidebar-mini">
    <!-- LOADING-->
    
  <!-- Navbar-->
  <header class="app-header"><a class="app-header__logo" href="#">HR365</a>
    <!-- Sidebar toggle button-->
    <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <?php include 'menu/app-nav/app-nav.php' ?>
  </header>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="app-sidebar">

   <?php include'menu/sidebar/sidebar_App.php' ?>
 </aside>
 <main class="app-content">
   <style>
    .swal2-popup{
      font-size:0.7rem !important;
    }
  </style>

  <div id="Contenido_principal">
      <div class="loading-overlay" id="loadingOverlay">
    <img src="../images/loading/ajax-loader.gif" alt="Loading" class="loading-spinner">
    <img src="../images/loading/icon.png" alt="Logo" class="loading-logo">
  </div>
  </div>

  <?php include'menu/fotter/app-fotter.php' ?>
</main>

<!-- Content End -->
<!-- Essential javascripts for application to work-->
<script src="../Public/jquery-3.3.1.min.js"></script>
<script src="../Public/popper.min.js"></script>
<script src="../Public/bootstrap.min.js"></script>
<script src="../Public/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../Public/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



<script src="../Public/DataTables/datatables.min.js"></script>
<script src="../Public/DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../js/config.js"></script>
<script src="../js/dashboard.js"></script>
<script src="../js/user.js"></script>

<script type="text/javascript" src="../Public/plugins/sweetalert2/sweetalert2.js"></script>


<script type="text/javascript">
  
  $(document).ready(function() {
    /*CARGAR DASHBOARD*/
     <?php if (isAccess(1)) { ?>
        cargar_contenido('Contenido_principal', 'dashboard/view_dashboard.php');  
        <?php } ?>

        getCompanyDetails();
  });

  function cargar_contenido(contenedor,contenido){
    
    showLoadingOverlay();
   $("#"+contenedor).load(contenido);
   detectarTamañoPantalla();
 }
    // Función para detectar el tamaño de la pantalla
    function detectarTamañoPantalla() {
      var anchoPantalla = window.innerWidth;
      var bodyElement = document.querySelector('body');
  // Agregar la clase "sidenav-toggled" en dispositivos móviles
  if (anchoPantalla <= 767) {
    bodyElement.classList.remove('sidenav-toggled');
  } else {
    //bodyElement.classList.add('sidenav-toggled');
  }
}
//agregar la clase "active" al elemento <a> sin interferir con la funcionalidad existente
function toggleActiveClass(elemento) {
  // Obtener todos los elementos relevantes
  var elementos = document.querySelectorAll('.app-menu__item');
  // Eliminar la clase "active" de todos los elementos
  for (var i = 0; i < elementos.length; i++) {
    elementos[i].classList.remove('active');
  }
  // Agregar la clase "active" al elemento actual
  elemento.classList.add('active');
}

async function getCompanyDetails() {
    const companyId = 1;
    const url = `../Controller/company/ControllerEditCompany.php?id=${companyId}`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        if (data.status) {
           // console.log(data.data);
           await saveCompanyDataToIndexedDB(data.data)
        } else {
            console.log('Error: La compañía no se encontró.');
        }
    } catch (error) {
        console.error('Error al realizar la solicitud:', error);
    }
}

async function saveCompanyDataToIndexedDB(data) {
    const dbName = 'miBaseDeDatos';
    const version = 1;

    const db = await new Promise((resolve, reject) => {
        const request = window.indexedDB.open(dbName, version);

        request.onerror = event => {
            reject(new Error(`Error al abrir la base de datos: ${event.target.errorCode}`));
        };

        request.onsuccess = event => {
            resolve(event.target.result);
        };

        request.onupgradeneeded = event => {
            const db = event.target.result;
            const objectStore = db.createObjectStore('empresas', { keyPath: 'id' });
            // Puedes definir índices adicionales si es necesario
            objectStore.createIndex('name', 'name', { unique: false });
            // ...
        };
    });

    const transaction = db.transaction('empresas', 'readwrite');
    const objectStore = transaction.objectStore('empresas');
    objectStore.add(data);

    console.log('Datos guardados en IndexedDB');
}


</script>
<!-- Google analytics script-->

</body>
</html>