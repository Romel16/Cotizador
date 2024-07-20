<?php
//TODO: Se incluyen los archivos de configuración y modelo necesarios
require_once ("../config/conexion.php");
require_once ("../models/contactoModels.php");

//TODO: Se instancia un objeto de la clase contactoModels
$contacto = new contactoModels();

//TODO: Se realiza una operación basada en el valor de $_GET["op"]
switch ($_GET["op"]) {
    case 'guardaryeditar':
        //TODO: Si no se recibe el campo contactoId en el formulario, se inserta un nuevo contacto
        if (empty($_POST["contactoId"])) {
            $contacto->insert_contact($_POST["clienteId"], $_POST["cargoId"], $_POST["contactoNombre"], $_POST["contactoEmail"], $_POST["contactoTelefono"]);
        } else {
            //TODO: Si se recibe el campo contactoId en el formulario, se actualiza el contacto existente
            $contacto->update_contact($_POST["contactoId"], $_POST["clienteId"], $_POST["cargoId"], $_POST["contactoNombre"], $_POST["contactoEmail"], $_POST["contactoTelefono"]);
        }
        break;
    case 'listar':
        //TODO: Se obtienen los datos de los contactos
        $datos = $contacto->get_contacts();
        $data = Array();
        //TODO: Se itera sobre los datos obtenidos para construir el array $data
        foreach ($datos as $row) {
            $sub_array = array();
            $sub_array[] = $row["clienteNombre"];
            $sub_array[] = $row["cargoNombre"];
            $sub_array[] = $row["contactoNombre"];
            $sub_array[] = $row["contactoEmail"];
            $sub_array[] = $row["contactoTelefono"];
            $sub_array[] = '<button type="button" onClick="editar('.$row["contactoId"].')" id="'.$row["contactoId"].'" class="btn btn-warning btn-xs">Editar</button>';
            $sub_array[] = '<button type="button" onClick="eliminar('.$row["contactoId"].')" id="'.$row["contactoId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
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
        //TODO: Se obtienen los datos de un contacto específico por su ID
        $datos = $contacto->get_contact_by_id($_POST["contactoId"]);
        if (is_array($datos) == true and count($datos) > 0) {
            foreach ($datos as $row) {
                $output["contactoId"] = $row["contactoId"];
                $output["contactoClienteId"] = $row["contactoClienteId"];
                $output["contactoCargoId"] = $row["contactoCargoId"];
                $output["contactoNombre"] = $row["contactoNombre"];
                $output["contactoEmail"] = $row["contactoEmail"];
                $output["contactoTelefono"] = $row["contactoTelefono"];
            }
            echo json_encode($output);
        }
        break;
    case 'eliminar':
        //TODO: Se elimina un contacto por su ID
        $contacto->delete_contact($_POST["contactoId"]);
        break;

    //TODO: Código para operación combo
    case 'combo_x_cliente':
        $datos = $contacto->get_contact_x_cliente_id($_POST["clienteId"]);
        if (is_array($datos) == true and count($datos) > 0) {
            $html="";
            $html="<option selected>Seleccionar</option>";
            foreach ($datos as $row) {
                $html.="<option value='".$row["contactoId"]."'>".$row["contactoNombre"]."</option>";
            }
            echo $html;
        }
        break;
}
?>
