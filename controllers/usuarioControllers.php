<?php
//TODO: Se incluyen los archivos de configuración y modelo necesarios
require_once ("../config/conexion.php");
require_once ("../models/usuarioModels.php");

//TODO: Se instancia un objeto de la clase usuarioModels
$usuario = new usuarioModels();

//TODO: Se realiza una operación basada en el valor de $_GET["op"]
switch ($_GET["op"]) {
    case 'guardaryeditar':
        //TODO: Si no se recibe el campo usuarioId en el formulario, se inserta un nuevo usuario
        if (empty($_POST["usuarioId"])) {
            $usuario->insert_usuario($_POST["usuarioNombre"], $_POST["usuarioCorreo"], $_POST["usuarioPassword"]);
        } else {
            //TODO: Si se recibe el campo usuarioId en el formulario, se actualiza el usuario existente
            $usuario->update_usuario($_POST["usuarioId"], $_POST["usuarioNombre"] , $_POST["usuarioCorreo"], $_POST["usuarioPassword"]);
        }
        break;
    case 'listar':
        //TODO: Se obtienen los datos de los usuarios
        $datos = $usuario->get_usuarios();
        $data = Array();
        //TODO: Se itera sobre los datos obtenidos para construir el array $data
        foreach ($datos as $row) {
            $sub_array = array();
            $sub_array[] = $row["usuarioNombre"];
            $sub_array[] = $row["usuarioCorreo"];
            $sub_array[] = $row["usuarioPassword"];
            $sub_array[] = '<button type="button" onClick="editar('.$row["usuarioId"].')" id="'.$row["usuarioId"].'" class="btn btn-warning btn-xs">Editar</button>';
            $sub_array[] = '<button type="button" onClick="eliminar('.$row["usuarioId"].')" id="'.$row["usuarioId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
           $data[] = $sub_array;
        }

        //TODO: Se prepara la respuesta en formato JSON
        $results = array(
            "sEcho" => 1,
            "iTotalRecords" => count($data),
            "iTotalDisplayRecords" => count($data),
            "aaData" => $data
        );

        echo json_encode($results);
        break;
    case 'mostrar':
        //TODO: Se obtienen los datos de un usuario específico por su ID
        $datos = $usuario->get_usuario_by_id($_POST["usuarioId"]);
        if (is_array($datos) == true and count($datos) > 0) {
            foreach ($datos as $row) {
                $output["usuarioId"] = $row["usuarioId"];
                $output["usuarioNombre"] = $row["usuarioNombre"];
                $output["usuarioCorreo"] = $row["usuarioCorreo"];
                $output["usuarioPassword"] = $row["usuarioPassword"];
                $output["usuarioEstado"] = $row["usuarioEstado"];
            }
            echo json_encode($output);
        }
        break;
    case 'eliminar':
        //TODO: Se elimina un usuario por su ID
        $usuario->delete_usuario($_POST["usuarioId"]);
        break;

    //TODO: Código para operación combo
    case 'combo':
        $datos = $usuario->get_usuarios();
        if (is_array($datos) == true and count($datos) > 0) {
            $html="";
            $html="<option selected>Seleccionar</option>";
            foreach ($datos as $row) {
                $html.="<option value='".$row["usuarioId"]."'>".$row["usuarioNombre"]."</option>";
            }
            echo $html;
        }
        break;
}
?>
