<?php
class MySQL
{
    var $conexion;
    function MySQL()
    {
        if(!isset($this->conexion))
        {
            $this->conexion = mysqli_connect(SQL_HOST, SQL_USER, SQL_PASSWORD, SQL_DATABASE);
        }
    }

    function consulta($consulta)
    {
        mysqli_query($this->conexion, "SET NAMES 'utf8'");
        $resultado = mysqli_query($this->conexion, $consulta);
        if(!$resultado)
        {
            echo 'MySQL Error: ' . mysqli_error();
            exit;
        }
        return $resultado;
    }

    function fetch_array($consulta)
    {
        return mysqli_fetch_array($consulta);
    }

    function num_rows($consulta)
    {
        return mysqli_num_rows($consulta);
    }

    function fetch_row($consulta)
    {
        return mysqli_fetch_row($consulta);
    }
    function fetch_assoc($consulta)
    {
        return mysqli_fetch_assoc($consulta);
    }

}

?>
