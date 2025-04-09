var tabla;

// Función que se ejecuta al inicio
function init() {
    var team_id = $("#idgrupo").val();

    // Listar registros
    listar();

    // Cargamos los items al select curso
    $.post("../ajax/cursos.php?op=selectCursos", { idgrupo: team_id }, function (r) {
        $("#curso").html(r);
        $("#curso").selectpicker('refresh');
    });

    // Guardar y editar al enviar el formulario
    $("#formulario").on("submit", function (e) {
        guardaryeditar(e);
    });

    // Capturamos el id del curso al cambiar el select
    $("#curso").change(function () {
        var idcurso = $("#curso").val();
        $("#idcurso").val(idcurso);
        listar();
    });
}

// Función para listar registros
function listar() {
    var team_id = $("#idgrupo").val();
    if (!team_id) {
        console.error("ID de grupo no definido.");
        return;
    }

    if ($.fn.DataTable.isDataTable("#tbllistado")) {
        $("#tbllistado").DataTable().destroy();
    }

    tabla = $("#tbllistado").DataTable({
        "aProcessing": true, // Activamos el procesamiento del DataTable
        "aServerSide": true, // Paginación y filtrado realizados por el servidor
        dom: 'Bfrtip', // Elementos de control de la tabla
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdf'
        ],
        "ajax": {
            url: '../ajax/calificaciones.php?op=listar',
            data: { idgrupo: team_id },
            type: "get",
            dataType: "json",
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "iDisplayLength": 10, // Paginación
        "order": [[0, "desc"]] // Ordenar (columna, orden)
    });
}

// Función para verificar y mostrar modal
function verificar(id) {
    var idcurso = $("#curso").val();

    if (!idcurso || idcurso == 0) {
        bootbox.alert('Por favor, selecciona un curso antes de asignar una calificación.');
        return;
    }

    $.post("../ajax/calificaciones.php?op=verificar", { alumn_id: id, idcurso: idcurso }, function (data) {
        data = JSON.parse(data);

        if (!data) {
            // Si no existe una calificación previa
            limpiar();
            $("#getCodeModal").modal("show");
            $.post("../ajax/alumnos.php?op=mostrar", { idalumno: id }, function (data) {
                data = JSON.parse(data);
                $("#alumn_id").val(data.id);
            });
        } else {
            // Si ya existe una calificación, cargar datos en el modal
            limpiar();
            $("#getCodeModal").modal("show");
            $("#idcalificacion").val(data.id);
            $("#alumn_id").val(data.alumn_id);
            $("#valor").val(data.val);
            $("#idcurso").val(data.block_id);
        }
    });
}

// Función para limpiar el formulario
function limpiar() {
    $("#idcalificacion").val("");
    $("#alumn_id").val("");
    $("#valor").val("");
    $("#curso").selectpicker('refresh');
    $('#getCodeModal').modal('hide');
}

// Función para guardar o editar
function guardaryeditar(e) {
    e.preventDefault(); // Evitar la acción predeterminada
    $("#btnGuardar").prop("disabled", true);
    var formData = new FormData($("#formulario")[0]);

    $.ajax({
        url: "../ajax/calificaciones.php?op=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function (datos) {
            bootbox.alert(datos);
            tabla.ajax.reload();
        }
    });

    limpiar();
}

init();
