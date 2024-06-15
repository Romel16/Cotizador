<?php
//TODO: Se incluyen los archivos de configuración y modelo necesarios
require_once ("../config/conexion.php");
require_once ("../models/productoModels.php");

//TODO: Se instancia un objeto de la clase productoModels
$producto = new productoModels();

//TODO: Se realiza una operación basada en el valor de $_GET["op"]
switch ($_GET["op"]) {
    case 'guardaryeditar':
        //TODO: Si no se recibe el campo productoId en el formulario, se inserta un nuevo producto
        if (empty($_POST["productoId"])) {
            $producto->insert_producto($_POST["categoriaId"], $_POST["productoNombre"], $_POST["productoDescripcion"], $_POST["productoPrecio"]);
        } else {
            //TODO: Si se recibe el campo productoId en el formulario, se actualiza el producto existente
            $producto->update_producto($_POST["productoId"], $_POST["categoriaId"], $_POST["productoNombre"], $_POST["productoDescripcion"], $_POST["productoPrecio"]);
        }
        break;
    case 'listar':
        //TODO: Se obtienen los datos de los productos
        $datos = $producto->get_productos();
        $data = Array();
        //TODO: Se itera sobre los datos obtenidos para construir el array $data
        foreach ($datos as $row) {
            $sub_array = array();
            $sub_array[] = $row["categoriaNombre"];
            $sub_array[] = $row["productoNombre"];
            $sub_array[] = $row["productoDescripcion"];
            $sub_array[] = $row["productoPrecio"];
            $sub_array[] = '<button type="button" onClick="editar('.$row["productoId"].')" id="'.$row["productoId"].'" class="btn btn-warning btn-xs">Editar</button>';
            $sub_array[] = '<button type="button" onClick="eliminar('.$row["productoId"].')" id="'.$row["productoId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
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
        //TODO: Se obtienen los datos de un producto específico por su ID
        $datos = $producto->get_producto_by_id($_POST["productoId"]);
        if (is_array($datos) == true and count($datos) > 0) {
            foreach ($datos as $row) {
                $output["productoId"] = $row["productoId"];
                $output["productoCategoriaId"] = $row["productoCategoriaId"];
                $output["productoNombre"] = $row["productoNombre"];
                $output["productoDescripcion"] = $row["productoDescripcion"];
                $output["productoPrecio"] = $row["productoPrecio"];
            }
            echo json_encode($output);
        }
        break;
    case 'eliminar':
        //TODO: Se elimina un producto por su ID
        $producto->delete_producto($_POST["productoId"]);
        break;

    //TODO: Código para operación combo
    case 'combo':
        $datos = $producto->get_productos();
        if (is_array($datos) == true and count($datos) > 0) {
            $html="";
            $html="<option selected>Seleccionar</option>";
            foreach ($datos as $row) {
                $html.="<option value='".$row["productoId"]."'>".$row["productoNombre"]."</option>";
            }
            echo $html;
        }
        break;
}
?>
