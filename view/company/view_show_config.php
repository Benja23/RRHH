 
<script type="text/javascript" src="../js/company.js?rev=<?php echo time();?>"></script>

<?php include('../components/title_global_wiev.php'); header_wiev("Empresa");?>


<div class="row">
    <div class="col-md-12">
        <form id="companyForm" enctype="multipart/form-data" autocomplete="false" onsubmit="return false">
            <div class="tile">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="name"><strong>Nombre</strong></label>
                            <input class="form-control form-control-sm" id="name" name="name" placeholder="Ingrese el nombre">
                        </div>
                        <div class="form-group">
                            <label for="phone"><strong>Télefono</strong></label>
                            <input class="form-control form-control-sm" type="text" id="phone" name="phone" placeholder="Ingrese el teléfono">
                        </div>
                        <div class="form-group">
                            <label for="email"><strong>Correo</strong></label>
                            <input class="form-control form-control-sm" type="email" id="email" name="email" placeholder="Ingrese el correo">
                        </div>
                        <div class="form-group">
                            <label for="currency"><strong>Moneda</strong></label>
                            <input class="form-control form-control-sm" type="text" id="currency" name="currency" placeholder="Ingrese la moneda">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="address"><strong>Dirección</strong></label>
                            <input class="form-control form-control-sm" id="address" name="address" type="text" placeholder="Ingrese la dirección">
                        </div>
                        <div class="form-group">
                            <label for="ruc"><strong>Ruc</strong></label>
                            <input class="form-control form-control-sm" type="text" id="ruc" name="ruc" placeholder="Ingrese el RUC">
                        </div>
                        <div class="form-group">
                            <label for="branch"><strong>Sucursal</strong></label>
                            <input class="form-control form-control-sm" id="branch" name="branch" placeholder="Ingrese la sucursal">
                        </div>
                        <div class="form-group">
                            <label for="description"><strong>Descripción</strong></label>
                            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Ingrese la descripción"></textarea>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="flag" class="control-label"><strong>Banner</strong></label>
                            <div class="profile">
                                <div id="previewContainer">
                                    <button class="btn btn-sm text-end" onclick="removeImage('flagPreview', 'flag')" id="removeButton">
                                        <i class="fa fa-times-circle" aria-hidden="true"></i>
                                    </button>
                                    <img id="flagPreview" src="" alt="Sin Banner..." style="max-height: 100px;">
                                </div>
                                <input class="form-control" type="file" id="flag" name="flag" accept="image" onchange="previewImage(this, 'flagPreview')">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="logo" class="control-label"><strong>Logo (img*)</strong></label>
                            <div class="profile">
                                <div id="previewContainer">
                                    <button class="btn btn-sm text-end" onclick="removeImage('logoPreview', 'logo')" id="removeButton">
                                        <i class="fa fa-times-circle" aria-hidden="true"></i>
                                    </button>
                                    <img id="logoPreview" src="" alt="Sin Logo..." style="max-height: 100px;">
                                </div>
                                <input class="form-control" type="file" id="logo" name="logo" accept="image" onchange="previewImage(this, 'logoPreview')">
                            </div>
                        </div>
                        <input type="text" name="" id="phatCurrentflag" hidden>
                        <input type="text" name="" id="phatCurrentlogo" hidden>
                    </div>
                </div>
                <div class="tile-footer">
                    <button class="btn btn-info btn-sm" onclick="registerCompany(this)" type="submit"><span class="spinner-border spinner-border-sm"  style="display: none;"></span><i id="icono"  class="fa fa-check-circle-o" aria-hidden="true"></i>Actualizar</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
 $(document).ready(function() { hideLoadingOverlay() ;getCompanyDetails();});
</script>