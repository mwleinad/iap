<?php

class Payments
{
	public function dt_payments_request() {
		$table = 'pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id';  
		$primaryKey = 'pago_id';  
		$columns = array(
			array( 'db' => 'pago_id', 'dt' => 0 ),
			array( 'db' => 'nombre',  'dt' => 1 ), 
		); 
		$where = "conceptos.cobros = 0";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}
}
?>
