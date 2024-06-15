<?php
    //TODO: Se incluyen los archivos de configuración y modelo necesarios
    require_once ("../config/conexion.php");
    require_once ("../models/clienteModels.php");

    //TODO: Se instancia un objeto de la clase clienteModels
    $cliente = new clienteModels();
    
    //TODO: Se realiza una operación basada en el valor de $_GET["op"]
    switch ($_GET["op"]) {
        case 'guardaryeditar':
            //TODO: Si no se recibe el campo category en el formulario, se inserta una nueva categoría
            if (empty($_POST["clienteId"])) {
                $cliente->insert_cliente($_POST["clienteNombre"], $_POST["clienteRuc"],$_POST["clienteTelefono"],$_POST["clienteEmail"]);
            } else {
                //TODO: Si se recibe el campo category en el formulario, se actualiza la categoría existente
                $cliente->update_cliente($_POST["clienteId"], $_POST["clienteNombre"],$_POST["clienteRuc"],$_POST["clienteTelefono"],$_POST["clienteEmail"]);
            }
            break;
        case 'listar':
            //TODO: Se obtienen los datos de las categorías
            $datos = $cliente->get_clientes();
            $data = Array();
            //TODO: Se itera sobre los datos obtenidos para construir el array $data
            foreach ($datos as $row) {
                $sub_array = array();
                $sub_array[] = $row["clienteNombre"];
                $sub_array[] = $row["clienteRuc"];
                $sub_array[] = $row["clienteTelefono"];
                $sub_array[] = $row["clienteEmail"];
                $sub_array[] = '<button type="button" onClick="editar('.$row["clienteId"].')" id="'.$row["clienteId"].'" class="btn btn-warning btn-xs">Editar</button>';
                $sub_array[] = '<button type="button" onClick="eliminar('.$row["clienteId"].')" id="'.$row["clienteId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
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
            $datos = $cliente->get_cliente_by_id($_POST["clienteId"]);
            if (is_array($datos) == true and count($datos) > 0) {
                foreach ($datos as $row) {
                    $output["clienteId"] = $row["clienteId"];
                    $output["clienteNombre"] = $row["clienteNombre"];
                    $output["clienteRuc"] = $row["clienteRuc"];
                    $output["clienteTelefono"] = $row["clienteTelefono"];
                    $output["clienteEmail"] = $row["clienteEmail"];
                }
                echo json_encode($output);
            }
            break;
        case 'eliminar':
            //TODO: Se elimina una categoría por su ID
            $cliente->delete_cliente($_POST["clienteId"]);
            break;

            //TODO: Código para operación combo
        case 'combo':
            $datos = $cliente->get_clientes();
            if (is_array($datos) == true and count($datos) > 0) {
                $html="";
                $html="<option selected>Seleccionar</option>";
                foreach ($datos as $row) {
                    $html.="<option value='".$row["clienteId"]."'>".$row["clienteNombre"]."</option>";
                }
                echo $html;
            }
            break;
    }
