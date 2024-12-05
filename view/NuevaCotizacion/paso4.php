<div class="panel panel-inverse" id="panel4">
    <div class="panel-heading">
        <h4 class="panel-title">Paso 4 - Vista Previa</h4>
        <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
        </div>
    </div>
    <div class="panel-body">
        <!-- begin invoice -->
        <div class="invoice">
            <!-- begin invoice-company -->
            <div class="invoice-company">
                <span class="pull-right hidden-print">
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-white m-b-10"><i class="fa fa-print t-plus-1 fa-fw fa-lg"></i> Imprimir</a>
                </span>
                Cotizador, Inc
            </div>
            <!-- end invoice-company -->
            <!-- begin invoice-header -->
            <div class="invoice-header">
                <div class="invoice-from">
                    <small>Para</small>
                    <address class="m-t-5 m-b-5">
                        <strong class="text-inverse" id="v_cli_nom"></strong><br>
                        <label style="margin-bottom: 0 !important;" id="v_cli_ruc"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_con_nom"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_con_telf"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_con_email"></label>
                    </address>
                </div>
                <div class="invoice-to">
                    <small>De</small>
                    <address class="m-t-5 m-b-5">
                        <strong class="text-inverse" id="v_emp_nom"></strong><br>
                        <label style="margin-bottom: 0 !important;" id="v_emp_ruc"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_usu_nom"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_emp_telf"></label><br>
                        <label style="margin-bottom: 0 !important;" id="v_emp_email"></label>
                    </address>
                </div>
                <div class="invoice-date">
                    <small id="v_mes_en_texto"></small>
                    <div class="date text-inverse m-t-5" style="font-size: 14px !important;" id="v_fech_crea_format"></div>
                    <div class="invoice-detail" id="v_cot_id"></div>
                </div>
            </div>
            <!-- end invoice-header -->

            <div class="invoice-content">
                <textarea class="form-control text-justify" rows="6" id="v_cot_saludo" name="v_cot_saludo">Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.</textarea>
            </div>

            <!-- begin invoice-content -->
            <div class="invoice-content">
                <!-- begin table-responsive -->
                <div class="table-responsive">
                    <table class="table table-invoice">
                        <thead>
                            <tr>
                                <th>DESCRIPCION</th>
                                <th class="text-center" width="10%">CANT</th>
                                <th class="text-right" width="20%">TOTAL</th>
                            </tr>
                        </thead>
                        <tbody id="v_tabla_detalle">

                        </tbody>
                    </table>
                </div>
                <!-- end table-responsive -->
                <!-- begin invoice-price -->
                <div class="invoice-price">
                    <div class="invoice-price-left">
                        <div class="invoice-price-row">
                            <div class="sub-price">
                                <small>SubTotal</small>
                                <span class="text-inverse" id="cot_subtotal">$ 0.00</span>
                            </div>
                            <div class="sub-price">
                                <i class="fa fa-plus text-muted"></i>
                            </div>
                            <div class="sub-price">
                                <small>Profit (20%)</small>
                                <span class="text-inverse" id="cot_profit">$ 0.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="invoice-price-right">
                        <small>TOTAL</small> <span class="f-w-500" id="v_cot_total">$ 0.00</span>
                    </div>
                </div>
                <!-- end invoice-price -->
            </div>
            <!-- end invoice-content -->

            <!-- begin invoice-note -->
            <div class="invoice-note" style="margin-top: 16px !important;">
                * IGV no incluido en el precio final<br>
            </div>
            <!-- end invoice-note -->

            <!--TODO: Costos Adicionales begin invoice-content -->
            <div id="list_adicionales_mostrar">
                <div class="invoice-content">
                    <textarea class="form-control text-justify" rows="3" id="v_cot_adicional" name="v_cot_adicional">Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:</textarea>
                </div>

                <div class="invoice-content">
                    <!-- begin table-responsive -->
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                                <tr>
                                    <th>DESCRIPCION</th>
                                    <th class="text-center" width="10%">CANT</th>
                                    <th class="text-right" width="20%">TOTAL</th>
                                </tr>
                            </thead>
                            <tbody id="v_tabla_detalle_a">

                            </tbody>
                        </table>
                    </div>
                    <!-- end table-responsive -->
                </div>
            </div>
            <!-- Fin Costos Adicionales begin invoice-content  -->

            <div class="invoice-content">
                <textarea class="form-control text-justify" rows="19" id="v_cot_contrato" name="v_cot_contrato" readonly>CONTRATO DE ACEPTACIÓN DE COTIZACIÓN

Entre Cotizador INC, en adelante "El Proveedor," y [Nombre del Cliente], en adelante "El Cliente."

El Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.

El Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.

El plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.

                </textarea>
            </div>

            <!-- begin invoice-footer -->
            <div class="invoice-footer">
                <p class="text-center m-b-5 f-w-600">
                    SU NEGOCIO ES MUY VALIOSO PARA NOSOTROS, ¡MUCHAS GRACIAS!
                </p>
                <p class="text-center">
                    <span class="m-r-10" id="v_emp_web2"></span>
                    <span class="m-r-10" id="v_emp_telf2"></span>
                    <span class="m-r-10" id="v_emp_email2"></span>
                </p>
            </div>
            <!-- end invoice-footer -->
        </div>
        <!-- end invoice -->

        <div class="btn-toolbar sw-toolbar sw-toolbar-bottom justify-content-end">
            <div class="btn-group mr-2 sw-btn-group" role="group">
                <button id="btnanterior4" class="btn btn-primary sw-btn-prev" type="button">Anterior</button>
                <button id="btnenviar" class="btn btn-success sw-btn-next" type="button">Enviar</button>
            </div>
        </div>
    </div>
</div>