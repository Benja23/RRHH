<?php

require_once 'Model/model_validations.php';
class Entry{
    private $conexion;
    private $validations;
 

    public function __construct() {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
        $this->validations = new Validations($this->conexion);
       
    }  

function Register_Entry($user_code,$typr,$userId){
   if ($this->verificationCode($user_code)==false)  return array('status' => false, 'auth' => true, 'msg' => 'Código ingresado es incorrecto');
   
    date_default_timezone_set('America/Lima');
   $dateCurrent = new DateTime('now');
   $dayNumber = $dateCurrent->format('N');
   $shift = $this->getShiftsByDay($dayNumber);
   $dateOnly = $dateCurrent->format('Y-m-d');
   $timeEntry = $dateCurrent->format('Y-m-d H:i:s');

    if ($shift=== null)  return array('status' => false, 'auth' => true, 'msg' => 'No se encontró turno para el día proporcionado.');
    
    //TURNO MAÑANA REGISTRAMOS
    if($shift['shift'] ==='morning'){
         $name_shift='T_MORNING';
        if($this->isRegistrationAlreadyExists($user_code, $dayNumber, $dateOnly,$name_shift))
         return array('status' => false, 'auth' => true, 'msg' => 'Ya estas registrado en el turno MAÑANA DE HOY');
        

        return $this->registerEntry($userId,$user_code,$dateOnly, $dateCurrent->format('H:i:s'), null, $shift['id'], $shift['day_name'], $type='normal', $status=1, $shift['day_number'], $name_shift, $observation='');
      //TURNO TARDE REGISTRAMOS
    }elseif($shift['shift'] === 'afternoon'){
         $name_shift='T_AFTERNOON';

         if($this->isRegistrationAlreadyExists($user_code, $dayNumber, $dateOnly,$name_shift))
             return array('status' => false, 'auth' => true, 'msg' => 'Ya estas registrado en el turno TARDE DE HOY');
         
         
           return $this->registerEntry($userId,$user_code,$dateOnly, $dateCurrent->format('H:i:s'), null, $shift['id'], $shift['day_name'], $type='normal', $status=1, $shift['day_number'], $name_shift, $observation='');

    }else{
       return array('status' => false, 'auth' => true, 'msg' => 'No hay turnos disponible para este momento');  
    }
   
}


 function registerEntry($userId,$user_code, $date, $timeEntry, $timeExit, $shiftId, $dayName, $type, $status, $dayNumber,$name_shift, $observation) {

        $sql = "insert INTO entry (user_id,user_code, date, time_entry, time_exit, shift_id, day_name, type, status, day_number,name_shift, observation, created_at, updated_at) 
        VALUES (?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?,?, NOW(), NOW())";
        $stmt = $this->conexion->conexion->prepare($sql);
        $stmt->bind_param("issssisssiss", $userId,$user_code, $date, $timeEntry, $timeExit, $shiftId, $dayName, $type, $status, $dayNumber,$name_shift, $observation);

        if ($stmt->execute()) {
            return array('status' => true, 'auth' => true, 'msg' => 'Registro exitoso', 'data' => '');
        } else {
            return array('status' => false, 'auth' => true, 'msg' => 'Error en la inserción: ' . $stmt->error, 'data' => '');
        }
        

       

  }

   function updateEntry($userId, $date,  $timeExit, $observation) {
   
        $sql = "update entry SET  time_exit = ?, observation = ?, updated_at = NOW() WHERE date = ? and user_id= ? ";
        $stmt = $this->conexion->conexion->prepare($sql);
        $stmt->bind_param("sssi", $timeExit,  $observation,$date,$userId);

        if ($stmt->execute()) {
            return array('status' => true, 'auth' => true, 'msg' => 'Actualización exitosa', 'data' => '');
        } else {
            return array('status' => false, 'auth' => true, 'msg' => 'Error en la actualización: ' . $stmt->error, 'data' => '');
        }
    }




function isRegistrationAlreadyExists($user_code, $numberDay, $dateCurrent,$name_shift) {
    $sql = "SELECT time_entry FROM entry WHERE user_code = ? AND day_number = ? AND date = ? AND name_shift=?";
    $stmt = $this->conexion->conexion->prepare($sql);
    $stmt->bind_param("siss", $user_code, $numberDay, $dateCurrent,$name_shift);

    if ($stmt->execute()) {
        $stmt->store_result(); // Almacenar el resultado para contar las filas
        $rowCount = $stmt->num_rows;

        return $rowCount > 0; // Devolver true si hay al menos una fila, false en caso contrario
    } else {
        return false;
    }
}

function verificationCode($code) {
    $sql = "SELECT code FROM users WHERE code = ?";
    $stmt = $this->conexion->conexion->prepare($sql);
    $stmt->bind_param("s", $code);

    if ($stmt->execute()) {
        $stmt->store_result(); // Almacenar el resultado para contar las filas
        $rowCount = $stmt->num_rows;

        return $rowCount > 0; // Devolver true si hay al menos una fila, false en caso contrario
    } else {
        return false;
    }
}

 function getShiftsByDay($dayNumber)
{
$sql = "SELECT id, day_number, day_name, morning_entry_time, morning_exit_time, afternoon_entry_time, afternoon_exit_time FROM shifts WHERE day_number = ?";
$stmt = $this->conexion->conexion->prepare($sql);
$stmt->bind_param("i", $dayNumber);

if ($stmt->execute()) {
    $result = $stmt->get_result();
    $shift = $result->fetch_assoc();

    // Get the current time
    date_default_timezone_set('America/Lima');
    $currentHour = new DateTime('now');

    // Convert shift hours to DateTime objects for comparison
    $morningEntryTime = DateTime::createFromFormat('H:i:s', $shift['morning_entry_time']);
    $morningExitTime = DateTime::createFromFormat('H:i:s', $shift['morning_exit_time']);
    $afternoonEntryTime = DateTime::createFromFormat('H:i:s', $shift['afternoon_entry_time']);
    $afternoonExitTime = DateTime::createFromFormat('H:i:s', $shift['afternoon_exit_time']);
    
    $morningEntryTime->modify('-1 minute');
    $afternoonEntryTime->modify('-1 minute');
    
    // Add one minute to exit times
    $morningExitTime->modify('+1 minute');
    $afternoonExitTime->modify('+1 minute');

    // Compare with the current time and determine the shift
    if ($currentHour >= $morningEntryTime && $currentHour <= $morningExitTime) {
        $shift['shift'] = 'morning';
    } elseif ($currentHour >= $afternoonEntryTime && $currentHour <= $afternoonExitTime) {
        $shift['shift'] = 'afternoon';
    } else {
        $shift['shift'] = 'out_of_shift';
    }

    return $shift;
} else {
    return null;
}

    
}


function automaticBackground() {
    date_default_timezone_set('America/Lima');
    $dateCurrent = new DateTime('now');
    $dayNumber = $dateCurrent->format('N');
    $dateOnly = $dateCurrent->format('Y-m-d');
    $users = $this->getUserAssisted();
    $shift = $this->getShiftsByDay($dayNumber);

    if ($users) {
        foreach ($users as $user) {
           if($user['name_shift']==='T_MORNING'){
             $name_shift='T_MORNING';

             $horaEnBD = DateTime::createFromFormat('H:i:s', $shift['morning_exit_time']);
             if ($horaEnBD < $dateCurrent->modify('+1 minute')) {
                $result = $this->updateEntryBackground($user['user_id'], $dateOnly,  $horaEnBD->format('H:i:s'), $name_shift);
                if ($result !== true)  return array('status' => true, 'auth' => true, 'msg' => 'Error en la actualización: '.$name_shift);

            }
            }if ($user['name_shift']==='T_AFTERNOON') {
              $name_shift='T_AFTERNOON';
              $horaEnBD = DateTime::createFromFormat('H:i:s', $shift['afternoon_exit_time']);
              if ($horaEnBD < $dateCurrent->modify('+1 minute')) {
                $result = $this->updateEntryBackground($user['user_id'], $dateOnly,  $horaEnBD->format('H:i:s'), $name_shift);
                if ($result !== true)  return array('status' => true, 'auth' => true, 'msg' => 'Error en la actualización: '.$name_shift);

            }

           } else continue;
    
        }
    } else  return array('status' => false, 'auth' => true, 'msg' => 'No hay usuarios asistidos');

   return array('status' => true, 'auth' => true, 'msg' => 'Las horas de salidas se actualizaron con estado de'.$dateOnly);

}


function updateEntryBackground($userId, $date, $timeExit, $name_shift) {
    $sql = " update entry SET time_exit = ?, updated_at = NOW() WHERE date = ? AND user_id = ? AND name_shift = ?";
    $stmt = $this->conexion->conexion->prepare($sql);
    $stmt->bind_param("ssis", $timeExit, $date, $userId, $name_shift);

    if ($stmt->execute()) {
        return true;
    } else {
        return false;
    }
}

    

function getUserAssisted() {
    $status = 1; $type='normal';
    date_default_timezone_set('America/Lima');
   $dateCurrent = new DateTime('now');
   $dateOnly = $dateCurrent->format('Y-m-d');

    $sql = "select user_id,name_shift FROM entry WHERE status = ? and date =? and type=?";
    $stmt = $this->conexion->conexion->prepare($sql);
    $stmt->bind_param("iss", $status,$dateOnly,$type);

    if ($stmt->execute()) {
        $result = $stmt->get_result();
        $users = $result->fetch_all(MYSQLI_ASSOC);
        return $users;
    } else {
        return false;
    }
}

function ListAllHoursGroupMonth($isadmi) {
   /////////// vertion obsoleto
    /*$id_user = isset($isadmi) ? $isadmi : null;

    $sql = "select user_id, users.name, users.lastname, users.code, entry.type, MONTH(date) AS month, 
            TIME_FORMAT(SEC_TO_TIME(SUM(ABS(TIME_TO_SEC(TIMEDIFF(time_exit, time_entry))))), '%H:%i:%s') AS total_time
            FROM entry INNER JOIN users ON users.iduser = entry.user_id";

  if ($id_user !=null) {
        $sql .= " WHERE entry.user_id = ?";
    }

    $sql .= " GROUP BY month, entry.user_id";

    // Utilizar sentencias preparadas para evitar problemas de seguridad y formato
    $stmt = $this->conexion->conexion->prepare($sql);

    if ($id_user != null) {
        $stmt->bind_param("i", $id_user);
    }*/

      $id_user = isset($isadmi) ? $isadmi : null;

        $sql = "SELECT user_id, users.name, users.lastname, users.code, entry.type, MONTH(date) AS month, 
                TIME_FORMAT(SEC_TO_TIME(SUM(ABS(TIME_TO_SEC(TIMEDIFF(time_exit, time_entry))))), '%H:%i:%s') AS total_time
                FROM entry INNER JOIN users ON users.iduser = entry.user_id";

        if ($id_user != null) {
            $sql .= " WHERE entry.user_id = ?";
        }

        $sql .= " GROUP BY month, entry.user_id, entry.type";

        // Utilizar sentencias preparadas para evitar problemas de seguridad y formato
        $stmt = $this->conexion->conexion->prepare($sql);

        if ($id_user != null) {
            $stmt->bind_param("i", $id_user);
        }

    $stmt->execute();
    $result = $stmt->get_result();

    if ($result) {
        $month = $this->fetchMonthData($result);
        $stmt->close();
        return array('status' => true, 'auth' => true, 'msg' => 'Datos recuperados con éxito', 'data' => $month);
    } else {
        $stmt->close();
        return array('status' => false, 'auth' => true, 'msg' => 'Error al recuperar los datos' . $stmt->error, 'data' => '');
    }
}
private function fetchMonthData($result) {
    $month = array();
    $meses = array(
        1 => 'Enero', 2 => 'Febrero', 3 => 'Marzo', 4 => 'Abril', 5 => 'Mayo', 6 => 'Junio',
        7 => 'Julio', 8 => 'Agosto', 9 => 'Septiembre', 10 => 'Octubre', 11 => 'Noviembre', 12 => 'Diciembre'
    );

    while ($row = $result->fetch_assoc()) {
        // Convertir el número del mes a su nombre correspondiente en español
        $row['month'] = $meses[$row['month']];
        $month[] = $row;
    }

    return $month;
}



function ListAllHoursByIdUser($id_user){
     $sql = "SELECT id,entry.user_id, users.name, users.lastname,name_shift, entry.date, entry.time_entry, entry.time_exit,
        TIME_FORMAT(ABS(TIMEDIFF(entry.time_exit, entry.time_entry)), '%H:%i:%s') AS total_time,day_name,day_number
     FROM entry INNER JOIN users ON users.iduser = entry.user_id where user_id = $id_user";
            $result = $this->conexion->conexion->query($sql);

    if ($result) {
        $sumary = array();
        $meses = array(1 => 'Lunes',2 => 'Martes',  3 => 'Miercoles',4 => 'Jueves', 5 => 'Viernes', 6 => 'Sábado', 7 => 'Domingo'
        );

        while ($row = $result->fetch_assoc()) {
            // Convertir el número del mes a su nombre correspondiente en español
            $row['day_number'] = $meses[$row['day_number']];
            $sumary[] = $row;
        }

        return array('status' => true, 'auth' => true, 'msg' => 'Datos recuperados con éxito', 'data' => $sumary);
    } else {
        return array('status' => false, 'auth' => true, 'msg' => 'Error al recuperar los datos' . $stmt->error, 'data' => '');
    }
}


}

 ?>