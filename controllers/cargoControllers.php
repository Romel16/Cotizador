<?php
    //TODO: Se incluyen los archivos de configuración y modelo necesarios
    require_once ("../config/conexion.php");
    require_once ("../models/cargoModels.php");

    //TODO: Se instancia un objeto de la clase cargoModels
    $cargo = new cargoModels();
    
    //TODO: Se realiza una operación basada en el valor de $_GET["op"]
    switch ($_GET["op"]) {
        case 'guardaryeditar':
            //TODO: Si no se recibe el campo cargo en el formulario, se inserta una nueva categoría
            if (empty($_POST["cargoId"])) {
                $cargo->insert_cargo($_POST["cargoNombre"], $_POST["cargoDescripcion"]);
            } else {
                //TODO: Si se recibe el campo cargo en el formulario, se actualiza la categoría existente
                $cargo->update_cargo($_POST["cargoId"], $_POST["cargoNombre"], $_POST["cargoDescripcion"]);
            }
            break;
        case 'listar':
            //TODO: Se obtienen los datos de las categorías
            $datos = $cargo->get_cargo();
            $data = Array();
            //TODO: Se itera sobre los datos obtenidos para construir el array $data
            foreach ($datos as $row) {
                $sub_array = array();
                $sub_array[] = $row["cargoNombre"];
                $sub_array[] = $row["cargoDescripcion"];
                $sub_array[] = '<button type="button" onClick="editar('.$row["cargoId"].')" id="'.$row["cargoId"].'" class="btn btn-warning btn-xs">Editar</button>';
                $sub_array[] = '<button type="button" onClick="eliminar('.$row["cargoId"].')" id="'.$row["cargoId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
                $data[] = $sub_array;
            }

            //TODO: Se prepara la respuesta en formato JSON
            $results = array(
                "sEcho" => 1,
                "iTotalRecords" => count($data),
                "iTotalDisplayRecords" => count($data),
                "aaData" => $data);

            echo json_encode($results);
            break;
        case 'mostrar':
            //TODO: Se obtienen los datos de una categoría específica por su ID
            $datos = $cargo->get_cargo_x_id($_POST["cargoId"]);
            if (is_array($datos) == true and count($datos) > 0) {
                foreach ($datos as $row) {
                    $output["cargoId"] = $row["cargoId"];
                    $output["cargoNombre"] = $row["cargoNombre"];
                    $output["cargoDescripcion"] = $row["cargoDescripcion"];
                }
                echo json_encode($output);
            }
            break;
        case 'eliminar':
            //TODO: Se elimina una categoría por su ID
            $cargo->delete_cargo($_POST["cargoId"]);
            break;

            //TODO: Código para operación combo
        case 'combo':
            $datos = $cargo->get_cargo();
            if (is_array($datos) == true and count($datos) > 0) {
                $html="";
                $html="<option selected>Seleccionar</option>";
                foreach ($datos as $row) {
                    $html.="<option value='".$row["cargoId"]."'>".$row["cargoNombre"]."</option>";
                }
                echo $html;
            }
            break;
    }
