Class cysnet.clinicaDental.agenda.bo.AltasSQL Extends Ens.BusinessOperation
{

Method altaPaciente(pRequest As cysnet.clinicaDental.msg.altaPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.altaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    set pResponse = ##class(cysnet.clinicaDental.msg.altaPacienteResponse).%New()
    set pResponse.exito = 1
        Try {

         Set stm = ##class(%SQL.Statement).%New()
         set sc = stm.%Prepare("SELECT a.idCita FROM cysnet_clinicaDental_data.Admisiones a JOIN cysnet_clinicaDental_data.Citas c  ON a.idCita = c.ID WHERE c.idPaciente = "_pRequest.idPaciente _" AND c.ID = "_pRequest.idCita)
        if ($$$ISOK(sc)) {
         Set rs = stm.%Execute()
         if (rs.%Next(.sc)){
            quit:$$$ISERR(sc)
            &sql(INSERT INTO cysnet_clinicaDental_data.Altas (idCita, fechaAltas, indEnviada) VALUES (:pRequest.idCita, :pRequest.fechaAltas, :pRequest.indEnviada))
         } Else {
                    Set pResponse.mensaje = "No existen admisiones para ese identificador ("_pRequest.idPersona_")"
                }
        }
         
        if (SQLCODE = 0) {
        // La instrucción ha ido bien
        } else {
            set pResponse.exito = 0
            set pResponse.error = $System.SQL.Functions.SQLCODE(SQLCODE)
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
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.mensaje = $System.Status.GetErrorText(sc)
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
