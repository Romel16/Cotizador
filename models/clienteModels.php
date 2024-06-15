<?php
class clienteModels extends Conectar{

    public function get_clientes(){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM cliente WHERE clienteEstado = 1;";
        $sql = $conectar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function insert_cliente($clienteNombre, $clienteRuc, $clienteTelefono, $clienteEmail){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "INSERT INTO cliente (clienteNombre, clienteRuc, clienteTelefono, clienteEmail, clienteEstado) VALUES (?, ?, ?, ?, '1');";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $clienteNombre);
        $sql->bindValue(2, $clienteRuc);
        $sql->bindValue(3, $clienteTelefono);
        $sql->bindValue(4, $clienteEmail);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function update_cliente($clienteId, $clienteNombre, $clienteRuc, $clienteTelefono, $clienteEmail){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE cliente SET clienteNombre=?, clienteRuc=?, clienteTelefono=?, clienteEmail=? WHERE clienteId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $clienteNombre);
        $sql->bindValue(2, $clienteRuc);
        $sql->bindValue(3, $clienteTelefono);
        $sql->bindValue(4, $clienteEmail);  
        $sql->bindValue(5, $clienteId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function delete_cliente($clienteId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE cliente SET clienteEstado = 0 WHERE clienteId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $clienteId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    // Función para obtener un cliente específico de la base de datos
    public function get_cliente_by_id($clienteId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM cliente WHERE clienteId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $clienteId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

}
?>


