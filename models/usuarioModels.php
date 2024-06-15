<?php
class usuarioModels extends Conectar{


    public function login(){
        //TODO: Se conecta a la base de datos utilizando el método de la clase padre
        $conectar = parent::Conexion();
        // Establece los nombres de caracteres a usar
        parent::set_names();
        
        //TODO: Comprueba si se ha enviado el formulario de login
        if (isset($_POST["enviar"])) {
            //TODO: Obtiene el correo y la contraseña del formulario
            $correo = $_POST["usuarioCorreo"];
            $password = $_POST["usuarioPassword"];
            
            //TODO: Verifica si el correo y la contraseña están vacíos
            if (empty($correo) and empty($password)) {
                //TODO: Si ambos campos están vacíos, redirige al usuario a la página de inicio con un código de error
                header("Location:".conectar::ruta()."index.php?=2");
                exit();
            } else {
                //TODO: Consulta SQL para buscar el usuario en la base de datos con el correo y contraseña proporcionados
                $sql = "select * from usuario where usuarioCorreo=? and usuarioPassword=?";
                //TODO: Prepara la consulta
                $sql = $conectar->prepare($sql);
                //TODO: Asigna los valores del correo y la contraseña a los parámetros de la consulta
                $sql->bindValue(1, $correo);
                $sql->bindValue(2, $password);
                //TODO: Ejecuta la consulta
                $sql->execute();
                //TODO: Obtiene el resultado de la consulta
                $resultado = $sql->fetch();
    
                //TODO: Verifica si el resultado es un array y tiene elementos
                if (is_array($resultado) and count($resultado)) {
                    //TODO: Creación de variables de sesión con los datos del usuario
                    $_SESSION["usuarioId"] = $resultado["usuarioId"];
                    $_SESSION["usuarioNombre"] = $resultado["usuarioNombre"];
                    $_SESSION["usuarioCorreo"] = $resultado["usuarioCorreo"];
                    //TODO: Redirige al usuario a la página principal del sistema
                    header("Location:".conectar::ruta()."view/home/");
                    exit();
                } else {
                    //TODO: Si el resultado no es válido, redirige al usuario a la página de inicio con un código de error diferente
                    header("Location:".conectar::ruta()."index.php?=1");
                    exit();
                }
            }
        }
    }
    

    public function get_usuarios(){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM usuario where usuarioEstado=1";
        $sql = $conectar->prepare($sql);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function insert_usuario($usuarioNombre, $usuarioCorreo, $usuarioPassword){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "INSERT INTO usuario (usuarioNombre,usuarioCorreo, usuarioPassword, usuarioEstado) VALUES (?, ?, ?, '1');";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $usuarioNombre);
        $sql->bindValue(2, $usuarioCorreo);
        $sql->bindValue(3, $usuarioPassword);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function update_usuario($usuarioId, $usuarioNombre, $usuarioCorreo, $usuarioPassword){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE usuario SET usuarioNombre=?, usuarioCorreo=?, usuarioPassword=? WHERE usuarioId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $usuarioNombre);
        $sql->bindValue(2, $usuarioCorreo);
        $sql->bindValue(3, $usuarioPassword);
        $sql->bindValue(4, $usuarioId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    public function delete_usuario($usuarioId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE usuario set usuarioEstado=0 WHERE usuarioId=?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $usuarioId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

    // Función para obtener un usuario específico de la base de datos
    public function get_usuario_by_id($usuarioId){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "SELECT * FROM usuario WHERE usuarioId = ? ;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $usuarioId);
        $sql->execute();
        return $resultado = $sql->fetchAll();
    }

}
?>
