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
                $_POST["cotizacionDescripcion"],
                $_POST["usu_id"] 
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

                        $output["cotizacionClienteId"] = $row["cotizacionClienteId"];
                        $output["clienteNombre"] = $row["clienteNombre"];
                        $output["clienteRuc"] = $row["clienteRuc"];
                        $output["clienteTelefono"] = $row["clienteTelefono"];
                        $output["clienteEmail"] = $row["clienteEmail"];

                        $output["cotizacionContactoId"] = $row["cotizacionContactoId"];
                        $output["contactoNombre"] = $row["contactoNombre"];
                        $output["contactoTelefono"] = $row["contactoTelefono"];
                        $output["contactoEmail"] = $row["contactoEmail"];
                        
                        $output["cotizacionEmpresaId"] = $row["cotizacionEmpresaId"];
                        $output["empresaNombre"] = $row["empresaNombre"];
                        $output["empresaPorcentaje"] = $row["empresaPorcentaje"];
                        $output["empresaRuc"] = $row["empresaRuc"];
                        $output["empresaTelefono"] = $row["empresaTelefono"];
                        $output["empresaEmail"] = $row["empresaEmail"];
                        

                        $output["cotizacionDescripcion"] = $row["cotizacionDescripcion"];
                        $output["empresaPorcentaje"] = $row["empresaPorcentaje"];
                        $output["cotizacionSubTotal"] = $row["cotizacionSubTotal"];
                        $output["cotizacionProfit"] = $row["cotizacionProfit"];
                        $output["cotizacionTotal"] = $row["cotizacionTotal"];

                        $output["fech_crea_format"] = $row["fech_crea_format"];
                        $output["mes_en_texto"] = $row["mes_en_texto"];
                        $output["fecha_formateada"] = $row["fecha_formateada"];


                        $output["usuarioId"] = $row["usuarioId"];
                        $output["usuarioNombre"] = $row["usuarioNombre"];
                        $output["usuarioCorreo"] = $row["usuarioCorreo"];

                        /* $output["fech_respuesta"] = $row["fech_respuesta"];
                        $output["fech_formateada_respuesta"] = $row["fech_formateada_respuesta"];
                        $output["l_fech_crea"] = $row["l_fech_crea"];
                        $output["l_fech_envio"] = $row["l_fech_envio"]; 
                        $output["l_fech_visto"] = $row["l_fech_visto"]; */
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
                $_POST["detallecotizacionCantidad"],
                $_POST["detallecotizacionTipo"] 
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
            $datos = $cotizacion->get_detallecotizacion($_POST["cotizadorId"], $_POST["detallecotizadocioTipo"]);
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

        case "listara_vacio":
            $datos=$cotizacion->get_detallecotizacion($_POST["cotizacionId"],$_POST["detallecotizacionTipo"]);
            if(is_array($datos)==true and count($datos)>0){
                echo json_encode(1);
            }else{
                echo json_encode(0);
            }
        break;
        
        case "listarv":
            $datos=$cotizacion->get_detallecotizacion($_POST["cotizacionId"],$_POST["detallecotizacionTipo"]);
            foreach($datos as $row){
                ?>
                    <tr>
                        <td>
                            <span class="text-inverse"><?php echo $row["productoNombre"] ?></span><br>
                            <small><?php echo $row["productoDescripcion"] ?></small>
                        </td>
                        <td class="text-center"><?php echo $row["detallecotizacionCantidad"] ?></td>
                        <td class="text-right"><?php echo $row["detallecotizacionTotal"] ?></td>
                    </tr>
                <?php
            }
            break;

    }

