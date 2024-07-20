<?php
    //TODO: Se incluyen los archivos necesarios
    require_once("../config/conexion.php");
    require_once("../models/cotizadorModels.php");
    /* require_once("../models/emailControllers.php"); */

    //TODO: Se crea una instancia de la clase Cotizacion
    $cotizacion = new cotizacionModels();
 /*    $email = new Email(); */

    //TODO: Se utiliza un switch para determinar qué acción realizar
    switch($_GET["op"]){

        /*DETALLECOTIZACION */

        //TODO: Si la acción es "crear"
        case "guardar":
            $datos=$cotizacion->insert_cotizacion(                
                $_POST["cotizacionClienteId"],
                $_POST["cotizacionContactoId"],
                $_POST["clienteRuc"],
                $_POST["contactoTelefono"],
                $_POST["contactoEmail"],
                $_POST["cotizacionDescripcion"]
                /* $_POST["usu_id"] */
            );
            $output = array();  // Inicializar la variable $output      

            if (empty($_POST["cotizacionId"])) {
                if (is_array($datos) == true and count($datos) > 0) {
                    foreach ($datos as $row) {
                        $output["cotizacionId"] = $row["cotizacionId"];
                    }
                }
                echo json_encode($output);
            }
            
            break;


            case "mostrar":
                $datos=$cotizacion->get_cotizacion($_POST["cotizacionId"]);
                if(is_array($datos)==true and count($datos)>0){
                    foreach($datos as $row){
                        $output["cotizacionId"] = $row["cotizacionId"];
                        $output["cotizacionSubTotal"] = $row["cotizacionSubTotal"];
                        $output["cotizacionProfit"] = $row["cotizacionProfit"];
                        $output["cotizacionTotal"] = $row["cotizacionTotal"];
                    }
                }
                echo json_encode($output);
            break;


        /*DETALLECOTIZACION */

        case "detalleguardar":
             // Depuración: Ver los datos de $_POST
            /* var_dump($_POST);  */
           
            $datos = $cotizacion->insert_detallecotizacion(               
                $_POST["detallecotizacionCotizacionId"],
                $_POST["detallecotizacionCategoriaId"],
                $_POST["detallecotizacionProductoId"],
                $_POST["detallecotizacionPrecio"],
                $_POST["detallecotizacionCantidad"]
                /* $_POST["cotd_tipo"] */
            );
            $output = array();   // Inicializar la variable $output

            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row){
                    $output["detallecotizacionId"] = $row["detallecotizacionId"];
                }
            }
            echo json_encode($output);
        break;

        case "listardetalle":
            $datos = $cotizacion->get_detallecotizacion($_POST["cotizadorId"]);
            $data = Array();
            foreach ($datos as $row) {
                $sub_array = array();
                $sub_array[] = $row["categoriaNombre"];
                $sub_array[] = $row["productoNombre"];
                $sub_array[] = $row["detallecotizacionPrecio"];
                $sub_array[] = $row["detallecotizacionCantidad"];
                $sub_array[] = $row["detallecotizacionProfit"];
                $sub_array[] = $row["detallecotizacionTotal"];
                $sub_array[] = '<button type="button" onClick="editardetalle('.$row["detallecotizacionId"].')" id="'.$row["detallecotizacionId"].'" class="btn btn-warning btn-xs"><i class="fas fa-edit"></i></button>';
                $sub_array[] = '<button type="button" onClick="eliminardetalle('.$row["detallecotizacionId"].')" id="'.$row["detallecotizacionId"].'" class="btn btn-danger btn-xs"><i class="fas fa-trash"></i></button>';
                $data[] = $sub_array;
            }        
            // Preparar la respuesta en formato JSON
            $results = array(
                "sEcho" => 1,
                "iTotalRecords" => count($data),
                "iTotalDisplayRecords" => count($data),
                "aaData" => $data);
        
            echo json_encode($results);
        break;

        case "eliminardetalle":
            $datos=$cotizacion->delete_detallecotizacion($_POST["detallecotizacionId"],$_POST["detallecotizacionCotizacionId"]);
            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row){
                    $output["detallecotizacionId"] = $row["detallecotizacionId"];
                }
            }
            echo json_encode($output);
        break;

        case "mostrardetalle":
            $datos=$cotizacion->get_detallecotizacion_x_detalleId($_POST["detallecotizacionId"]);
            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row){
                    $output["detallecotizacionId"] = $row["detallecotizacionId"];
                    $output["detallecotizacionCotizacionId"] = $row["detallecotizacionCotizacionId"];
                    $output["categoriaNombre"] = $row["categoriaNombre"];
                    $output["productoNombre"] = $row["productoNombre"];
                    $output["detallecotizacionPrecio"] = $row["detallecotizacionPrecio"];
                    $output["detallecotizacionCantidad"] = $row["detallecotizacionCantidad"];
                    $output["detallecotizacionProfit"] = $row["detallecotizacionProfit"];
                    $output["detallecotizacionTotal"] = $row["detallecotizacionTotal"];
                }
            }
            echo json_encode($output);
        break;


        case "actualizardetalle":
            $datos=$cotizacion->update_detallecotizacion(
                $_POST["detallecotizacionId"],
                $_POST["detallecotizacionPrecio"],
                $_POST["detallecotizacionCantidad"],
                $_POST["detallecotizacionProfit"],
                $_POST["detallecotizacionCotizacionId"],
            );
            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row){
                    $output["detallecotizacionId"] = $row["detallecotizacionId"];
                }
            }
            echo json_encode($output);
        break;
        
    }

