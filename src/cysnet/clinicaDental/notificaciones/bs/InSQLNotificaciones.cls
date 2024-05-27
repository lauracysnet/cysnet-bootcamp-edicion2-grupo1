Class cysnet.clinicaDental.notificaciones.bs.InSQLNotificaciones Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.msg.inSQL.InSQLNotificacionesRequest
    #dim rsp As cysnet.clinicaDental.msg.inSQL.InSQLNotificacionesResponse
    set req = ##class(cysnet.clinicaDental.msg.inSQL.InSQLNotificacionesRequest).%New()
    set req.idNotificacion = pInput.Get("IdNotificacion")
    set req.idPaciente = pInput.Get("IdPaciente")
    set req.asunto = pInput.Get("Asunto")
    SET req.mensaje = pInput.Get("Mensaje")

    quit ..SendRequestSync("ProcesoNotificaciones",req,.rsp)
}

}
