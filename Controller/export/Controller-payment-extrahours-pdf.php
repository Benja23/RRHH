<?php
require '../../Public/dompdf/vendor/autoload.php';
use Dompdf\Dompdf;
use Dompdf\Options;

// Recibir los datos del cuerpo de la solicitud POST
$record = json_decode(file_get_contents("php://input"), true);
$company = $record["company"];
$data = $record['data']; // Contiene los resultados filtrados

$persona= $data[0];
date_default_timezone_set('America/New_York'); 
$totalDay = 0;
$totalAdl = 0;
$totalExt = 0;

 $escudoImagen = "../../images/logo.png";
$escudoBase64 = "data:image/png;base64," . base64_encode(file_get_contents($escudoImagen));

try {
    // Crear un objeto de opciones para Dompdf
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isPhpEnabled', true);

    // Inicializar Dompdf
    $dompdf = new Dompdf($options);

    // Crear el contenido del PDF con los datos recibidos
    $html = '<html>
    <head>
        <style type="text/css">
      * {
    font-size: 12px;
    font-family: "Times New Roman";
}

td,
th,
tr,
table {
    border-top: 1px solid black;
    border-collapse: collapse;
}

td.description,
th.description {
    width: 75px;
    max-width: 75px;
}

td.quantity,
th.quantity {
    width: 40px;
    max-width: 40px;
    word-break: break-all;
}

td.price,
th.price {
    width: 40px;
    max-width: 40px;
    word-break: break-all;
}

.centered {
    text-align: center;
    align-content: center;
}

.ticket {
    width: 155px;
    max-width: 155px;
}

img {
    max-width: inherit;
    width: inherit;
}
.negrita {
 font-weight: bold;
 }

@media print {
    .hidden-print,
    .hidden-print * {
        display: none !important;
    }
}
    </style>
    </head>
    <body>';


    
    // Añadir la estructura HTML
    $html .= '<div class="ticket">
           
             <img  src="<?php echo $escudoBase64 ?>" width="100%">
            <p class="centered">'.$company['name'].'
                <br>Nombres: '.$persona['Nombre'].'
                <br>Apellidos: '.$persona['Apellidos'].'
                <br>Dni(Cédula): '.$persona['Dni'].'</p>
            <table>
                <thead>
                    <tr>
                        <th class="quantity">N°</th>
                        <th class="description">Registo</th>
                        <th class="price">tipo</th>
                        <th class="price">Cant. Horas</th>
                        <th class="price">Monto ( '.$company['currency'].')</th>
                    </tr>
                </thead>
                <tbody>';


              
                foreach ($data as $index => $record) {
                    $totalDay += floatval($record['monto']);
                    $html .= '<tr>
                    <td class="quantity">' . ($index + 1) . '</td>
                    <td class="description">' . $record['fechas'] . '</td>
                    <td class="description">' . $record['descripcion'] . '</td>
                    <td class="description">' . $record['idhextra'] . '</td>
                    <td class="description">' . number_format($record['monto'], 2) . '</td>
                    </tr>';
                }

            $html .= '<tr class="negrita">
                         <td></td>
                         <td></td>
                         <td></td>
                        <td class="" >Total</td>
                        <td class="">'.number_format($totalDay, 2).' '.$company['currency'].'</td>
                    </tr>
                </tbody>
            </table>
            <p class="centered">Gracias por su preferencia!
                <br>'.date('Y-m-d H:i:s').'</p>
        </div>';
    

   

    // Cerrar las etiquetas body y html
    $html .= '</body></html>';

    // Cargar el HTML en Dompdf
    $dompdf->loadHtml($html);

    // Establecer el tamaño del papel y la orientación
    $dompdf->setPaper('A4', 'portrait');

    // Renderizar el PDF
    $dompdf->render();

    // Establecer el encabezado para indicar que es un archivo PDF
    header('Content-Type: application/pdf');

    // Enviar el archivo PDF al navegador
    echo $dompdf->output();

    // Terminar la ejecución del script para evitar la adición de cualquier contenido adicional
    exit();
} catch (Exception $e) {
    echo 'Error al generar el PDF: ', $e->getMessage();
    exit();
}
