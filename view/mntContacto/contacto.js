var tabla;

function init(){
    $("#mnt_form").on("submit",function(e){
        guardaryeditar(e);	
    });
}

function guardaryeditar(e){
    e.preventDefault();
    var formData = new FormData($("#mnt_form")[0]);
    $.ajax({
        url: "../../controllers/contactoControllers.php?op=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(datos){    
            console.log(datos);

            $('#mnt_form')[0].reset();
            /*TODO: Ocultar modal */
            $("#mdlmnt").modal('hide');

            $('#lista_data').DataTable().ajax.reload();

            swal({
                title: 'Cotizador',
                text: 'Resgistro GUardado',
                icon: 'success',
                confirmButtonClass: 'btn-success'
            });
           
        }
    });
}

function editar(cont_id){
    $('#mdltitulo').html('Editar Registro');

    $.ajax({
        url: "../../controllers/contactoControllers.php?op=mostrar",
        data: { contactoId: cont_id },
        type: "POST",
        dataType: "json",
        beforeSend: function() {
            //TODO: Aquí puedes mostrar el modal de carga
            $('#mdlcarga').modal('show');
        },
        success: function(data) {
            setTimeout(function() {
                //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                $('#mdlcarga').modal('hide');
                $('#contactoId').val(data.contactoId);
                $('#clienteId').val(data.contactoClienteId).trigger("change");
                $('#cargoId').val(data.contactoCargoId).trigger("change");
                $('#contactoNombre').val(data.contactoNombre);
                $('#contactoEmail').val(data.contactoEmail);
                $('#contactoTelefono').val(data.contactoTelefono);

                $('#mdlmnt').modal('show');
            }, 2000);
        },
        error: function() {
            //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
            $('#mdlcarga').modal('hide');
        }
    });
}

function eliminar(cont_id){
    swal({
        title: 'Eliminar Registro?',
        text: 'Esta seguro de eliminar el registro!',
        icon: 'error',
        buttons: {
            cancel: {
            text: 'Cancelar',
            value: null,
            visible: true,
            className: 'btn btn-default',
            closeModal: true,
            },
            confirm: {
            text: 'Eliminar',
            value: true,
            visible: true,
            className: 'btn btn-danger',
            closeModal: true
            }
        }
    }).then((isConfirm) => {
        if (isConfirm) {
            $.ajax({
            url: "../../controllers/contactoControllers.php?op=eliminar",
            type: "POST",
            data: { contactoId: cont_id },
            beforeSend: function() {
                //TODO: Mostrar el modal de espera aquí
                $('#mdlcarga').modal('show');
            },
            success: function(data) {
                //TODO: Ocultar el modal de espera aquí
                setTimeout(function() {
                    //TODO: Ocultar el modal de espera aquí
                    $('#mdlcarga').modal('hide');

                    swal({
                        title: "Cotizador!",
                        text: "Registro Eliminado.",
                        icon: "success",
                        confirmButtonClass: "btn-success"
                    });
                    //TODO: Manejar la respuesta del servidor aquí
                }, 2000);
                //TODO: Manejar la respuesta del servidor aquí
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Ocultar el modal de espera aquí
                $('#mdlcarga').modal('hide');
                //TODO: Manejar el error aquí
            }
            });

            $('#lista_data').DataTable().ajax.reload();
        }
    });
}

$(document).ready(function(){

    $("#cargoId").select2({placeholder: "Seleccionar"})

    /*TODO: LLenar combo cargo */
    $.post("../../controllers/cargoControllers.php?op=combo",function(data, status){
        $("#cargoId").html(data)
    });

    $("#clienteId").select2({placeholder: "Seleccionar"})

    /*TODO: LLenar combo clinte */
    $.post("../../controllers/clienteControllers.php?op=combo",function(data, status){
        $("#clienteId").html(data)
    });

    tabla=$('#lista_data').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5'
                ],
        "ajax":{
            url: '../../controllers/contactoControllers.php?op=listar',
            type : "post",
            dataType : "json",						
            error: function(e){
            	
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo":true,
        "iDisplayLength": 10,
        "autoWidth": false,
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Mostrando un total de _TOTAL_ registros",
            "sInfoEmpty":      "Mostrando un total de 0 registros",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix":    "",
            "sSearch":         "Buscar:",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst":    "Primero",
                "sLast":     "Último",
                "sNext":     "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }     
    }).DataTable(); 
});

$(document).on("click","#btnnuevo", function(){
    $('#mnt_form')[0].reset();
    $('#contactoClienteId').val([]).trigger("change");
    $('#contactoCargoId').val([]).trigger("change");
    $('#mdltitulo').html('Nuevo Registro');
    $('#mdlmnt').modal('show');
});

init();