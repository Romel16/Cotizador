<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Producto</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="productoId" name="productoId">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="categoriaId">Categoria</label>
                                <select class="form-control" id="categoriaId" name="categoriaId"></select>
                            </div>
                            <div class="form-group">
                                <label for="productoNombre">Nombre</label>
                                <input type="text" class="form-control" id="productoNombre" name="productoNombre" placeholder="Ingrese Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="productoDescripcion">Descripción</label>
                                <input type="text" class="form-control" id="productoDescripcion" name="productoDescripcion" placeholder="Ingrese Descripción" required></input>
                            </div>
                            <div class="form-group">
                                <label for="productoPrecio">Precio</label>
                                <input type="number" class="form-control" id="productoPrecio" name="productoPrecio" step="0.01" placeholder="Ingrese Precio" required></input>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                        <button type="submit" name="action" value="add" class="btn btn-primary">Guardar</button>
                    </div>
                </form>    
            </div>
        </div>
     </div> 


