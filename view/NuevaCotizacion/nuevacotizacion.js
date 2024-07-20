$(document).ready(function(){

    $('#panel2').addClass('hide');
    $('#panel3').addClass('hide');
    $('#panel4').addClass('hide');

    $("#clienteId").select2({ placeholder: "Seleccionar" });

    $("#contactoId").select2({ placeholder: "Seleccionar" });

    $("#categoriaId").select2({ placeholder: "Seleccionar" });

    $("#productoid").select2({ placeholder: "Seleccionar" });

    $("#categoriaId_a").select2({ placeholder: "Seleccionar" });

    $("#productoId_a").select2({ placeholder: "Seleccionar" });

    /* TODO: Llenar Combo Cliente*/
    $.post("../../controllers/clienteControllers.php?op=combo",function(data, status){
        $('#clienteId').html(data);
    });

    /* TODO: Llenar Combo Categoria*/
    $.post("../../controllers/categoriaControllers.php?op=combo",function(data, status){
        $('#categoriaId').html(data);
        $('#categoriaId_a').html(data);
    });

    $("#clienteId").change(function(){
        $("#clienteId option:selected").each(function(){
            cli_id = $(this).val();

            $.post("../../controllers/contactoControllers.php?op=combo_x_cliente",{clienteId:cli_id},function(data){
                $('#contactoId').html(data);
            });

            $.post("../../controllers/clienteControllers.php?op=mostrar",{clienteId:cli_id},function(data){
                data=JSON.parse(data);
                $('#clienteRuc').val(data.clienteRuc);
            });

        })
    });

    $("#categoriaId").change(function(){
        $("#categoriaId option:selected").each(function(){
            categoriaid = $(this).val();

            $.post("../../controllers/productoControllers.php?op=combo_x_categoria",{productoCategoriaId:categoriaid},function(data){
                $('#productoId').html(data);
            });

        })
    });

    $("#categoriaId_a").change(function(){
        $("#categoriaId_a option:selected").each(function(){
            categoriaid = $(this).val();

            $.post("../../controllers/productoControllers.php?op=combo_x_categoria",{productoCategoriaId:categoriaid},function(data){
                $('#productoId_a').html(data);
            });

        })
    });

    $("#contactoId").change(function(){
        $("#contactoId option:selected").each(function(){
            con_id = $(this).val();

            $.post("../../controllers/contactoControllers.php?op=mostrar",{contactoId:con_id},function(data){
                data=JSON.parse(data);
                $('#contactoTelefono').val(data.contactoTelefono);
                $('#contactoEmail').val(data.contactoEmail);
            });
        })
    });

    $("#productoId").change(function(){
        $("#productoId option:selected").each(function(){
            productoid = $(this).val();

            $.post("../../controllers/productoControllers.php?op=mostrar",{productoId:productoid},function(data){
                data=JSON.parse(data);
                $('#cotd_precio').val(data.productoPrecio);
            });
        })
    });

    $("#productoid_a").change(function(){
        $("#productoid_a option:selected").each(function(){
            productoid = $(this).val();

            $.post("../../controllers/productoControllers.php?op=mostrar",{productoId:productoid},function(data){
                data=JSON.parse(data);
                $('#cotd_precio_a').val(data.productoPrecio);
            });
        })
    });
});

$(document).on("click","#btnsiguiente1",function(){

    var cotizacionId = $('#cotizacionId').val();
    /* var usu_id = $('#xusu_id').val(); */

    var cli_id = $('#clienteId').val();
    var con_id = $('#contactoId').val();
    var cli_ruc = $('#clienteRuc').val();
    var con_telf = $('#contactoTelefono').val();
    var con_email = $('#contactoEmail').val();
    var cot_descrip = $('#cotizacionDescripcion').val();

    if(cli_id=="" || con_id=="" || cli_ruc=="" || con_telf=="" || con_email==""){
        swal({
            title: "Cotizador!",
            text: "Campos Vacios.",
            icon: "error",
            confirmButtonClass: "btn-danger"
        });

        $.gritter.add({
			title: 'Cotizador!',
			text: 'Campos Vacios, por favor validar.',
			image: '../../assets/img/cerrar.png',
			sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
			time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
		});

    }else{
        $('#panel1').addClass('hide');
        $('#panel2').removeClass('hide');

        $.ajax({
            url: "../../controllers/cotizadorControllers.php?op=guardar",
            data: {                
                cotizacionId:cotizacionId,
                cotizacionClienteId:cli_id,
                cotizacionContactoId:con_id,
                clienteRuc:cli_ruc,
                contactoTelefono:con_telf,
                contactoEmail:con_email,
                cotizacionDescripcion:cot_descrip,
                /* usu_id:usu_id */
            },
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
                    /* data= JSON.parse(data); 
                    console.log(data);  */
                    $('#cotizacionId').val(data.cotizacionId);
                    console.log('cotizacion', cotizacionId);
                    $('#mdlmnt').modal('show');
                }, 500);
            },
            error: function() {
              //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
              $('#mdlcarga').modal('hide');
            }
        });

        $.gritter.add({
			title: 'Cotizador!',
			text: 'Su cotizacion se guardo en borradores.',
			image: '../../assets/img/cheque.png',
			sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
			time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
		});

    }

});

$(document).on("click","#btnsiguiente2",function(){
    var contactoid = $('#contactoId').val();

    /* TODO: Valida si el listado de items tiene informacion */
    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=listara_vacio",
        data: { contactoid:contactoid,cotd_tipo:'D' },
        type: "POST",
        dataType: "html",
        beforeSend: function() {
          //TODO: Aquí puedes mostrar el modal de carga
          $('#mdlcarga').modal('show');
        },
        success: function(data) {
            setTimeout(function() {
                //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                $('#mdlcarga').modal('hide');
                if(data==0){
                    swal({
                        title: "Cotizador!",
                        text: "Lista Vacia.",
                        icon: "error",
                        confirmButtonClass: "btn-danger"
                    });
            
                    $.gritter.add({
                        title: 'Cotizador!',
                        text: 'Lista Vacia, por favor validar.',
                        image: '../../assets/img/cerrar.png',
                        sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
                        time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
                    });
                }else{
                    $('#panel2').addClass('hide');
                    $('#panel3').removeClass('hide');
                }
            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });

});

$(document).on("click","#btnanterior2",function(){
    $('#panel2').addClass('hide');
    $('#panel1').removeClass('hide');
});

$(document).on("click","#btnsiguiente3",function(){
    $('#panel3').addClass('hide');
    $('#panel4').removeClass('hide');

    var contactoid = $('#contactoId').val();

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=listara_vacio",
        data: { contactoid:contactoid,cotd_tipo:'A' },
        type: "POST",
        dataType: "html",
        beforeSend: function() {
          //TODO: Aquí puedes mostrar el modal de carga
          $('#mdlcarga').modal('show');
        },
        success: function(data) {
            setTimeout(function() {
                //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                $('#mdlcarga').modal('hide');
                if(data==0){
                    $('#list_adicionales_mostrar').hide();
                }else{
                    $('#list_adicionales_mostrar').show();
                }
            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=mostrar",
        data: { contactoid: contactoid },
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

                $('#v_cli_nom').html(data.cli_nom);
                $('#v_cli_ruc').html("RUC: "+data.cli_ruc);

                $('#v_con_nom').html(data.con_nom);
                $('#v_con_telf').html("Telf: "+data.con_telf);
                $('#v_con_email').html(data.con_email);

                $('#v_emp_nom').html(data.emp_nom);
                $('#v_emp_ruc').html("RUC: "+data.emp_ruc);
                $('#v_emp_telf').html("Telf: "+data.emp_telf);
                $('#v_emp_email').html(data.emp_email);

                $('#v_mes_en_texto').html("Cotizacion / "+data.mes_en_texto);
                $('#v_fech_crea_format').html(data.fecha_formateada);
                $('#v_contactoid').html("Nro #: "+data.contactoid);

                $('#v_cot_total').html(data.cot_total);

                $('#v_emp_web2').html("<i class='fa fa-fw fa-lg fa-globe'></i> "+data.emp_web);
                $('#v_emp_telf2').html("<i class='fa fa-fw fa-lg fa-phone-volume'></i> "+data.emp_telf);
                $('#v_emp_email2').html("<i class='fa fa-fw fa-lg fa-envelope'></i> "+data.emp_email);

                $('#v_usu_nom').html(data.usu_nom);

            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=listarv",
        data: { contactoid:contactoid,cotd_tipo:'D' },
        type: "POST",
        dataType: "html",
        beforeSend: function() {
          //TODO: Aquí puedes mostrar el modal de carga
          $('#mdlcarga').modal('show');
        },
        success: function(data) {
            setTimeout(function() {
                //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                $('#mdlcarga').modal('hide');
                $('#v_tabla_detalle').html(data);

            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=listarv",
        data: { contactoid:contactoid,cotd_tipo:'A' },
        type: "POST",
        dataType: "html",
        beforeSend: function() {
          //TODO: Aquí puedes mostrar el modal de carga
          $('#mdlcarga').modal('show');
        },
        success: function(data) {
            setTimeout(function() {
                //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                $('#mdlcarga').modal('hide');
                $('#v_tabla_detalle_a').html(data);

            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });

});

$(document).on("click","#btnanterior3",function(){
    $('#panel3').addClass('hide');
    $('#panel2').removeClass('hide');
});

$(document).on("click","#btnanterior4",function(){
    $('#panel4').addClass('hide');
    $('#panel3').removeClass('hide');
});

$(document).on("click","#btnagregardetalle",function(){ 
    var cotizacionId = $('#cotizacionId').val();

    var categoriaid = $('#categoriaId').val();
    var productoid = $('#productoId').val();
    var cotd_precio = $('#cotd_precio').val();
    var cotd_cant = $('#cotd_cant').val();

     // Verificación preliminar de variables
    /* console.log('cotizacionId:', cotizacionId); */

    if(categoriaid=="" || productoid=="" || cotd_precio=="" || cotd_cant==""){
        swal({
            title: "Cotizador!",
            text: "Campos Vacios.",
            icon: "error",
            confirmButtonClass: "btn-danger"
        });

        $.gritter.add({
			title: 'Cotizador!',
			text: 'Campos Vacios, por favor validar.',
			image: '../../assets/img/cerrar.png',
			sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
			time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
		});

    }else{

        $.ajax({
            url: "../../controllers/cotizadorControllers.php?op=detalleguardar",
            data: {
                detallecotizacionCotizacionId:cotizacionId,
                detallecotizacionCategoriaId:categoriaid,
                detallecotizacionProductoId:productoid,
                detallecotizacionPrecio:cotd_precio,
                detallecotizacionCantidad:cotd_cant
                /* cotd_tipo:"D" */
            },
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

                    listardetalle(cotizacionId); 

                    $.gritter.add({
                        title: 'Cotizador!',
                        text: 'Se registro item correctamente.',
                        image: '../../assets/img/cheque.png',
                        sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
                        time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
                    });

                    $('#mdlmnt').modal('show');
                }, 500);

                /* data = JSON.parse(data); */ 
                console.log("detallecotizacionId: " + data.detallecotizacionId); 
            },
            error: function() {
              //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
              $('#mdlcarga').modal('hide');
            }
        });

    }
});


$(document).on("click","#btnagregarmd",function(){
    var cot_id = $('#cotizacionId').val();

    var cotd_id = $('#cotd_id').val();

    var cotd_precio = $('#cotd_precio_md').val();
    var cotd_cant = $('#cotd_cant_md').val();
    var cotd_profit = $('#cotd_profit_md').val();

    if(cotd_cant=="" || cotd_profit==""){
        swal({
            title: "Cotizador!",
            text: "Campos Vacios.",
            icon: "error",
            confirmButtonClass: "btn-danger"
        });

        $.gritter.add({
			title: 'Cotizador!',
			text: 'Campos Vacios, por favor validar.',
			image: '../../assets/img/cerrar.png',
			sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
			time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
		});

    }else{

        $.ajax({
            url: "../../controllers/cotizadorControllers.php?op=actualizardetalle",
            data: {
                detallecotizacionId:cotd_id,
                detallecotizacionPrecio:cotd_precio,
                detallecotizacionCantidad:cotd_cant,
                detallecotizacionProfit:cotd_profit,
                detallecotizacionCotizacionId:cot_id,
               
            },
            type: "POST",
            dataType: "json",
            beforeSend: function() {
              //TODO: Aquí puedes mostrar el modal de carga
              $('#mdlcarga').modal('show');
            },
            success: function(data) {
                setTimeout(function() {

                    console.log(data);
                    //TODO: Aquí puedes ocultar el modal de carga y actualizar los valores
                    $('#mdlcarga').modal('hide');

                    listardetalle(cot_id);
                    /* listara(cot_id); */

                    $.gritter.add({
                        title: 'Cotizador!',
                        text: 'Se registro item correctamente.',
                        image: '../../assets/img/cheque.png',
                        sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
                        time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
                    });

                    $('#modald').modal('hide');
                }, 500);

                /* data = JSON.parse(data); */
                console.log("cotd_id: " + data.detallecotizacionId);
            },
            error: function() {
              //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
              $('#mdlcarga').modal('hide');
            }
        });

    }
});


function listardetalle(cotizacionId){

    tabla=$('#detalle_data').dataTable({
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
            url: '../../controllers/cotizadorControllers.php?op=listardetalle',
            type : "POST",
            data : {cotizadorId:cotizacionId/* ,cotd_tipo:'D' */},
            dataType : "json",
            error: function(e){
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo":true,
        "iDisplayLength": 30,
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

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=mostrar",
        data: { cotizacionId: cotizacionId },
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

                $('#cot_subtotal').html(data.cotizacionSubTotal);
                $('#cot_profit').html(data.cotizacionProfit);
                $('#cot_total').html(data.cotizacionTotal);

            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    }); 

}


function editardetalle(detallecotizacionId) {
    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=mostrardetalle",
        data: { detallecotizacionId: detallecotizacionId },
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

                $('#cotd_id').val(data.detallecotizacionId);
                $('#categoriaNombre').val(data.categoriaNombre);
                $('#productoNombre').val(data.productoNombre);
                $('#cotd_precio_md').val(data.detallecotizacionPrecio);
                $('#cotd_cant_md').val(data.detallecotizacionCantidad);
                $('#cotd_profit_md').val(data.detallecotizacionProfit);
                $('#cotd_total_md').val(data.detallecotizacionTotal);

                $('#modald').modal('show');
            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });
}

function eliminardetalle(detallecotizacionId){
    var cotizacionId = $('#cotizacionId').val(); 

    $.ajax({
        url: "../../controllers/cotizadorControllers.php?op=eliminardetalle",
        data: {detallecotizacionId:detallecotizacionId, detallecotizacionCotizacionId:cotizacionId},
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

                listardetalle(cotizacionId);
                /* listara(cot_id); */

                $.gritter.add({
                    title: 'Cotizador!',
                    text: 'Se elimino item correctamente.',
                    image: '../../assets/img/cheque.png',
                    sticky: false,//TODO: Si es verdadero, la notificación no se cerrará automáticamente.
                    time: 2000,//TODO: Tiempo en milisegundos antes de que se cierre la notificación automáticamente.
                });

                $('#mdlmnt').modal('show');
            }, 500);
        },
        error: function() {
          //TODO: Aquí puedes ocultar el modal de carga y mostrar un mensaje de error
          $('#mdlcarga').modal('hide');
        }
    });
}


  /*Inicio - Calcular Total de Paso 2 */
  const cotdPrecioInput = document.getElementById('cotd_precio');
  const cotdCantInput = document.getElementById('cotd_cant');
  const cotdTotalInput = document.getElementById('cotd_total');
  //TODO: Función para calcular y actualizar el total
  function calcularTotal() {
      const precio = parseFloat(cotdPrecioInput.value);
      const cant = parseInt(cotdCantInput.value);
      const total = (precio * cant).toFixed(2);
      cotdTotalInput.value = total;
  }
  //TODO: Agregar event listeners para detectar cambios en los campos de precio y cantidad
  cotdPrecioInput.addEventListener('input', calcularTotal);
  cotdCantInput.addEventListener('input', calcularTotal);
  /*Fin - Calcular Total de Paso 2 */

  /*Inicio - Calcular Total de Paso 2 Modal Detalle*/
  const cotdPrecioMdInput = document.getElementById('cotd_precio_md');
  const cotdCantMdInput = document.getElementById('cotd_cant_md');
  const cotdProfitMdInput = document.getElementById('cotd_profit_md');
  const cotdTotalMdInput = document.getElementById('cotd_total_md');
  //TODO: Función para calcular y actualizar el total
  function calcularTotalMd() {
      const precio = parseFloat(cotdPrecioMdInput.value);
      const cant = parseFloat(cotdCantMdInput.value);
      const profit = parseFloat(cotdProfitMdInput.value);
      const total = (precio * cant + profit).toFixed(2);
      cotdTotalMdInput.value = total;
  }
  //TODO: Agregar event listeners para detectar cambios en los campos de precio, cantidad y profit
  cotdPrecioMdInput.addEventListener('input', calcularTotalMd);
  cotdCantMdInput.addEventListener('input', calcularTotalMd);
  cotdProfitMdInput.addEventListener('input', calcularTotalMd);
  /*Fin - Calcular Total de Paso 2 Modal Detalle*/

  /*Inicio - Calcular Total de Paso 3 */
  const cotdPrecioInput_a = document.getElementById('cotd_precio_a');
  const cotdCantInput_a = document.getElementById('cotd_cant_a');
  const cotdTotalInput_a = document.getElementById('cotd_total_a');
  //TODO: Función para calcular y actualizar el total
  function calcularTotal_a() {
      const precio_a = parseFloat(cotdPrecioInput_a.value);
      const cant_a = parseInt(cotdCantInput_a.value);
      const total_a = (precio_a * cant_a).toFixed(2);
      cotdTotalInput_a.value = total_a;
  }
  //TODO: Agregar event listeners para detectar cambios en los campos de precio y cantidad
  cotdPrecioInput_a.addEventListener('input', calcularTotal_a);
  cotdCantInput_a.addEventListener('input', calcularTotal_a);
  /*Fin - Calcular Total de Paso 3 */
 