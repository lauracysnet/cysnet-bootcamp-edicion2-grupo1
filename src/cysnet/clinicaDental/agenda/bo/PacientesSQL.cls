Class cysnet.clinicaDental.agenda.bo.PacientesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que crea un nueva paciente
Method crearPaciente(pRequest As cysnet.clinicaDental.msg.NuevoPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.NuevoPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    #dim numRows As %Integer = 0
    set numRows = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.NuevoPacienteResponse).%New()
    set pResponse.exito = 1
    Try{
        set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
        set sqlObtener = "SELECT * FROM ClinicaDental.Paciente WHERE Email = ?"
        set sc = ..Adapter.ExecuteQuery(.rs, sqlObtener, pRequest.email)
        if ($$$ISOK(sc)) {
            if (rs.Next(.sc)) {
                quit:$$$ISERR(sc)
                set pResponse.exito = 0
                set pResponse.mensaje = "Ya existe paciente con el correo ingresado"
                return $$$OK
            }
        }
        set sqlInsertar = "INSERT INTO ClinicaDental.Paciente (Nombre, Apellidos, Email, PermiteNotificaciones, Baja) VALUES (?, ?, ?, ?, ?)"
        set sc = ..Adapter.ExecuteUpdate(.numRows, sqlInsertar, pRequest.nombre, pRequest.apellidos, pRequest.email, pRequest.permiteNotificaciones, pRequest.baja)
        if ($$$ISOK(sc)) {
            if (numRows > 0) {
                set pResponse.exito = 1
                set pResponse.mensaje = "Bienvenid@ "_pRequest.nombre_" "_pRequest.apellidos
                set sc = ..Adapter.ExecuteQuery(.rs, "SELECT LAST_INSERT_ID() AS LastID")
                        if ($$$ISOK(sc)) {
                if (rs.Next(.sc)) {
                    set pResponse.id = rs.Get("LastID")
                } else {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "No se encuentra el identificador"
                }
            }
            } else {
                set pResponse.exito = 0
                set pResponse.mensaje = "No se insertó ningula fila"
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
        set pResponse.mensaje = $System.Status.GetErrorText(sc)
    }
    quit $$$OK
}

/// Método que crea una nueva paciente
Method bajaPaciente(pRequest As cysnet.clinicaDental.msg.BajaPacienteRequest, Output pResponse As cysnet.clinicaDental.msg.BajaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    #dim numRows As %Integer = 0
    set pResponse = ##class(cysnet.clinicaDental.msg.BajaPacienteResponse).%New()
    set pResponse.exito = 1
    Try {
        set sqlTraerPaciente = "SELECT * FROM ClinicaDental.Paciente WHERE Email = ?"
        set sc = ..Adapter.ExecuteQuery(.rs, sqlTraerPaciente, pRequest.email)
        if ($$$ISOK(sc)) {
            if (rs.%Next(.sc)) {
                quit:$$$ISERR(sc)
                set sqlBajaPaciente = "UPDATE ClinicaDental.Paciente SET Baja = 1 WHERE Email = ?"
                set sc = ..Adapter.ExecuteUpdate(.numRows, sqlBajaPaciente, pRequest.email)
                if ($$$ISOK(sc)) {
                    quit:$$$ISERR(sc)
                    if (numRows > 0) {
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
    #dim rs As EnsLib.SQL.GatewayResultSet
    #dim numRows As %Integer = 0
    set numRows = 0
    set pResponse = ##class(cysnet.clinicaDental.msg.ModificarPacienteResponse).%New()
    set pResponse.exito = 1
    Try{
        if (pRequest.conservarCorreo) {
            set sqlActualizar = "UPDATE ClinicaDental.Paciente SET Nombre = ?, Apellidos = ?, Email = ?, PermiteNotificaciones = ? WHERE Email = ?"
            set sc = ..Adapter.ExecuteUpdate(.numRows, sqlActualizar, pRequest.nombre, pRequest.apellidos, pRequest.emailAcutal, pRequest.permiteNotificaciones, pRequest.emailAcutal)
            if ($$$ISOK(sc)) {
                if (numRows > 0) {
                } else {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "No se actualizó ningun paciente"
                }
            }
        } else {
            set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
            set sqlObtener = "SELECT * FROM ClinicaDental.Paciente WHERE Email = ?"
            set sc = ..Adapter.ExecuteQuery(.rs, sqlObtener, pRequest.nuevoEmail)
            if ($$$ISOK(sc)) {
                if (rs.Next(.sc)) {
                    quit:$$$ISERR(sc)
                    set pResponse.exito = 0
                    set pResponse.mensaje = "Ya existe paciente con el correo ingresado"
                    return $$$OK
                }
            }
            set sqlActualizar = "UPDATE ClinicaDental.Paciente SET Nombre = ?, Apellidos = ?, Email = ?, PermiteNotificaciones = ? WHERE Email = ?"
            set sc = ..Adapter.ExecuteUpdate(.numRows, sqlActualizar, pRequest.nombre, pRequest.apellidos, pRequest.nuevoEmail, pRequest.permiteNotificaciones, pRequest.emailAcutal)
            if ($$$ISOK(sc)) {
                if (numRows > 0) {
                    set pResponse.mensaje = "Actualizado correctamente"
                } else {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "No se actualizó ningun paciente"
                }
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
    #dim rs As EnsLib.SQL.GatewayResultSet
    set pResponse = ##class(cysnet.clinicaDental.msg.ListarPacientesResponse).%New()
    set pResponse.pacientes = ##class(%ListOfObjects).%New()

    if (pRequest.mostrarBajas){
        set sqlTraerPacientes = "SELECT * FROM ClinicaDental.Paciente"
    } else {
        set sqlTraerPacientes = "SELECT * FROM ClinicaDental.Paciente WHERE Baja = 0"
    }
    set sc = ..Adapter.ExecuteQuery(.rs, sqlTraerPacientes)
    if ($$$ISOK(sc)) {
        while (rs.%Next()) {
            set paciente = ##class(cysnet.clinicaDental.msg.struct.Pacientes).%New()
            set paciente.nombre = rs.Get("Nombre")
            set paciente.apellidos = rs.Get("Apellidos")
            set paciente.email = rs.Get("Email")
            set paciente.permiteNotificaciones = rs.Get("PermiteNotificaciones")
            do pResponse.pacientes.Insert(paciente)
            kill paciente
        }
    } 
    quit $$$OK
}

Method buscarPacientePorID(pRequest As cysnet.clinicaDental.msg.BuscarPacientePorIDRequest, Output pResponse As cysnet.clinicaDental.msg.BuscarPacientePorIDResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    set pResponse = ##class(cysnet.clinicaDental.msg.BuscarPacientePorIDResponse).%New()
    Try{
        set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
        set sqlObtener = "SELECT * FROM ClinicaDental.Paciente WHERE IdPaciente = ?"
        set sc = ..Adapter.ExecuteQuery(.rs, sqlObtener, pRequest.id)
        if ($$$ISOK(sc)) {
            if (rs.Next(.sc)) {
                quit:$$$ISERR(sc)
                set pResponse.mensaje = "Exitoso"
                set pResponse.id = rs.Get("IdPaciente")
                set pResponse.nombre = rs.Get("Nombre")
                set pResponse.apellidos = rs.Get("Apellidos")
                set pResponse.email = rs.Get("Email")
                return $$$OK
            } else {
                set pResponse.mensaje = "No se encontró ningun paciente con el ID digitado"
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
        set pResponse.mensaje = $System.Status.GetErrorText(sc)
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.msg.NuevoPacienteRequest">
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
