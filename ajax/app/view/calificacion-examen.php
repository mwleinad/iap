<?php
	header('Access-Control-Allow-Origin: *'); 
?>
<html>
<head>
<style type="text/css">
.speech-bubble {
  background: #276e36; /* el color de fondo */
  color: #FFF; /* el color del texto */
  font-family: Arial, Sans-serif;
  font-size: 12px;
  padding: 20px 10px 10px 10px;
  text-align: center;
  width: 270px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
}
.speech-bubble:after {
  border: solid 10px transparent;
  border-top-color: #276e36;  /* igual al color de fondo */
  border-bottom: 0;
  bottom: -20px;  /* igual al borde + el padding-bottom de la definición anterior */
  content: "";
  display: block;
  height: 0;
  margin: auto;
  overflow: hidden;
  position: relative;
  width: 0;
}
.enlace {
  color: white; /* el color del texto */
  font-family: Arial, Sans-serif;
  font-size: 12px;
}
</style>
</head>

<body>
		
	<?php 
	// echo "<pre>"; print_r($activityInfoTaskExam);
	// exit;
	foreach($activityInfoTaskExam as $key=>$aux){
	?>
	<ul data-role="listview" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow">
	<li data-role="list-divider" data-theme="a" data-swatch="a" data-form="ui-bar-a" role="heading" class="ui-li-divider ui-bar-a ui-first-child green">
		<?php echo $aux["resumen"]?></li>
	<li data-form="ui-body-a" data-swatch="a" data-theme="a" class="ui-li-static ui-body-a">
		Calificación: <span class="h3"><?php echo $aux["calificacion"]?></span>
	</li>
	<li data-form="ui-body-a" data-swatch="a" data-theme="a" class="ui-li-static ui-body-a">
		Retroalimentación: <span class="h3"><?php echo $aux["retro"]?></span>
	</li>
	</ul>
	<?php 
	}
	?>


</body>
</html>
