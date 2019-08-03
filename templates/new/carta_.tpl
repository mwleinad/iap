<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Carta Descriptiva
        </div>
        <div class="actions">
			<!--<a class="btn red" href="#" title="IMPRIMIR" onClick="onImprimirCarta('{$info.courseModuleId}')">
			Imprimir
			</a>-->
        </div>
    </div>
	
    <div class="portlet-body" style='text-align:justify'>
			
			
	<form id="frmGral" >
		<input type="hidden" name="mId" value="{$mId}">
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td style="width:280px">Nombre del Curso</td>
					<td>{$info.name}</td>
				</tr>
				<tr>
					<td>Institución</td>
					<td>Instituto de Administración Pública del estado de Chiapas A.C.</td>
				</tr>
				<tr>
					<td>Nombre del Instructor</td>
					<td>{$infoP.name} {$infoP.lastname_paterno} {$infoP.lastname_materno} </td>
				</tr>
			</table>
			<br>
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td style="width:280px">Perfil del Participante</td>
					<td>
					<textarea name="perfilParticipante" class="form-control">{$info.perfilParticipante}</textarea>
					</td>
				</tr>
				<tr>
					<td>Duracion</td>
					<td><input type="text" name="duracion" class="form-control" value="{$info.duracion}"></td>
				</tr>
				<tr>
					<td>Num. Participantes</td>
					<td><input type="text" name="numParticipante" class="form-control" value="{$info.numParticipantes}"></td>
				</tr>
				<tr>
					<td>Horario</td>
					<td><input type="text" name="horario" class="form-control" value="{$info.horario}"></td>
				</tr>
			</table>
			<br>
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td style="width:280px">Objetivo General</td>
					<td></td>
				</tr>
				<tr>
					<td>Objetivos Particulares</td>
					<td><textarea name="objetivoParticular" class="form-control">{$info.objetivoParticular}</textarea></td>
				</tr>
				<tr>
					<td>estructura Tematica</td>
					<td><textarea name="tematica" class="form-control">{$info.estructuraTematica}</textarea></td>
				</tr>
				<tr>
					<td>Criterios de Evaluación</td>
					<td><textarea name="criterioEvaluacion" class="form-control">{$info.criteriosEvaluacion}</textarea></td>
				</tr>
				<tr>
					<td>Tecnicas Instruccionales</td>
					<td><textarea name="tecnicasInstruccionales" class="form-control">{$info.tecnicas}</textarea></td>
				</tr>
			</table>
			<br>
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td colspan="2">Elaboracion de trabajos que evidencien sus avances en el proyecto</td>
				</tr>
				<tr>
					<td colspan="2">Requerimientos</td>
				</tr>
				<tr>
					<td style="width:280px">Lugar</td>
					<td><input type="text" name="lugar" class="form-control"></td>
				</tr>
				<tr>
					<td>Del equipo</td>
					<td><input type="text" name="delEquipo" class="form-control"></td>
				</tr>
				<tr>
					<td>Material Didactico</td>
					<td><input type="text" name="materialDidactico" class="form-control"></td>
				</tr>
			</table>
			<br>
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td colspan="2">Bibliografia<br>
					<textarea name="bibliografia" class="form-control">{$info.bibliografias}</textarea>
					</td>
				</tr>
			</table>
	</form>
		<center>
			<button class="btn {$BUTTON_COLOR}" type="button" onClick="onSaveCarta()">Guardar</button>
		</center>
    </div>
</div>
