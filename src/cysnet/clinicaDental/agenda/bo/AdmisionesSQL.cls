Class cysnet.clinicaDental.agenda.bo.AdmisionesSQL Extends Ens.BusinessOperation
{

Method admitirPaciente(pRequest As cysnet.clinicaDental.msg.admitirPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.admitirPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    set pResponse = ##class(cysnet.clinicaDental.msg.admitirPacienteResponse).%New()
    set pResponse.exito = 1
        Try {

         Set stm = ##class(%SQL.Statement).%New()
         set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Citas WHERE idPaciente = "_ pRequest.idPaciente _ " AND ID NOT IN(SELECT idCita from cysnet_clinicaDental_data.Admisiones)")
        if ($$$ISOK(sc)) {
         Set rs = stm.%Execute()
         if (rs.%Next(.sc)){
            quit:$$$ISERR(sc)
            &sql(INSERT INTO cysnet_clinicaDental_data.Admisiones (idCita, fechaAdmision,indEnviada) VALUES (:pRequest.idCita, :pRequest.fechaAdmision, :pRequest.indEnviada))
         } Else {
                    Set pResponse.mensaje = "ya existe un registro para ese paciente y cita"
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
        <MapItem MessageType="cysnet.clinicaDental.msg.admitirPacienteRequest">
             <Method>admitirPaciente</Method>
        </MapItem>
</MapItems>
}

}
