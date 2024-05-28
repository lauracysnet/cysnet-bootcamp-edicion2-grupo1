Class cysnet.clinicaDental.notificaciones.bo.NotificacionesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// MÃ©todo que crea una nueva notificacion de bienvenida
Method agregarNotificacionBienvenida(pRequest As cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaRequest, Output pResponse As cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0
    set pResponse = ##class(cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse).%New()
    set pResponse.exito = 1
    Try{
        set sqlInsertar = "INSERT INTO ClinicaDental.Notificacion (IdPaciente, Asunto, Mensaje, IndEnviada) VALUES (?, ?, ?, ?)"
        set sc = ..Adapter.ExecuteUpdate(.numRows, sqlInsertar, pRequest.idPaciente, pRequest.asunto, pRequest.mensaje ,pRequest.indEnviado)
        if ($$$ISOK(sc)) {
            if (numRows > 0) {
                set pResponse.mensaje = "Bienvenid@ "

            } else {
                set pResponse.exito = 0
                set pResponse.mensaje = "Ver trace"
            }
        }
       // Si ha ocurrido un error, crear el objeto Status:
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
