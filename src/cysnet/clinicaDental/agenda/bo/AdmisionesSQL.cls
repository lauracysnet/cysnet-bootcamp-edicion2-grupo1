Class cysnet.clinicaDental.agenda.bo.AdmisionesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method admitirPaciente(pRequest As cysnet.clinicaDental.msg.admitirPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.admitirPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.admitirPacienteResponse).%New()
    set pResponse.exito = 1
        Try {
                set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
                set sql = "SELECT idCita from  ClinicaDental.Cita WHERE IdPaciente = ? AND IdCita NOT IN(SELECT IdCita from ClinicaDental.Admision)"
                set sc = ..Adapter.ExecuteQuery(.rs, sql,pRequest.idPaciente)
      
         
         if (rs.%Next(.sc)){


                set sql2 = "INSERT INTO ClinicaDental.Admision(IdCita, FechaAdmision, IndEnviada) VALUES (?, ?, ?)"
                set sc = ..Adapter.ExecuteUpdate(.numRows, sql2, pRequest.idCita, pRequest.fechaAdmision, pRequest.indEnviada)

              if ($$$ISOK(sc)) {
                    if (numRows = 0) {
                        set pResponse.exito = 0
                        set pResponse.error = "No se ha insertado ninguna fila"
                    } else {
                        set pResponse.mensaje = "Registro exitoso"
                    }
                }
            
         }
         Else {
                    set pResponse.exito = 0
                    Set pResponse.mensaje = "ya existe un registro para ese paciente y cita"
                }
        }
         
       
    Catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
            if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
                set sc = err.status
            } else {
                set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
            }
    }

    quit $$$OK
}

XData MessageMap
{
<MapItems>
        <MapItem MessageType="cysnet.clinicaDental.msg.admitirPacienteRequest">
             <Method>admitirPaciente</Method>
        </MapItem>
</MapItems>
}

}
