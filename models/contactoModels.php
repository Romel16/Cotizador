<?php
class contactoModels extends Conectar{

    public function get_contacts(){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT con.contactoId,c.clienteNombre,car.cargoNombre ,con.contactoClienteId,con.contactoCargoId,con.contactoNombre,con.contactoEmail, con.contactoTelefono 
        FROM `contacto` con 
        join cliente c on c.clienteId = con.contactoClienteId 
        join cargo car on car.cargoId = con.contactoCargoId where contactoEstado = 1;";
        $sql = $conectar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function insert_contact($contactoClienteId, $contactoCargoId, $contactoNombre, $contactoEmail, $contactoTelefono){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "INSERT INTO contacto (contactoClienteId, contactoCargoId, contactoNombre, contactoEmail, contactoTelefono, contactoEstado) VALUES (?, ?, ?, ?, ?, '1');";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $contactoClienteId);
        $sql->bindValue(2, $contactoCargoId);
        $sql->bindValue(3, $contactoNombre);
        $sql->bindValue(4, $contactoEmail);
        $sql->bindValue(5, $contactoTelefono);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function update_contact($contactoId, $contactoClienteId, $contactoCargoId, $contactoNombre, $contactoEmail, $contactoTelefono){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE contacto SET contactoClienteId=?, contactoCargoId=?, contactoNombre=?, contactoEmail=?, contactoTelefono=? WHERE contactoId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $contactoClienteId);
        $sql->bindValue(2, $contactoCargoId);
        $sql->bindValue(3, $contactoNombre);
        $sql->bindValue(4, $contactoEmail);
        $sql->bindValue(5, $contactoTelefono);
        $sql->bindValue(6, $contactoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function delete_contact($contactoId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE contacto SET contactoEstado = 0 WHERE contactoId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $contactoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    // Función para obtener un contacto específico de la base de datos
    public function get_contact_by_id($contactoId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM contacto WHERE contactoId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $contactoId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }
    // Función para obtener un contacto específico de la base de datos
    public function get_contact_x_cliente_id($clienteId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM `contacto` where contactoClienteId = ? and contactoEstado = 1;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $clienteId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

}
?>
