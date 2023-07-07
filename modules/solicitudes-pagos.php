<?php 
if($_POST){
    $response = $payments->dt_payments_request($_POST); 
    print_r(json_encode($response)); 
    exit;
}