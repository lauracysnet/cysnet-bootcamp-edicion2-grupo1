Class cysnet.clinicaDental.notificaciones.bo.NotificacionesSQL Extends Ens.BusinessOperation
{

/// Método que crea una nueva notificacion de bienvenida
Method agregarNotificacionBienvenida(pRequest As cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaRequest, Output pResponse As cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    set pResponse = ##class(cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse).%New()
    set pResponse.exito = 1
    Try{
        &sql(INSERT INTO cysnet_clinicaDental_data.Notificaciones (idPaciente, asunto, mensaje, indEnviado) VALUES (:pRequest.idPaciente, :pRequest.asunto, :pRequest.mensaje ,:pRequest.indEnviado))
        if (SQLCODE = 0) {
        set pResponse.mensaje = "Bienvenid@!!!"
        } else {
        set pResponse.exito = 0
        set pResponse.mensaje = "Ver trace"
        }
    } Catch (err) {
       // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
	        set sc = err.status
        } else {
	        set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.mensaje = $System.Status.GetErrorText(sc)
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaRequest">
    <Method>agregarNotificacionBienvenida</Method>
    </MapItem>
</MapItems>
}

}
