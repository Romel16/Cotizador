<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Categoria</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="categoriaId" name="categoriaId">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="categoriaNombre">Nombre</label>
                                <input type="text" class="form-control" id="categoriaNombre" name="categoriaNombre" placeholder="Ingrese Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="categoriaDescripcion">Descripción</label>
                                <textarea type="text" class="form-control" id="categoriaDescripcion" name="categoriaDescripcion" placeholder="Ingrese Descripción" rows="3" required></textarea>
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


