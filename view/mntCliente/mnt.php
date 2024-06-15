<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Cliente</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="clienteId" name="clienteId">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="clienteNombre">Nombre</label>
                                <input type="text" class="form-control" id="clienteNombre" name="clienteNombre" placeholder="Ingrese Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="clienteRuc">Ruc</label>
                                <input type="text" class="form-control" id="clienteRuc" name="clienteRuc" placeholder="Ingrese Ruc" required></input>
                            </div>
                            <div class="form-group">
                                <label for="clienteTelefono">Telefono</label>
                                <input type="text" class="form-control" id="clienteTelefono" name="clienteTelefono" placeholder="Ingrese Telefono" required></input>
                            </div>
                            <div class="form-group">
                                <label for="clienteEmail">Email</label>
                                <inout type="text" class="form-control" id="clienteEmail" name="clienteEmail" placeholder="Ingrese Email" required></input>
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
