<?php 
if($_POST){
    print_r(json_encode($payments->dt_payments_request($_POST)));
    exit;
}