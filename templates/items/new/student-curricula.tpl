<table class="table table-striped-columns mt-5">
    <thead class="thead-light">
        <tr>
            <th colspan="5" class="text-center bg-success text-uppercase text-white">Posgrados activos</th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Currícula</th>
            <th>Grupo</th>
            <th>Fecha de inicio</th>
            <th>Fecha de finalización</th>
        <tr>
    </thead>
    <tbody>
        {foreach from=$activeCourseStudent item=item}
            <tr>
                <td>{$item.courseId}</td>
                <td>{$item.major_name} EN {$item.subject_name}</td>
                <td>{$item.group}</td>
                <td>{$item.initialDate}</td>
                <td>{$item.finalDate}</td>
            </tr>
        {/foreach}
    </tbody>
</table>

<table class="table table-striped-columns mt-5">
    <thead class="thead-light">
        <tr>
            <th colspan="5" class="text-center bg-info text-uppercase text-white">Posgrados finalizados</th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Currícula</th>
            <th>Grupo</th>
            <th>Fecha de inicio</th>
            <th>Fecha de finalización</th>
        <tr>
    </thead>
    <tbody>
        {foreach from=$finishedCourseStudent item=item}
            <tr>
                <td>{$item.courseId}</td>
                <td>{$item.major_name} EN {$item.subject_name}</td>
                <td>{$item.group}</td>
                <td>{$item.initialDate}</td>
                <td>{$item.finalDate}</td>
            </tr>
        {/foreach}
    </tbody>
</table>

<table class="table table-striped-columns mt-5">
    <thead class="thead-light">
        <tr>
            <th colspan="5" class="text-center bg-danger text-uppercase text-white">Posgrados inactivos</th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Currícula</th>
            <th>Grupo</th>
        <tr>
    </thead>
    <tbody>
        {foreach from=$inactiveCourseStudent item=item}
            <tr>
                <td>{$item.courseId}</td>
                <td>{$item.major_name} EN {$item.subject_name}</td>
                <td>{$item.group}</td>
            </tr>
        {/foreach}
    </tbody>
</table>