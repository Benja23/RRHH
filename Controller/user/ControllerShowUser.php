<?php 
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
 if (isset($_SESSION['username'])) {
     setcookie("activo", 1, time() + 3600);
     
          $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
          
        require '../Base/Controller_data.php';
        if (trim($id) !== clean_input_characters($id)) {
           $response = array('status' => false, 'auth' => false, 'msg' => 'Solicitud incorrecta', 'data' => '');
           
            echo json_encode($response);
            return;
         }
        require '../../Models/models_usuarios.php';
         $user = new Usuario();
         $response =$user->ShowUser($id);
         echo json_encode($response);
    } else {
        $response = array('status' => false, 'auth' => false, 'msg' => 'No Autorizado', 'data' => '');
        http_response_code(403);
        echo json_encode($response);
        return;
    }

}else {
    $response = array('status' => false,'auth' => false,'msg' => 'SOLO SE PUEDE POST.','data'=> '' ,'tipo'=>'alert-danger');
    http_response_code(405);
    echo json_encode($response);
}
//listo
 ?>