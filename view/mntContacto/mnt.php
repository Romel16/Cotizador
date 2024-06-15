<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Contacto</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="contactoId" name="contactoId">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="clienteId">Cliente</label>
                                <select class="form-control" id="clienteId" name="clienteId"> </select>
                            </div>

                            <div class="form-group">
                                <label for="cargoId">Cargo</label>
                                <select class="form-control" id="cargoId" name="cargoId" > </select>
                            </div>

                            <div class="form-group">
                                <label for="contactoNombre">Nombre</label>
                                <input class="form-control" id="contactoNombre" name="contactoNombre" placeholder="Ingrese Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="contactoEmail">Email</label>
                                <input type="text" class="form-control" id="contactoEmail" name="contactoEmail" placeholder="Ingrese Email" required></input>
                            </div>
                            <div class="form-group">
                                <label for="contactoTelefono">Telefono</label>
                                <input type="text" class="form-control" id="contactoTelefono" name="contactoTelefono" placeholder="Ingrese Telefono" required></input>
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


