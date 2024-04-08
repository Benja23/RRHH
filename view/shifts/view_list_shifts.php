<script type="text/javascript" src="../js/shift.js?rev=<?php echo time();?>"></script>
<?php include('../components/title_global_wiev.php'); header_wiev("Turnos");?>
<div class="row" >
 <div class="col-md-12">
  <div class="tile" style="border-top: 3px solid #0720b7;border-radius: 5px; ;">

   <table class="table table-sm" id="tableshifts">
    <thead>
      <!--<tr>
    <th></th>
    <th></th>
    <th colspan="2" style="text-align: center;background:#d1ecf1;">Turno Mañana</th>
    <th></th>
    <th colspan="2" style="text-align: center;background:#d1ecf1;">Turno Tarde</th>
    <th><button class="btn btn-primary btn-sm" id="btnregister" onclick="saveChanges(this)"><i class="fa fa-check-circle-o" aria-hidden="true"></i></button></th>
    </tr>-->
      <tr>
        <th>Número</th>
        <th>Día</th>
        <th>Hora entrada</th>
        <th>Hora salida</th>
        <th>||</th>
        <th>Hora entrada</th>
        <th>Hora salida</th>
        <th><button class="btn btn-primary btn-sm" id="btnregister" disabled onclick="saveChanges(this)"><span class="spinner-border spinner-border-sm"  style="display: none;"></span><i id="icono" class="fa fa-check-circle-o" aria-hidden="true"></i></button></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
    <tbody id="tbody_tabla_shifts">
    </tbody>
  </table>


</div>
</div>
</div>

<script type="text/javascript">
 $(document).ready(function() {hideLoadingOverlay();get_AllShifts();});
 </script>