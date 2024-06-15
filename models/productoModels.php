<?php
class productoModels extends Conectar{

    public function get_productos(){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT 
                p.productoId,
                c.categoriaNombre,
                p.productoCategoriaId,
                p.productoNombre,
                p.productoDescripcion,
                p.productoPrecio,    
                p.productoEstado
            FROM 
                producto p 
            JOIN 
                categoria c 
            ON 
                c.categoriaId = p.productoCategoriaId
                where p.productoEstado=1
                ORDER by p.productoId DESC;";
        $sql = $conectar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function insert_producto($productoCategoriaId, $productoNombre, $productoDescripcion, $productoPrecio){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "INSERT INTO producto (productoCategoriaId, productoNombre, productoDescripcion, productoPrecio,productoEstado) VALUES (?, ?, ?, ?,'1');";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $productoCategoriaId);
        $sql->bindValue(2, $productoNombre);
        $sql->bindValue(3, $productoDescripcion);
        $sql->bindValue(4, $productoPrecio);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function update_producto($productoId, $productoCategoriaId, $productoNombre, $productoDescripcion, $productoPrecio){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE producto SET productoCategoriaId=?, productoNombre=?, productoDescripcion=?, productoPrecio=? WHERE productoId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $productoCategoriaId);
        $sql->bindValue(2, $productoNombre);
        $sql->bindValue(3, $productoDescripcion);
        $sql->bindValue(4, $productoPrecio);
        $sql->bindValue(5, $productoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function delete_producto($productoId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE producto SET productoEstado = 0 WHERE productoId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $productoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    // Función para obtener un producto específico de la base de datos
    public function get_producto_by_id($productoId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM producto WHERE productoId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $productoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

}
