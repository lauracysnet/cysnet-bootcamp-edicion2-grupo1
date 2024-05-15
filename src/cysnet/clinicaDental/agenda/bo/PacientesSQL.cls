Class cysnet.clinicaDental.agenda.bo.PacientesSQL Extends Ens.BusinessOperation
{

/// Método que crea un nueva paciente
Method crearPaciente(pRequest As cysnet.clinicaDental.msg.nuevoPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.nuevoPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set pResponse = ##class(cysnet.clinicaDental.msg.nuevoPacienteResponse).%New()
    set pResponse.exito = 1
    Try{
        set stm = ##class(%SQL.Statement).%New()
        set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE email = "_"'"_pRequest.email_"'")
        if ($$$ISOK(sc)) {
            set rs = stm.%Execute()
            if (rs.%Next(.sc)) {
                set pResponse.exito = 0
                set pResponse.mensajeError = "Ya esxiste paciente con el correo ingresado"
                return $$$OK
            }
        }
        &sql(INSERT INTO cysnet_clinicaDental_data.Pacientes (nombre, apellidos, email, permiteNotificaciones, baja) VALUES (:pRequest.nombre, :pRequest.apellidos, :pRequest.email ,:pRequest.permiteNotificaciones, :pRequest.baja))
        if (SQLCODE = 0) {
        // La instrucción ha ido bien
        } else {
        set pResponse.exito = 0
        set pResponse.error = $System.SQL.Functions.SQLCODE(SQLCODE)
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
        set pResponse.error = $System.Status.GetErrorText(sc)
    }
    quit $$$OK
}

/// Método que crea una nueva paciente
Method bajaPaciente(pRequest As cysnet.clinicaDental.msg.bajaPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.bajaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set pResponse = ##class(cysnet.clinicaDental.msg.bajaPacienteResponse).%New()
    set pResponse.exito = 1
    set pResponse.mensaje = "Se dió de baja al paciente con el correo: "_pRequest.email
    Try {
        set stm = ##class(%SQL.Statement).%New()
        set sc = stm.%Prepare("UPDATE cysnet_clinicaDental_data.Pacientes SET baja = 1 WHERE email = "_"'"_pRequest.email_"'")
        if ($$$ISOK(sc)) {
            set rs = stm.%Execute()
            if (rs.%Next(.sc)) {
                set pResponse.mensaje = "Se dió de baja al paciente con el correo: "_pRequest.email
            }
        } 
    }
    Catch ex {
             // Si ha ocurrido un error, crear el objeto Status:
        if (ex.%ClassName(1)="common.err.exception") && ($$$ISERR(ex.status)) {
	        set sc = ex.status
        } else {
	        set sc = $System.Status.Error(ex.Code,ex.Name,ex.Location,ex.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.mensajeError = $System.Status.GetErrorText(sc)
    }

    quit $$$OK
}

Method modificarPaciente(pRequest As cysnet.clinicaDental.msg.ModificarPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.ModificarPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set pResponse = ##class(cysnet.clinicaDental.msg.ModificarPacienteResponse).%New()
    set pResponse.exito = 1
    set pResponse.mensaje = "Actualizado correctamente"
    Try{
        if (pRequest.conservarCorreo) {
            &sql(UPDATE cysnet_clinicaDental_data.Pacientes SET nombre = :pRequest.nombre, apellidos = :pRequest.apellidos, email = :pRequest.emailAcutal, permiteNotificaciones = :pRequest.permiteNotificaciones WHERE email = :pRequest.emailAcutal)
            if (SQLCODE = 0) {
                // La instrucción ha ido bien
            } else {
                set pResponse.exito = 0
                set pResponse.mensaje = $System.SQL.Functions.SQLCODE(SQLCODE)
            }
        } else {
            set stm = ##class(%SQL.Statement).%New()
            set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE email = "_"'"_pRequest.NuevoEmail_"'")
            if ($$$ISOK(sc)) {
                set rs = stm.%Execute()
                if (rs.%Next(.sc)) {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "Ya esxiste paciente con el correo ingresado"
                    return $$$OK
                } 
            }
            &sql(UPDATE cysnet_clinicaDental_data.Pacientes SET nombre = :pRequest.nombre, apellidos = :pRequest.apellidos, email = :pRequest.NuevoEmail, permiteNotificaciones = :pRequest.permiteNotificaciones WHERE email = :pRequest.emailAcutal)
            if (SQLCODE = 0) {
                // La instrucción ha ido bien
            } else {
                set pResponse.exito = 0
                set pResponse.mensaje = $System.SQL.Functions.SQLCODE(SQLCODE)
            }
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
        set pResponse.mensaje = "paila"
    }
    quit sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.msg.nuevoPacienteRequest">
    <Method>crearPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.bajaPacienteRequest">
    <Method>bajaPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.ModificarPacienteRequest">
    <Method>modificarPaciente</Method>
    </MapItem>
</MapItems>
}

}
