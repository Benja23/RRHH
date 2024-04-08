// config.js


function createAjaxConfig(tableName, route, controller) {
    return {
        "url": `../Controller/${route}/${controller}`,
        "type": 'POST',
        "success": function (response) {
            if (response.status) {
              $(tableName).DataTable().clear().rows.add(response.data).draw();
            } else {
              Swal.fire("Mensaje de error", response.msg, "error");
            }
             $(tableName+"_processing").css("display", "none");
        },
        "error": function (jqXHR, textStatus, errorThrown) {
          if (jqXHR.status === 403) {
            Swal.fire("Mensaje de error", jqXHR.responseJSON.msg, "error");
             } else {
             Swal.fire("Mensaje de error", errorThrown, "error");
            }
        
            $(tableName+"_processing").css("display", "none");
            $(tableName).DataTable().clear().draw();
           
        }
    };
}


/////////////////////////////////////
//CAMBIO DE ICONOS DE BUTTONES AUTOLOAD/////////
//////////////////////////////////////



///////////////////////////////////////////
////////////loading/////////////////
var contenidoPrincipal = document.getElementById("Contenido_principal");
var loadingOverlay = document.getElementById("loadingOverlay");

// Función para mostrar el overlay dentro del Contenido_principal
function showLoadingOverlay() {
  $("#contenidoPrincipal").html('');
  
  if (loadingOverlay && contenidoPrincipal) {
    contenidoPrincipal.appendChild(loadingOverlay);
    loadingOverlay.style.display = "flex";
    contenidoPrincipal.style.background = 'rgba(255, 255, 255, 0.8)'
  }
}
function hideLoadingOverlay() {
  if (loadingOverlay) {
    loadingOverlay.style.display = "none";
    contenidoPrincipal.style.background = ''
  }
}


/////////////////////////////////////
//CAMBIO DE ICONOS DE BUTTONES AUTOLOAD/////////
//////////////////////////////////////
function toggleIconChange(btn) {
btn.disabled = true;
btn.querySelector('.spinner-border').style.display = 'inline-block';
}
function toggleIconRollback(btn) {
   btn.disabled = false;
  btn.querySelector('.spinner-border').style.display = 'none';
}
/*
var loadingOverlay = document.getElementById('loadingOverlay');

// Función para mostrar el overlay
function showLoadingOverlay() {
  if (loadingOverlay) {
    loadingOverlay.style.display = 'flex';
  }
}

// Función para ocultar el overlay
function hideLoadingOverlay() {
  if (loadingOverlay) {
    loadingOverlay.style.display = 'none';
  }
}

*/
//////////////fin////////////////


 const idioma_espanol = {
      select: {
      rows: "%d fila seleccionada"
      },
      "sProcessing":     "<span class='fa-stack fa-lg'>\n\
                            <i class='fa fa-spinner fa-spin fa-stack-2x fa-fw'></i>\n\
                       </span>&emsp;Procesando....",
      "sLengthMenu":     "Mostrar _MENU_ registros",
      "sZeroRecords":    "No se encontraron resultados",
      "sEmptyTable":     "Ning&uacute;n dato disponible en esta tabla",
      "sInfo":           "Registros del (_START_ al _END_) total de _TOTAL_ registros",
      "sInfoEmpty":      "Registros del (0 al 0) total de 0 registros",
      "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix":    "",
      "sSearch":         "Buscar:",
      "sUrl":            "",
      "sInfoThousands":  ",",
      "sLoadingRecords": "<b>No se encontraron datos</b>",
      "oPaginate": {
          "sFirst":    "Primero",
          "sLast":     "Último",
          "sNext":     "Siguiente",
          "sPrevious": "Anterior"
      },
      "oAria": {
          "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
          "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
   }

   var exportButtons = [
    {
        extend:  'pdfHtml5',
        text: '<i class="fa fa-file-pdf-o"></i> PDF',
        title: 'REPORTE DE DOCENTES',
        className: 'btn btn-danger',
        style:'background-color:red'
      },{
      extend:    'print',
      text:      '<i class="fa fa-print"></i> Print',
      title: 'REPORTE DE DOCENTES',
      titleAttr: 'Imprimir',
      className: 'btn btn-info'
      },

       {
      extend:    'excel',
      text:      '<i class="fa fa-file-text-o"></i> Exel ',
      title: 'RREPORTE DE DOCENTES',
      titleAttr: 'Excel',
      className: 'btn btn-info'
      },{
      extend:    'csvHtml5',
      text:      '<i class="fa  fa-file-excel-o"></i> Csv',
      title: 'REPORTE DE DOCENTES',
      titleAttr: 'cvs',
      className: 'btn btn-info'
      }
];
var datatableConfig = {
    "ordering": true,
    "bLengthChange": false,
    "scrollCollapse": true,
    "searching": {
        "regex": true
    },
    "lengthMenu": [
        [10, 20, 50, 100, -1],
        [10, 20, 50, 100, "All"]
    ],
};



function SearchVlueSidebar(input){
 var searchValue = input.value.toLowerCase();
  // Obtener todos los elementos de la barra lateral que deseas buscar
  var sidebarItems = document.querySelectorAll('.app-menu__item');
  // Iterar sobre los elementos y mostrar/ocultar según el término de búsqueda
  sidebarItems.forEach(function(item) {
    var label = item.querySelector('.app-menu__label');
    if (label && label.textContent.toLowerCase().includes(searchValue)) {
      item.style.display = 'block'; // Mostrar elemento si coincide con el término de búsqueda
    } else {
      item.style.display = 'none'; // Ocultar elemento si no coincide con el término de búsqueda
    }
  });
}

function ButtondefaultCustomer(){
    return "<button type='button' class='editar btn btn-info btn-sm' title='editar'><i class='fa fa-edit' ></i> Editar</button>"+
     "&nbsp;<button type='button' class='role btn btn-secondary btn-sm'><i class='fa fa-cog' ></i>Accesos</button>"+
    "&nbsp;<button  type='button' class='eliminar btn btn-secondary btn-sm' title='eliminar'><i class='fa fa-trash'></i> Remover</button>";
}

function renderEstatus(data, type, row, columnName) {
    if (row.hasOwnProperty(columnName)) {
        var status = row[columnName].toString();
        if (status == "Activo" || status == 1) {
            return "<span class='badge  badge-primary'>Activo</span>";
        } else if (status == "Inactivo" || status == 0) {
            return "<span class='badge badge-secondary'>Inactivo</span>";
        }
    }
    return ""; // Si la columna no existe o el valor no coincide con "Activo", "Inactivo", "1" o "0", devolvemos un string vacío
}

 function distroysession(){
 $.post('../Controller/user/ControllerSessionActive.php',{logout:true})
      .done(function(resultado) {
         window.location.href = '../Login/login.php';
      })
      .fail(function(jqXHR, textStatus, errorThrown) {
        if (jqXHR.status === 403) {
          Swal.fire("Mensaje de error","No Autorizado.", "error");
        } else {
          Swal.fire("Mensaje de error", errorThrown, "error");
        }
      });
clearAndDeleteDatabase() ;
}

async function clearAndDeleteDatabase() {
  return new Promise((resolve, reject) => {
    var request = indexedDB.deleteDatabase('miBaseDeDatos');
    request.onerror = function (event) {
      console.log('Error al eliminar la base de datos');
    };

    request.onsuccess = function (event) {
      console.log('Base de datos eliminada con éxito');
      
    };
  });
}

// Ejecutar la función y olvidarse del resultado
clearAndDeleteDatabase()
  .then(() => console.log('Operación completada exitosamente'))
  .catch(error => console.error('Error:', error));