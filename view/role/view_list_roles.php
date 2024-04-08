
<script type="text/javascript" src="../js/role.js?rev=<?php echo time();?>"></script>
  
 <?php include('../components/title_global_wiev.php'); header_wiev("Roles");?>

<div class="row" >
 <div class="col-md-12">
  <div class="tile" style="border-top: 3px solid #0720b7;border-radius: 5px;">

    <div class="row invoice-info">
      <div class="col-sm-4">
       <a class="btn btn-primary icon-btn btn-sm" onclick="openModalRole();"><i class="fa fa-plus-circle " aria-hidden="true" style="color: white;"></i>&nbsp;<strong style="color: white;" >Nuevo Rol</strong></a>
     </div>
     <div class="col-sm-4">
       <h5 class="" style="text-align: center;"><strong>Gestión de Roles - <?php echo date("Y"); ?></strong></h5>
     </div>
     <div class="col-sm-4">
     <div class="input-group">
        <input type="text" class="global_filter form-control" id="global_filter" placeholder="Ingresar dato a buscar"  style="border-radius: 5px;">
        <span class="input-group-addon"></span>
      </div>
   </div>
 </div>

 <table id="table_role" class="display responsive nowrap table table-sm" style="width:100%">
  <thead>
    <tr>
      <th>Id</th>
      <th>N°</th>
      <th>Nombre Rol</th>
      <th>Fecha creci&oacute;n</th>
      <th>Fecha actualizaci&oacute;n</th>
      <th>Estdo</th>
      <th>Acci&oacute;n</th>

    </tr>
  </thead>
  <tfoot>
    <tr>
      
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </tfoot>
</table>

</div>
</div>
</div>

<?php include('../components/modal_create_edit_role.php'); ?>
<?php include('../components/modal_access_user.php'); ?>

<script type="text/javascript">
 $(document).ready(function() {hideLoadingOverlay();List_roler();});
 </script>