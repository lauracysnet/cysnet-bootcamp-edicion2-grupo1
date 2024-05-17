Class cysnet.clinicaDental.agenda.bo.PacientesSQL Extends Ens.BusinessOperation
{

/// Método que crea un nueva paciente
Method crearPaciente(pRequest As cysnet.clinicaDental.msg.NuevoPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.NuevoPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set pResponse = ##class(cysnet.clinicaDental.msg.NuevoPacienteResponse).%New()
    set pResponse.exito = 1
    Try{
        set stm = ##class(%SQL.Statement).%New()
        set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE email = "_"'"_pRequest.email_"'")
        /// &sql(SELECT * INTO :pResponse() FROM  cysnet_clinicaDental_data.Pacient WHERE email = :pRequest.email)
        if ($$$ISOK(sc)) {
            set rs = stm.%Execute()
            if (rs.%Next(.sc)) {
                set pResponse.exito = 0
                set pResponse.mensajeError = "Ya existe paciente con el correo ingresado"
                return $$$OK
            }
        }
        &sql(INSERT INTO cysnet_clinicaDental_data.Pacientes (nombre, apellidos, email, permiteNotificaciones, baja) VALUES (:pRequest.nombre, :pRequest.apellidos, :pRequest.email ,:pRequest.permiteNotificaciones, :pRequest.baja))
        if (SQLCODE = 0) {
        set pResponse.mensajeError = "Bienvenid@ "_pRequest.nombre_" "_pRequest.apellidos
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
Method bajaPaciente(pRequest As cysnet.clinicaDental.msg.BajaPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.BajaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set pResponse = ##class(cysnet.clinicaDental.msg.BajaPacienteResponse).%New()
    set pResponse.exito = 1
    set pResponse.mensaje = "Se dió de baja al paciente con el correo: "_pRequest.email
    Try {
        set stm = ##class(%SQL.Statement).%New()
        set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE email = "_"'"_pRequest.email_"'")
        /// &sql(SELECT * INTO :pResponse() FROM  cysnet_clinicaDental_data.Pacient WHERE email = :pRequest.email)
        if ($$$ISOK(sc)) {
            set rs = stm.%Execute()
            if (rs.%Next(.sc)) {
                set sc = stm.%Prepare("UPDATE cysnet_clinicaDental_data.Pacientes SET baja = 1 WHERE email = "_"'"_pRequest.email_"'")
                if ($$$ISOK(sc)) {
                    set rs = stm.%Execute()
                    if (rs.%Next(.sc)) {
                        set pResponse.mensaje = "Se dió de baja al paciente con el correo: "_pRequest.email
                    }
                } 
            } else {
                set pResponse.exito = 0
                set pResponse.mensaje = "No existe ningun paciente con el Email digitado"
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

/// Metodo para modiicar un paciente, validando si conserva el correo o no, en caso de que no valida que el nuevo correo ya no se encuentre registrado
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
            set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE email = "_"'"_pRequest.nuevoEmail_"'")
            if ($$$ISOK(sc)) {
                set rs = stm.%Execute()
                if (rs.%Next(.sc)) {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "Ya existe paciente con el correo ingresado"
                    return $$$OK
                } 
            }
            &sql(UPDATE cysnet_clinicaDental_data.Pacientes SET nombre = :pRequest.nombre, apellidos = :pRequest.apellidos, email = :pRequest.nuevoEmail, permiteNotificaciones = :pRequest.permiteNotificaciones WHERE email = :pRequest.emailAcutal)
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
        set pResponse.mensaje = "Error, mirar trace"
    }
    quit sc
}

Method listarPacientes(pRequest As cysnet.clinicaDental.msg.ListarPacientesRequest, Output pResponse As cysnet.clinicaDental.msg.ListarPacientesResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set stm = ##class(%SQL.Statement).%New()
    set pResponse = ##class(cysnet.clinicaDental.msg.ListarPacientesResponse).%New()
    set pResponse.pacientes = ##class(%ListOfObjects).%New()
    if (pRequest.mostrarBajas){
        set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes")
    } else {
        set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE baja = 0")
    }
    if ($$$ISOK(sc)) {
        set rs = stm.%Execute()
        while (rs.%Next()) {
            set paciente = ##class(cysnet.clinicaDental.msg.struct.Pacientes).%New()
            set paciente.nombre = rs.nombre
            set paciente.apellidos = rs.apellidos
            set paciente.email = rs.email
            set paciente.permiteNotificaciones = rs.permiteNotificaciones
            do pResponse.pacientes.Insert(paciente)
            kill paciente
        }
    } 
    quit $$$OK
}

Method buscarPacientePorID(pRequest As cysnet.clinicaDental.msg.BuscarPacientePorIDRequest, Output pResponse As cysnet.clinicaDental.msg.BuscarPacientePorIDResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult
    set stm = ##class(%SQL.Statement).%New()
    set pResponse = ##class(cysnet.clinicaDental.msg.BuscarPacientePorIDResponse).%New()
    set sc = stm.%Prepare("SELECT * FROM cysnet_clinicaDental_data.Pacientes WHERE ID = "_pRequest.id)
    set rs = stm.%Execute()
    if (rs.%Next(.sc)) {
        set pResponse.id = rs.ID
        set pResponse.nombre = rs.nombre
        set pResponse.apellidos = rs.apellidos
        set pResponse.email = rs.email
        set pResponse.mensaje = "Exitoso"
    } else {
        set pResponse.mensaje = "No se encontró ningun paciente con el ID digitado"
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.msg.nuevoPacienteRequest">
    <Method>crearPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.BajaPacienteRequest">
    <Method>bajaPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.ModificarPacienteRequest">
    <Method>modificarPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.ListarPacientesRequest">
    <Method>listarPacientes</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.msg.BuscarPacientePorIDRequest">
    <Method>buscarPacientePorID</Method>
    </MapItem>
</MapItems>
}

}
