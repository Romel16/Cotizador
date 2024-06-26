<?php
//TODO: Se incluyen los archivos de configuración y modelo necesarios
require_once ("../config/conexion.php");
require_once ("../models/empresaModels.php");

//TODO: Se instancia un objeto de la clase empresaModels
$empresa = new empresaModels();

//TODO: Se realiza una operación basada en el valor de $_GET["op"]
switch ($_GET["op"]) {
    case 'guardaryeditar':
        //TODO: Si no se recibe el campo empresaId en el formulario, se inserta una nueva empresa
        if (empty($_POST["empresaId"])) {
            $empresa->insert_empresa($_POST["empresaNombre"], $_POST["empresaPorcentaje"]);
        } else {
            //TODO: Si se recibe el campo empresaId en el formulario, se actualiza la empresa existente
            $empresa->update_empresa($_POST["empresaId"], $_POST["empresaNombre"], $_POST["empresaPorcentaje"]);
        }
        break;
    case 'listar':
        //TODO: Se obtienen los datos de las empresas
        $datos = $empresa->get_empresas();
        $data = Array();
        //TODO: Se itera sobre los datos obtenidos para construir el array $data
        foreach ($datos as $row) {
            $sub_array = array();
            $sub_array[] = $row["empresaNombre"];
            $sub_array[] = $row["empresaPorcentaje"];
            $sub_array[] = '<button type="button" onClick="editar('.$row["empresaId"].')" id="'.$row["empresaId"].'" class="btn btn-warning btn-xs">Editar</button>';
            $sub_array[] = '<button type="button" onClick="eliminar('.$row["empresaId"].')" id="'.$row["empresaId"].'" class="btn btn-danger btn-xs">Eliminar</button>';
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
        //TODO: Se obtienen los datos de una empresa específica por su ID
        $datos = $empresa->get_empresa_by_id($_POST["empresaId"]);
        if (is_array($datos) == true and count($datos) > 0) {
            foreach ($datos as $row) {
                $output["empresaId"] = $row["empresaId"];
                $output["empresaNombre"] = $row["empresaNombre"];
                $output["empresaPorcentaje"] = $row["empresaPorcentaje"];
            }
            echo json_encode($output);
        }
        break;
    case 'eliminar':
        //TODO: Se elimina una empresa por su ID
        $empresa->delete_empresa($_POST["empresaId"]);
        break;

    //TODO: Código para operación combo
    case 'combo':
        $datos = $empresa->get_empresas();
            if (is_array($datos) == true and count($datos) > 0) {
                $html="";
                $html="<option selected>Seleccionar</option>";
                foreach ($datos as $row) {
                    $html.="<option value='".$row["empresaId"]."'>".$row["empresaNombre"]."</option>";
                }
                echo $html;
            }
            break;
}
?>
