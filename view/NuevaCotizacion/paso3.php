<div class="panel panel-inverse" id="panel3">
    <div class="panel-heading">
        <h4 class="panel-title">Paso 3 - Costos Extra</h4>
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
                        <label for="categoriaId_a">Categoria *</label>
                        <select id="categoriaId_a" name="categoriaId_a" class="form-control">

                        </select>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="productoId_a">Producto *</label>
                        <select id="productoId_a" name="productoId_a" class="form-control">

                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_precio_a">Precio *</label>
                        <input type="number" class="form-control" id="cotd_precio_a" name="cotd_precio_a" placeholder="0.00" required readonly>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_cant_a">Cant *</label>
                        <input type="number" class="form-control" id="cotd_cant_a" name="cotd_cant_a" min="0" step="1"placeholder="0" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_total_a">Total *</label>
                        <input type="number" class="form-control" id="cotd_total_a" name="cotd_total_a" placeholder="0.00" required readonly>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cotd_total">&nbsp;</label>
                        <button type="button" id="btnagregardetalle_a" class="btn btn-primary btn-block">Agregar</button>
                    </div>
                </div>

                <div class="col-md-12">
                    <table id="detalle_data_a" class="table table-striped table-bordered table-td-valign-middle">
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
            </div>
        </fieldset>

        <div class="btn-toolbar sw-toolbar sw-toolbar-bottom justify-content-end">
            <div class="btn-group mr-2 sw-btn-group" role="group">
                <button id="btnanterior3" class="btn btn-primary sw-btn-prev" type="button">Anterior</button>
                <button id="btnsiguiente3" class="btn btn-primary sw-btn-next" type="button">Siguiente</button>
            </div>
        </div>

    </div>
</div>