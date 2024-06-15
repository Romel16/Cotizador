<?php
class cargoModels extends Conectar{

    public function get_cargo(){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "select * from cargo where cargoEstado = 1;";
        $sql = $conetar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function insert_cargo($cargoName,$cargoDescription){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "insert into cargo (cargoId, cargoNombre, cargoDescripcion, cargoEstado) values (null, ?,?,'1');";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1, $cargoName);
        $sql->bindValue(2, $cargoDescription);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function update_cargo($cargoId, $categoyName, $cargoDescription){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "update cargo set cargoNombre =?,cargoDescripcion=? where cargoId=?;";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$categoyName);
        $sql->bindValue(2,$cargoDescription);
        $sql->bindValue(3,$cargoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    public function delete_cargo($cargoId){
        $conetar = parent::Conexion();
        parent::set_names();
        $sql = "update cargo set cargoEstado = 0 where cargoId=? ;";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$cargoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    //Funcion para obtenr una cargo especfica de la base de datos
    public function get_cargo_x_id($cargoId){
        //Se Establece la conexion a la base de datos
        $conetar = parent::Conexion();
        //Se configura la codificaion de carateres
        parent::set_names();
        //Se define la consulta SQL para la obtencion de un resgitro
        $sql = "select * from cargo where cargoId = ?";
        $sql = $conetar->prepare($sql);
        $sql->bindValue(1,$cargoId);
        $sql->execute();
        //Se Obtiene los resultados de la consulta en un arreglo
        return $resultado = $sql->fetchAll();
    }

}