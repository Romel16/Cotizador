<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Empresa</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="empresaId" name="empresaId">
                    <div class="modal-body">
                        <fieldset>
                        <div class="form-group">
                                <label for="empresaNombre">Nombre</label>
                                <input type="text" class="form-control" id="empresaNombre" name="empresaNombre" placeholder="Ingrese Nombre" rows="3" required></input>
                            </div>
                            <div class="form-group">
                                <label for="empresaPorcentaje">Porcentaje</label>
                                <input type="number" class="form-control" id="empresaPorcentaje" name="empresaPorcentaje" placeholder="Ingrese Porcentaje" rows="3" required>
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


