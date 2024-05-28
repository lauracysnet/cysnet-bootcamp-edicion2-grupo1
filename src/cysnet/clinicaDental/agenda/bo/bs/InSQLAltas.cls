Class cysnet.clinicaDental.agenda.bo.bs.InSQLAltas Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.msg.inSQL.LeerAltaPacienteRequest
    #dim rsp As cysnet.clinicaDental.msg.inSQL.LeerAltaPacienteResponse
    
    set req = ##class(cysnet.clinicaDental.msg.inSQL.LeerAltaPacienteRequest).%New()
    set req.idAlta = pInput.Get("IdAlta")
    set req.idCita = pInput.Get("IdCita")
    set req.fechaAlta = pInput.Get("FechaAlta")

    quit ..SendRequestSync("ProcesoCitas",req,.rsp)
}

}
