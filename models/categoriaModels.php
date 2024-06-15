<?php
class categoriaModels extends Conectar{

    public function get_category(){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "select * from categoria where categoriaEstado = 1 order by categoriaId desc;";
        $sql = $conetar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function insert_category($categoryName,$categoryDescription){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "insert into categoria (categoriaId, categoriaNombre, categoriaDescripcion, categoriaEstado) values (null, ?,?,'1');";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1, $categoryName);
        $sql->bindValue(2, $categoryDescription);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function update_category($categoryId, $categoyName, $categoryDescription){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "update categoria set categoriaNombre =?,categoriaDescripcion=? where categoriaId=?;";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$categoyName);
        $sql->bindValue(2,$categoryDescription);
        $sql->bindValue(3,$categoryId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function delete_category($categoryId){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "update categoria set categoriaEstado = 0 where categoriaId=? ;";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$categoryId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    //Funcion para obtenr una categoria especfica de la base de datos
    public function get_category_x_id($categoryId){
        //Se Establece la conexion a la base de datos
        $conetar = parent::Conexion();
        //Se configura la codificaion de carateres
        parent::set_names();
        //Se define la consulta SQL para la obtencion de un resgitro
        $sql = "select * from categoria where categoriaId = ?";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$categoryId);
        $sql->execute();
        //Se Obtiene los resultados de la consulta en un arreglo
        return $resultado = $sql->fetchAll();
    }
    //Funcion para obtenr nombre de una categoria especfica de la base de datos
    public function get_category_x_nombre($categoriaNombre){
        //Se Establece la conexion a la base de datos
        $conetar = parent::Conexion();
        //Se configura la codificaion de carateres
        parent::set_names();
        //Se define la consulta SQL para la obtencion de un resgitro
        $sql = "select * from categoria where categoriaNombre = ? and categoriaEstado=1";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$categoriaNombre);
        $sql->execute();
        //Se Obtiene los resultados de la consulta en un arreglo
        return $resultado = $sql->fetchAll();
    }

}