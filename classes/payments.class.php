<?php

class Payments extends Course
{
	public $invoiceId;

	public function setInvoiceId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->invoiceId = $value;
	}

	public function getInvoiceId()
	{
		return $this->invoiceId;
	}

	public $paymentId;

	public function setPaymentId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->paymentId = $value;
	}

	public function getPaymentId()
	{
		return $this->paymentId;
	}

	public $paymentMethod;

	public function setPaymentMethod($value)
	{
		$this->Util()->ValidateString($value, 60, 1, 'Forma de Pago');
		$this->paymentMethod = $value;
	}

	public function getPaymentMethod()
	{
		return $this->paymentMethod;
	}

	public $comments;

	public function setComments($value)
	{
		$this->Util()->ValidateString($value, 60, 1, 'Forma de Pago');
		$this->comments = $value;
	}

	/**********************************************************************////
	public function setAutorize($value)
	{
		$this->Util()->ConvertStringToCSV($value);
		$this->autorize = $value;
	}

	/*****************************************************************************/


	public function getComments()
	{
		return $this->comments;
	}

	public $date;

	public function setDate($value)
	{
		$this->Util()->ValidateString($value, 60, 1, 'Fecha');
		$value = $this->Util()->FormatDateMySql($value);
		$this->date = $value;
	}

	public function getDate()
	{
		return $this->date;
	}


	public $debt;

	public function setDebt($value)
	{
		$this->Util()->ValidateFloat($value);
		$this->debt = $value;
	}

	public function getDebt()
	{
		return $this->debt;
	}

	public $amount;

	public function setAmount($value)
	{
		$this->Util()->ValidateFloat($value);
		$this->amount = $value;
	}

	public function getAmount()
	{
		return $this->amount;
	}

	public $amountApplied;

	public function setAmountApplied($value)
	{
		$this->Util()->ValidateFloat($value);
		$this->amountApplied = $value;
	}

	public function getAmountApplied()
	{
		return $this->amountApplied;
	}

	public $credit;

	public function setCredit($value)
	{
		$this->Util()->ValidateFloat($value);
		$this->credit = $value;
	}

	public function getCredit()
	{
		return $this->credit;
	}

	public $anticipo;

	public function setAnticipo($value)
	{
		$this->Util()->ValidateFloat($value);
		$this->anticipo = $value;
	}

	public function getAnticipo()
	{
		return $this->anticipo;
	}


	function InvoicesCount($desde, $hasta, $status, $courseId = NULL, $name = NULL, $control = NULL)
	{
		$desde = $this->Util()->FormatDateMySql($desde);
		$hasta = $this->Util()->FormatDateMySql($hasta);

		if($status)
		{
			//$addStatus = "AND invoice.status = '".$status."'";
		}

		if($courseId)
		{
			$addCourse = "AND invoice.courseId = '".$courseId."'";
		}

		if($name)
		{
			$addName = "AND (user.names LIKE '%".$name."%' || user.lastNamePaterno LIKE '%".$name."%' || user.lastNameMaterno LIKE '%".$name."%')";
		}

		if($control)
		{
			$addControl = "AND user.controlNumber = '".$control."'";
		}

		$this->Util()->DB()->setQuery("
			SELECT COUNT(*) FROM invoice
			LEFT JOIN user ON user.userId = invoice.userId
			WHERE
				dueDate > '".$desde."' AND dueDate < '".$hasta."' ".$addStatus." ".$addCourse." ".$addName." ".$addControl);
		$result = $this->Util()->DB()->GetSingle();
		return $result;

	}

	function verificarInvoices(){

	        $this->Util()->DB()->setQuery("SELECT  `userId` FROM  `user` where type='student'");
			$result = $this->Util()->DB()->GetResult();


		$studen=new Student();

			foreach($result as $row){

				   $this->Util()->DB()->setQuery("SELECT  `courseId`  FROM  `user_subject` where alumnoId='".$row[0]."'");
			       $respuesta = $this->Util()->DB()->GetResult();
			                    if(count($respuesta)>0)
			         		      {


								                 foreach($respuesta as $fila)
								                   {
												                    $this->Util()->DB()->setQuery("SELECT  `invoiceId`  FROM  `invoice` where userId='".$row[0]."'  and courseId='".$fila[0]."' ");
	               									                $datos = $this->Util()->DB()->GetResult();
                                                                       if(count($datos)==0)
																	  $studen->AddInvoices($row[0],$fila[0]);

										           }
								  }


			}


	}


	function Invoices($desde, $hasta, $status, $courseId = NULL, $name = NULL, $control = NULL)
	{
		$desde = $this->Util()->FormatDateMySql($desde);
		$hasta = $this->Util()->FormatDateMySql($hasta);
	        $this->verificarInvoices();
		if($status)
		{
			//$addStatus = "AND invoice.status = '".$status."'";
		}

		if($courseId)
		{
			$addCourse = "AND invoice.courseId = '".$courseId."'";
		}

		if($name)
		{
			$addName = "AND (user.names LIKE '%".$name."%' || user.lastNamePaterno LIKE '%".$name."%' || user.lastNameMaterno LIKE '%".$name."%')";
		}

		if($control)
		{
			$addControl = "AND user.controlNumber = '".$control."'";
		}

		$this->Util()->DB()->setQuery("
			SELECT *, invoice.status AS status FROM invoice
			LEFT JOIN user ON user.userId = invoice.userId
			LEFT JOIN course ON course.courseId = invoice.courseId
			LEFT JOIN subject ON subject.subjectId = course.subjectId
			WHERE
				dueDate > '".$desde."' AND dueDate < '".$hasta."' ".$addStatus." ".$addCourse." ".$addName." ".$addControl." 
			ORDER BY dueDate ASC");
		//	echo $this->Util()->DB()->query;
		$result = $this->Util()->DB()->GetResult();

		foreach($result as $key => $res)
		{
//			print_r($res);
			//cuantos pagos se van haciendo
			$result[$key]["payment"] = $this->ActivePayments($res["invoiceId"]);
			$result[$key]["payment"] = $this->Util()->DB()->GetSingle();

			$result[$key]["debt"] = $result[$key]["amount"] - $result[$key]["payment"];

			if($result[$key]["debt"] <= 0)
			{
				$result[$key]["status"] = "Pagada";
			}

			$this->Util()->DB()->setQuery("
				SELECT SUM(credit) FROM payment
				WHERE
					invoiceId = '".$res["invoiceId"]."' 
				ORDER BY date ASC");
			$result[$key]["credit"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
				SELECT * FROM payment
				WHERE
					invoiceId = '".$res["invoiceId"]."' 
				ORDER BY date ASC");
			$result[$key]["payments"] = $this->Util()->DB()->GetResult();

			$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
			$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
			$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);

		}


		return $result;
	}

	function InvoiceDelete()
	{
			$sql = "DELETE FROM 
					invoice 
					WHERE 
						invoiceId='" . $this->invoiceId . "'";
	//		$result = $this->Util()->DB()->DeleteData();

			$sql = "DELETE FROM 
					payment 
					WHERE 
						invoiceId='" . $this->invoiceId . "'";
	//		$result = $this->Util()->DB()->DeleteData();

			if($result > 0)
			{
				$result = true;
				$this->Util()->setError(90001,'complete', "Se ha eliminado el recibo correctamente");
			}
			else
			{
				$result = false;
				$this->Util()->setError(90012,'error', "No se ha podido eliminar el recibo");
			}
			$this->Util()->PrintErrors();
			return $result;

	}

	function CurrentPayment()
	{
			$sql = "SELECT MAX(paymentId) FROM 
					payment";
		 	$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetSingle() + 1;

			return $result;
	}

	function ActivePayments($id)
	{
		$this->Util()->DB()->setQuery("
			SELECT SUM(amountApplied) FROM payment
			WHERE
				invoiceId = '".$id."' 
			ORDER BY date ASC");
		$res["payment"] = $this->Util()->DB()->GetSingle();
		return $res["payment"];
	}

	function InvoiceInfo()
	{
			$this->Util()->DB()->setQuery("SELECT *, invoice.status AS status FROM invoice
			LEFT JOIN user ON user.userId = invoice.userId
			LEFT JOIN course ON course.courseId = invoice.courseId
			LEFT JOIN subject ON subject.subjectId = course.subjectId
			WHERE
				invoiceId = '".$this->invoiceId."'");
			$res = $this->Util()->DB()->GetRow();

			//cuantos pagos se van haciendo
			$res["payment"] = $this->ActivePayments($res["invoiceId"]);
			$res["debt"] = $res["amount"] - $res["payment"];
			error_log($res["debt"]);

			if($res["debt"] <= 0)
			{
				$res["status"] = "Pagada";
				$this->Util()->DB()->setQuery("Update invoice set status='Pagada'  where invoiceId=\"$res[0]\"   ");
				 $this->Util()->DB()->UpdateData();
			}
			else
			{
				$res["status"] = "Sin Pagar";
			}

			$this->Util()->DB()->setQuery("
				SELECT SUM(credit) FROM payment
				WHERE
					invoiceId = '".$res["invoiceId"]."' 
				ORDER BY date ASC");
			$res["credit"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
				SELECT * FROM payment
				WHERE
					invoiceId = '".$res["invoiceId"]."' 
				ORDER BY date ASC");
			$res["payments"] = $this->Util()->DB()->GetResult();

			$this->Util()->DB()->setQuery("
				SELECT anticipo FROM payment
				LEFT JOIN invoice ON payment.invoiceId = invoice.invoiceId
				WHERE
					userId = '".$res["userId"]."' 
				ORDER BY paymentId DESC LIMIT 1");
			$res["saldoFavor"] = $this->Util()->DB()->GetSingle();

			$res["names"] = $this->Util()->DecodeTiny($res["names"]);
			$res["lastNamePaterno"] = $this->Util()->DecodeTiny($res["lastNamePaterno"]);
			$res["lastNameMaterno"] = $this->Util()->DecodeTiny($res["lastNameMaterno"]);

			return $res;
	}

	function NewPayment()
	{
		if($this->Util()->PrintErrors())
		{
			return false;
		}

		$this->Util()->DB()->setQuery("
			INSERT INTO  `payment` (
				`date` ,
				`invoiceId` ,
				`amount` ,
				`paymentMethod` ,
				`comments` ,
				`credit` ,
				`amountApplied` ,
				`account` ,
				`anticipo`,
				`autorize`
				)
				VALUES (
					'".$this->date."',  
					'".$this->invoiceId."',  
					'".$this->amount."',  
					'".$this->paymentMethod."',  
					'".$this->comments."',  
					'".$this->credit."',  
					'".$this->amountApplied."', 
					'' ,  
					'".$this->anticipo."',  
					'".$this->autorize."')");
		$this->Util()->DB()->InsertData();

		$this->Util()->setError(90000, 'complete', "El pago se realizo exitosamente");
		$this->Util()->PrintErrors();

		$invoice = $this->InvoiceInfo();

		if($invoice["status"] == "Pagada")
		{
			$this->Util()->DB()->setQuery("
				UPDATE user_subject SET status = 'activo'
					WHERE alumnoId = '".$invoice["userId"]."' AND courseId = '".$invoice["courseId"]."'");
			$this->Util()->DB()->UpdateData();
		}

		$userId=$invoice['userId'];
		$courseId=$invoice['courseId'];


		$student=new Student();
        $result=$student->StudentCoursesU($userId,$courseId);

		//si el invoice ya esta pagado entonces activar al usuario
		include_once(DOC_ROOT."/properties/messages.php");
		//enviar correo
		$sendmail = new SendMail;

		$details_body = array();
		$details_subject = array();

		$mensaje="
	El Instituto de Administración Pública del Estado de Chiapas, A. C., agradece tu pago y te informa que este ha sido autorizado. El acceso a:

	El(la) ".$result['majorName']." en <b> ".$result['nombre']."</b>

Se encuentra activo por lo que ya puedes acceder a la currícula que hayas elegido.
	";

		$email = $invoice["email"];
		$nombre = $invoice["lastNamePaterno"]." ".$invoice["lastNameMaterno"]." ".$invoice["names"];
//		$attachment = DOC_ROOT."/files/solicitudes/".$file;
		$sendmail->Prepare($message[2]["subject"], $this->Util()->ConvertStringToCSV($mensaje), $details_body, $details_subject, $email, $nombre);

		return true;
	}

	function EnumeratePayments()
	{
			$sql = "SELECT * FROM payment 
				WHERE invoiceId = '".$this->invoiceId."'";
		 	$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			//print_r($result);
			return $result;
	}

	function PaymentInfo()
	{
			$sql = "SELECT * FROM payment 
				WHERE paymentId = '".$this->paymentId."'";
		 	$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetRow();
			//print_r($result);
			return $result;
	}

	function PaymentDelete()
	{
			$sql = "DELETE FROM 
					payment 
					WHERE 
						paymentId='" . $this->paymentId . "'";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->DeleteData();
			$this->Util()->setError(90001,'complete', "Se ha eliminado el pago correctamente");
			$this->Util()->PrintErrors();
			return $result;

	}

	function PaymentChangeStatus()
	{
		$info = $this->PaymentInfo();

		if($info["status"] == "activo")
		{
			$update = "cancelado";
		}
		else
		{
			$update = "activo";
		}

		$sql = "UPDATE  
				payment SET status = '".$update."'
				WHERE 
					paymentId='" . $this->paymentId . "'";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->UpdateData();

		$this->Util()->setError(90012,'error', "Se ha cambiado el estatus del pago");
		$this->Util()->PrintErrors();
		return $result;

	}

	function Config($id = null)
	{

		$this->Util()->DB()->setQuery("SELECT * FROM payment  where invoiceId='".$id."'  ");
		$result = $this->Util()->DB()->GetResult();
		return $result;



	}

		function Config_cont($id)
	{

		$this->Util()->DB()->setQuery("SELECT registro(*) FROM payment  where invoiceId='".$id."' ");
		$result = $this->Util()->DB()->GetResult();
		return $result;



	}



}
?>
