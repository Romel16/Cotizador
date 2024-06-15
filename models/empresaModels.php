<?php
class empresaModels extends Conectar{

    public function get_empresas(){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM empresa where empresaEstado = 1;";
        $sql = $conectar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function insert_empresa($empresaNombre, $empresaPorcentaje){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "INSERT INTO empresa (empresaNombre, empresaPorcentaje,empresaEstado) VALUES (?, ?,'1');";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $empresaNombre);
        $sql->bindValue(2, $empresaPorcentaje);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function update_empresa($empresaId, $empresaNombre, $empresaPorcentaje){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE empresa SET empresaNombre=?, empresaPorcentaje=? WHERE empresaId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $empresaNombre);
        $sql->bindValue(2, $empresaPorcentaje);
        $sql->bindValue(3, $empresaId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function delete_empresa($empresaId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE empresa set empresaEstado = 0 where empresaId=? ";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $empresaId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    // Función para obtener una empresa específica de la base de datos
    public function get_empresa_by_id($empresaId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM empresa WHERE empresaId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $empresaId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

}
