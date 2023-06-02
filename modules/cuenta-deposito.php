<?php
$data = [
    [
        "metodo"    =>"En ventanilla",
        "dato"      =>"Con número de cuenta: <b>1031331727</b>"
    ],
    [
        "metodo"    =>"Por transferencia de un banco distinto a Banorte",
        "dato"      =>"Con número de clabe interbancaria: <b>072100010313317272</b>"
    ],
    [
        "metodo"    =>"Por transferencia con cuenta Banorte",
        "dato"      =>"Con número de Cuenta: <b>1031331727</b>"
    ],

];
$smarty->assign("banco", "BANORTE IXE");
$smarty->assign("nombre_cuenta", "IAP POSTGRADOS");
$smarty->assign("data", $data);