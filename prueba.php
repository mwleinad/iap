<?php 

echo "hola mundo";
echo "un cambio";
/*
if ($item['cobros'] > 0) {
    $periodo = 1;
    if ($item['cobros'] == 1) { 
        $conceptos->setPeriodo($periodo); 
        $fecha_inicial =  date("Y-m-d", strtotime($_POST['initialDate'] . "+ " . $item['periodicidad'] . " days"));
        $fecha_limite = $item['tolerancia'] > 0 ? date("Y-m-d", strtotime($fecha_inicial . "+ " . $item['tolerancia'] . " days")) : $fecha_inicial;
        $conceptos->setFechaCobro("'$fecha_inicial'");
        $conceptos->setFechaLimite("'$fecha_limite'"); 
        $conceptos->crear_relacion_curso();
    } else {
        $fecha_inicial = ""; 
        $cantidadMaterias = 0;
        if ($item['concepto_id'] == 3 || $item['concepto_id'] == 4) {
            $tipoMateria = $item['concepto_id'] == 4 ? 0 : 1;
            $materias = $subject->materiasPeriodo($tipoMateria);
            // print_r($materias);
        }
        for ($i = 0; $i < $item['cobros']; $i++) {
            $fecha_inicial = empty($fecha_inicial) ? date('Y-m-d', strtotime($_POST['initialDate'] . "+ " . $item['periodicidad'] . " days")) : date('Y-m-d', strtotime($fecha_inicial . "+ " . $item['periodicidad'] . " days"));
            $fecha_limite = date("Y-m-d", strtotime($fecha_inicial . "+" . $item['tolerancia'] . " days"));
            $conceptos->setFechaCobro("'$fecha_inicial'");
            $conceptos->setFechaLimite("'$fecha_limite'");
            if ($item['concepto_id'] == 1) { //Reinscripciones
                $periodo++;
                $conceptos->setPeriodo($periodo);
                if($periodo > $periodos){
                    break;
                }
            }
            if ($item['concepto_id'] == 3 || $item['concepto_id'] == 4) { //Materias
                if($materias[$periodo - 1]['materias'] == 0){
                    break;
                }
                if ($materias[$periodo - 1]['materias'] > $cantidadMaterias) {
                    $cantidadMaterias++;
                    $conceptos->setPeriodo($periodo);
                } else {
                    $cantidadMaterias = 1;
                    $periodo++;
                    $conceptos->setPeriodo($periodo);
                }
            }
            if($periodo > $periodos){
                break;
            }
            $conceptos->crear_relacion_curso();
        }
    }
}else{
    $conceptos->setFechaCobro("NULL");
    $conceptos->setFechaLimite("NULL"); 
    $conceptos->crear_relacion_curso();
}
*/
