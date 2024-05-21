Class cysnet.clinicaDental.agenda.bo.AltasSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method altaPaciente(pRequest As cysnet.clinicaDental.msg.altaPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.altaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.altaPacienteResponse).%New()
    set pResponse.exito = 1
        Try {
                set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
                set sql = "SELECT a.IdCita FROM  ClinicaDental.Admision a JOIN ClinicaDental.Cita c  ON a.IdCita = c.IdCita WHERE c.IdPaciente = ? AND c.IdCita = ? "
                set sc = ..Adapter.ExecuteQuery(.rs, sql,pRequest.idPaciente, pRequest.idCita)

         if (rs.%Next(.sc)){
                set sql2 = "INSERT INTO ClinicaDental.Alta (IdCita, FechaAlta, IndEnviada) VALUES (?, ?, ?)"
                set sc = ..Adapter.ExecuteUpdate(.numRows, sql2, pRequest.idCita, pRequest.fechaAltas, pRequest.indEnviada)

              if ($$$ISOK(sc)) {
                    if (numRows = 0) {
                        set pResponse.exito = 0
                        set pResponse.error = "No se ha insertado ninguna fila"
                    } else {
                        set pResponse.mensaje = "Registro exitoso"
                    }
                }
            
          } Else {
                    Set pResponse.mensaje = "No se ha admitido el paciente en la cita"
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
        <MapItem MessageType="cysnet.clinicaDental.msg.altaPacienteRequest">
             <Method>altaPaciente</Method>
        </MapItem>
</MapItems>
}

}
