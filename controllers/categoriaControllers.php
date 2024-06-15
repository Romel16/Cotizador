<?php
    //TODO: Se incluyen los archivos de configuración y modelo necesarios
    require_once ("../config/conexion.php");
    require_once ("../models/categoriaModels.php");

    //TODO: Se instancia un objeto de la clase categoriaModels
    $categoria = new categoriaModels();
    
    //TODO: Se realiza una operación basada en el valor de $_GET["op"]
    switch ($_GET["op"]) {
        case 'guardaryeditar':
            //TODO: Si no se recibe el campo category en el formulario, se inserta una nueva categoría
            if (empty($_POST["categoriaId"])) {
                $categoria->insert_category($_POST["categoriaNombre"], $_POST["categoriaDescripcion"]);
            } else {
                //TODO: Si se recibe el campo category en el formulario, se actualiza la categoría existente
                $categoria->update_category($_POST["categoriaId"], $_POST["categoriaNombre"], $_POST["categoriaDescripcion"]);
            }
            break;
        case 'listar':
            //TODO: Se obtienen los datos de las categorías
            $datos = $categoria->get_category();
            $data = Array();
            //TODO: Se itera sobre los datos obtenidos para construir el array $data
            foreach ($datos as $row) {
                $sub_array = array();
                $sub_array[] = $row["categoriaNombre"];
                $sub_array[] = $row["categoriaDescripcion"];
                $sub_array[] = '<button type="button" onClick="editar('.$row["categoriaId"].')" id="'.$row["categoriaId"].'" class="btn btn-warning btn-xs">Editar</button>';
                $sub_array[] = '<button type="button" onClick="eliminar('.$row["categoriaId"].')" id="'.$row["categoriaId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
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
            $datos = $categoria->get_category_x_id($_POST["categoriaId"]);
            if (is_array($datos) == true and count($datos) > 0) {
                foreach ($datos as $row) {
                    $output["categoriaId"] = $row["categoriaId"];
                    $output["categoriaNombre"] = $row["categoriaNombre"];
                    $output["categoriaDescripcion"] = $row["categoriaDescripcion"];
                }
                echo json_encode($output);
            }
            break;
        case 'eliminar':
            //TODO: Se elimina una categoría por su ID
            $categoria->delete_category($_POST["categoriaId"]);
            break;

            //TODO: Código para operación combo
        case 'combo':
            $datos = $categoria->get_category();
            if (is_array($datos) == true and count($datos) > 0) {
                $html="";
                $html="<option selected>Seleccionar</option>";
                foreach ($datos as $row) {
                    $html.="<option value='".$row["categoriaId"]."'>".$row["categoriaNombre"]."</option>";
                }
                echo $html;
            }
            break;
    }
