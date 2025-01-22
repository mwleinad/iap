<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>
        </span>
        Feedback
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
        <div class="sub_header">
            <i class="fas fa-bullhorn"></i> Feedback
        </div>
    </div>
    <div class="card-body col-md-8 mx-auto">
        <p class="h4 text-justify">
            Tu opinión es fundamental para ayudarnos a mejorar y ofrecerte una experiencia con la plataforma más
            efectiva y personalizada. En nombre del <strong>Instituto de Administración Pública del Estado de Chiapas
                A.C.</strong> valoramos cada comentario, sugerencia o inquietud, porque nos permite entender mejor tus
            necesidades y realizar mejoras que realmente marquen la diferencia. Queremos que te sientas escuchado y
            confiado en que trabajamos continuamente para brindarte las herramientas y el soporte necesarios para
            alcanzar tus metas.
        </p>


        <form class="form row mt-4" id="form_feedback" action="{$WEB_ROOT}/ajax/new/student.php">
            <input type="hidden" name="opcion" value="sendFeedback">
            <div class="form-group col-12">
                <label for="tipo">Tipo de Feedback</label>
                <select class="form-control" id="tipo" name="tipo">
                    <option value="Sugerencia">Sugerencia</option>
                    <option value="Problema Técnico">Problema Técnico</option>
                    <option value="Pregunta">Pregunta</option>
                    <option value="Otro">Otro</option>
                </select>
            </div>
            <div class="form-group col-12">
                <label for="comentarios">Comentarios</label>
                <textarea class="form-control" id="comentarios" name="comentarios" rows="6"></textarea>
            </div>
            <div class="form-group text-center col-12">
                <button class="btn btn-success" type="submit">Enviar Feedback</button>
            </div>
        </form>
    </div>
</div>