<div class="panel panel-inverse" id="panel2">
    <div class="panel-heading">
        <h4 class="panel-title">Paso 2 - Detalle de la Cotizacion</h4>
        <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
        </div>
    </div>
    <div class="panel-body">
        <fieldset>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="categoriaId">Categoria *</label>
                        <select id="categoriaId" name="categoriaId" class="form-control">

                        </select>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="productoId">Producto *</label>
                        <select id="productoId" name="productoId" class="form-control">

                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_precio">Precio *</label>
                        <input type="number" class="form-control" id="cotd_precio" name="cotd_precio" placeholder="0.00" required readonly>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_cant">Cant *</label>
                        <input type="number" class="form-control" id="cotd_cant" name="cotd_cant" placeholder="0" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_total">Total *</label>
                        <input type="number" class="form-control" id="cotd_total" name="cotd_total" placeholder="0.00" required readonly>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_total">&nbsp;</label>
                        <button type="button" id="btnagregardetalle" class="btn btn-primary btn-block">Agregar</button>
                    </div>
                </div>

                <div class="col-md-12">
                    <table id="detalle_data" class="table table-striped table-bordered table-td-valign-middle">
                        <thead>
                            <tr>
                                <th class="text-nowrap">Categoria</th>
                                <th class="text-nowrap">Producto</th>
                                <th class="text-nowrap">Precio</th>
                                <th class="text-nowrap">Cant</th>
                                <th class="text-nowrap">Profit</th>
                                <th class="text-nowrap">Total</th>
                                <th width="1%"></th>
                                <th width="1%"></th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>

                <div class="col-md-12">
                    <div class="invoice" style="padding: 0px !important;">
                        <div class="invoice-content">
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
                                    <small>TOTAL</small> <span class="f-w-600" id="cot_total">$0.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </fieldset>

        <div class="btn-toolbar sw-toolbar sw-toolbar-bottom justify-content-end">
            <div class="btn-group mr-2 sw-btn-group" role="group">
                <button id="btnanterior2" class="btn btn-primary sw-btn-prev" type="button">Anterior</button>
                <button id="btnsiguiente2" class="btn btn-primary sw-btn-next" type="button">Siguiente</button>
            </div>
        </div>

    </div>
</div>