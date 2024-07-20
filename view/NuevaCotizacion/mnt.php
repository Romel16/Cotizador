<div class="modal modal-message fade" id="modald">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar Profit</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form id="mnt_form" method="POST">
                <input type="hidden" id="cotd_id" name="cotd_id">

                <div class="modal-body">
                    <fieldset>
                        <div class="form-group">
                            <label for="categoriaNombre">Categoria</label>
                            <input type="text" class="form-control" id="categoriaNombre" name="categoriaNombre" readonly>
                        </div>

                        <div class="form-group">
                            <label for="productoNombre">Producto</label>
                            <input type="text" class="form-control" id="productoNombre" name="productoNombre" readonly>
                        </div>

                        <div class="form-group">
                            <label for="cotd_precio_md">Precio</label>
                            <input type="number" class="form-control" id="cotd_precio_md" name="cotd_precio_md" readonly>
                        </div>

                        <div class="form-group">
                            <label for="cotd_cant_md">Cant</label>
                            <input type="text" class="form-control" id="cotd_cant_md" name="cotd_cant_md">
                        </div>

                        <div class="form-group">
                            <label for="cotd_profit_md">Profit</label>
                            <input type="text" class="form-control" id="cotd_profit_md" name="cotd_profit_md">
                        </div>

                        <div class="form-group">
                            <label for="cotd_total_md">Total</label>
                            <input type="text" class="form-control" id="cotd_total_md" name="cotd_total_md" readonly>
                        </div>


                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                    <button type="button" id="btnagregarmd" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>