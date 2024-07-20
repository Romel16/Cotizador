<?php
    // TODO: Se define la clase "Cotizacion" que extiende de la clase "Conectar".
    class cotizacionModels extends Conectar {

        public function insert_cotizacion(
            $cli_id,
            $con_id,
            $cli_ruc,
            $con_telf,
            $con_email,
            $cot_descrip
            /* $usu_id */
            ) {
            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para insertar una nueva empresa.
            $sql = "CALL spInsertCotizacion (?,?,?,?,?,?);";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cli_id);
            $sql->bindValue(2, $con_id);
            $sql->bindValue(3, $cli_ruc);
            $sql->bindValue(4, $con_telf);
            $sql->bindValue(5, $con_email);
            $sql->bindValue(6, $cot_descrip);
           /*  $sql->bindValue(7, $usu_id); */
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }

        public function  insert_detallecotizacion(
            $cot_id,
            $cat_id,
            $prod_id,
            $cotd_precio,
            $cotd_cant
            /* $cotd_tipo */
            ) {
            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para insertar una nueva empresa.
            $sql = "CALL spInsertDetalleCotizacion (?,?,?,?,?);";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cot_id);
            $sql->bindValue(2, $cat_id);
            $sql->bindValue(3, $prod_id);
            $sql->bindValue(4, $cotd_precio);
            $sql->bindValue(5, $cotd_cant);
            /* $sql->bindValue(6, $cotd_tipo); */
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
           return $resultado = $sql->fetchAll(); 
        }

        public function get_cotizacion($cot_id){
            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para eliminar una empresa.
            $sql = "select * from cotizacion where cotizacionId=?";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cot_id);
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }

        public function get_detallecotizacion($cotizadorId/* ,$cotd_tipo */) {

            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para insertar una nueva empresa.
            $sql = "SELECT 
                dc.detallecotizacionId,
                dc.detallecotizacionCotizacionId,
                c.categoriaId,c.categoriaNombre,
                p.productoId,p.productoNombre,
                dc.detallecotizacionPrecio,
                dc.detallecotizacionCantidad,
                dc.detallecotizacionProfit,
                dc.detallecotizacionTotal
                FROM detallecotizacion dc
                join categoria c on c.categoriaId = dc.detallecotizacionCategoriaId
                join producto p on p.productoId=dc.detallecotizacionProductoId
                where dc.detallecotizacionCotizacionId = ?
                and dc.detallecotizacionEstado=1";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cotizadorId);
            /* $sql->bindValue(2, $cotd_tipo); */
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }
        public function get_detallecotizacion_x_detalleId($cotizadorId/* ,$cotd_tipo */) {

            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para insertar una nueva empresa.
            $sql = "SELECT 
                dc.detallecotizacionId,
                dc.detallecotizacionCotizacionId,
                c.categoriaId,c.categoriaNombre,
                p.productoId,p.productoNombre,
                dc.detallecotizacionPrecio,
                dc.detallecotizacionCantidad,
                dc.detallecotizacionProfit,
                dc.detallecotizacionTotal
                FROM detallecotizacion dc
                join categoria c on c.categoriaId = dc.detallecotizacionCategoriaId
                join producto p on p.productoId=dc.detallecotizacionProductoId
                where dc.detallecotizacionId = ?
                and dc.detallecotizacionEstado=1";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cotizadorId);
            /* $sql->bindValue(2, $cotd_tipo); */
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }
        
        
        public function delete_detallecotizacion($cotd_id,$cot_id){
            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para eliminar una empresa.
            $sql = "call spEliminarDetalleCotizacion(?,?)";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cotd_id);
            $sql->bindValue(2, $cot_id); 
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }
        public function update_detallecotizacion(
            $cotd_id,
            $cotd_precio,
            $cotd_cant,
            $cotd_profit,
            $cot_id
            ){
            // TODO: Se establece la conexión a la base de datos.
            $conectar = parent::conexion();
            // TODO: Se configura la codificación de caracteres.
            parent::set_names();
            // TODO: Se define la consulta SQL para eliminar una empresa.
            $sql = "call spUpdaterDetalleCotizacion (?,?,?,?,?);";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $cotd_id);
            $sql->bindValue(2, $cotd_precio);
            $sql->bindValue(3, $cotd_cant);
            $sql->bindValue(4, $cotd_profit);
            $sql->bindValue(5, $cot_id); 
            $sql->execute();
            // TODO: Se obtienen los resultados de la consulta en un arreglo.
            return $resultado = $sql->fetchAll();
        }

     
    }

