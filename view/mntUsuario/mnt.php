<div class="modal modal-message fade" id="mdlmnt">
   
    <div class="" id="modal-dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mdltitulo">Usuario</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <form id="mnt_form" method="POST">
                <input type="hidden" id="usuarioId" name="usuarioId">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="usuarioNombre">Nombre</label>
                                <input type="text" class="form-control" id="usuarioNombre" name="usuarioNombre" placeholder="Ingrese Nombre" required>
                            </div>

                            <div class="form-group">
                                <label for="usuarioCorreo">Email</label>
                                <input type="text" class="form-control" id="usuarioCorreo" name="usuarioCorreo" placeholder="Ingrese Email" required></input>
                            </div>
                            
                            <div class="form-group">
                                <label for="usuarioPassword">Password</label>
                                <input type="text" class="form-control" id="usuarioPassword" name="usuarioPassword" placeholder="Ingrese Password" required></input>
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


