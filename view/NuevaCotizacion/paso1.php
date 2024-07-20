<div class="panel panel-inverse" id="panel1">
    <div class="panel-heading">
        <h4 class="panel-title">Paso 1 - Datos Generales</h4>
        <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
        </div>
    </div>
    <div class="panel-body">
        <fieldset>
            <div class="form-group">
                <label for="clienteId">Cliente *</label>
                <select id="clienteId" name="clienteId" class="form-control">

                </select>
            </div>

            <div class="form-group">
                <label for="contactoId">Contacto *</label>
                <select id="contactoId" name="contactoId" class="form-control">

                </select>
            </div>

            <div class="form-group">
                <label for="clienteRuc">RUC *</label>
                <input type="text" class="form-control" id="clienteRuc" name="clienteRuc" placeholder="Ingrese RUC" required>
            </div>

            <div class="form-group">
                <label for="contactoTelefono">Telefono Contacto</label>
                <input type="text" class="form-control" id="contactoTelefono" name="contactoTelefono" placeholder="Ingrese Telefono" required>
            </div>

            <div class="form-group">
                <label for="contactoEmail">Email Contacto *</label>
                <input type="text" class="form-control" id="contactoEmail" name="contactoEmail" placeholder="Ingrese Email" required>
            </div>

            <div class="form-group">
                <label for="cotizacionDescripcion">Descripción</label>
                <textarea type="text" class="form-control" id="cotizacionDescripcion" name="cotizacionDescripcion" placeholder="Ingrese Descripción" rows="3" required></textarea>
            </div>

        </fieldset>

        <div class="btn-toolbar sw-toolbar sw-toolbar-bottom justify-content-end">
            <div class="btn-group mr-2 sw-btn-group" role="group">
                <button id="btncancelar" class="btn btn-danger sw-btn-prev" type="button">Cancelar</button>
                <button id="btnsiguiente1" class="btn btn-primary sw-btn-next" type="button">Siguiente</button>
            </div>
        </div>
    </div>
</div>