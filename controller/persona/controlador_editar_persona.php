<?php

    require '../../model/modelo_persona.php';
    $MP = new Modelo_Persona();
    $error="";
    $contador=0;
    $id = htmlspecialchars(strtoupper($_POST['id']),ENT_QUOTES,'UTF-8');
    $nombre = htmlspecialchars(strtoupper($_POST['nombre']),ENT_QUOTES,'UTF-8');
    $apepat = htmlspecialchars(strtoupper($_POST['apepat']),ENT_QUOTES,'UTF-8');
    $apemat = htmlspecialchars(strtoupper($_POST['apemat']),ENT_QUOTES,'UTF-8');
    $ndocumentoactual = htmlspecialchars(strtoupper($_POST['ndocumentoactual']),ENT_QUOTES,'UTF-8');
    $ndocumentonuevo = htmlspecialchars(strtoupper($_POST['ndocumentonuevo']),ENT_QUOTES,'UTF-8');
    $tdocumento = htmlspecialchars(strtoupper($_POST['tdocumento']),ENT_QUOTES,'UTF-8');
    $sexo = htmlspecialchars(strtoupper($_POST['sexo']),ENT_QUOTES,'UTF-8');
    $telefono = htmlspecialchars(strtoupper($_POST['telefono']),ENT_QUOTES,'UTF-8');
    $estatus = htmlspecialchars(strtoupper($_POST['estatus']),ENT_QUOTES,'UTF-8');
    
    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/",$nombre)){
        $contador++;
        $error.= "El nombre debe contener solo letras.<br>";
    }

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/",$apepat)){
        $contador++;
        $error.= "El apellido paterno debe contener solo letras.<br>";
    }

    if(!preg_match("/^(?!-+)[a-zA-Z-ñáéíóú\s]*$/",$apemat)){
        $contador++;
        $error.= "El apellido materno debe contener solo letras.<br>";
    }

    if (!preg_match("/^[[:digit:]\s]*$/",$ndocumentonuevo)) {
        $contador++;
        $error.= "El número del documento debe contener solo números.<br>";
    }

    if (!preg_match("/^[[:digit:]\s]*$/",$telefono)) {
        $contador++;
        $error.= "El número de teléfono debe contener solo números.<br>";
    }

    if($contador>0){
        echo $error;
    }else{
        $consulta = $MP->Editar_Persona($id,$nombre,$apepat,$apemat,$ndocumentoactual,$ndocumentonuevo,$tdocumento,$sexo,$telefono,$estatus);
        echo $consulta;
    }

?>