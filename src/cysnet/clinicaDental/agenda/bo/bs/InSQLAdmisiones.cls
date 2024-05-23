Class cysnet.clinicaDental.agenda.bo.bs.InSQLAdmisiones Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.msg.inSQL.LeerAdmitirPacienteRequest
    #dim rsp As cysnet.clinicaDental.msg.inSQL.LeerAdmitirPacienteResponse
    
    set req = ##class(cysnet.clinicaDental.msg.inSQL.LeerAdmitirPacienteRequest).%New()
    set req.idAdmision = pInput.Get("IdAdmision")
    set req.idCita = pInput.Get("IdCita")
    set req.fechaAdmision = pInput.Get("FechaAdmision")

    quit ..SendRequestSync("ProcesoCitas",req,.rsp)
}

}
