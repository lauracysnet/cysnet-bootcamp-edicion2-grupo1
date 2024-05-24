Class cysnet.clinicaDental.agenda.bo.CitasSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method altaCita(pRequest As cysnet.clinicaDental.msg.CrearAltaCitaRequest, Output pResponse As cysnet.clinicaDental.msg.CrearAltaCitaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.CrearAltaCitaResponse).%New()
    set pResponse.exito = 1
        Try {
        set sql = "INSERT INTO ClinicaDental.Cita(IdPaciente, DescCita, FechaCita, CodEstado) VALUES(?, ?, ?, ?)"
        set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idPaciente, pRequest.descCita, pRequest.fechaCita, pRequest.codEstado)
        if ($$$ISOK(sc)) {
            if (numRows = 0) {
                set pResponse.exito = 0
                set pResponse.error = "No se ha insertado ninguna fila"
            } else {
                set sc = ..Adapter.ExecuteQuery(.rs, "SELECT LAST_INSERT_ID() AS LastID")
                if ($$$ISOK(sc)) {
                    if (rs.Next(.sc)) {
                    set pResponse.idCita = rs.Get("LastID")
                    }
                } else {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "No se encuentra el identificador"
                }
            }
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

Method cancelarCita(pRequest As cysnet.clinicaDental.msg.cancelarCitaRequest, Output pResponse As cysnet.clinicaDental.msg.cancelarCitaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.cancelarCitaResponse).%New()
    set pResponse.exito = 1
        Try {
            set sql = "UPDATE ClinicaDental.Cita SET codEstado = ? WHERE idCita = ?"
            set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.codEstado, pRequest.idCita)
            if ($$$ISOK(sc)) {
                if (numRows = 0) {
                    set pResponse.exito = 0
                    set pResponse.error = "No se ha insertado ninguna fila"
                }
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

Method modificarCita(pRequest As cysnet.clinicaDental.msg.modificarCitaRequest, Output pResponse As cysnet.clinicaDental.msg.modificarCitaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim numRows As %Integer = 0

    set pResponse = ##class(cysnet.clinicaDental.msg.modificarCitaResponse).%New()
    set pResponse.exito = 1
        Try {

            set sql = "SELECT IdCita, IdPaciente, DescCita, FechaCita FROM ClinicaDental.Cita WHERE IdCita = ? "
            set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.idCita)
            if ($$$ISOK(sc)) {
                if ($$$ISOK(sc)) {
                    if (rs.Next(.sc)) {
                    set pResponse.idCita = rs.Get("IdCita")
                    set pResponse.idPaciente = rs.Get("IdPaciente")
                    set pResponse.descCita = rs.Get("DescCita")
                    set pResponse.fechaCita = rs.Get("FechaCita")

                    set sql = "UPDATE ClinicaDental.Cita SET FechaCita = ? WHERE idCita = ?"
                    set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.fechaCita, pRequest.idCita)
                    if ($$$ISOK(sc)) {
                    if (numRows = 0) {
                        set pResponse.exito = 0
                        set pResponse.error = "No se ha insertado ninguna fila"
                    } else {
                        set pResponse.mensaje = "Registros exitoso"
                    }
            }
                    }
                } else {
                    set pResponse.exito = 0
                    set pResponse.mensaje = "No se encuentra el identificador de la cita"
                }
            }


            set sql = "UPDATE ClinicaDental.Cita SET fechaCita = ? WHERE idCita = ?"
            set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.fechaCita, pRequest.idCita)
            if ($$$ISOK(sc)) {
                if (numRows = 0) {
                    set pResponse.exito = 0
                    set pResponse.error = "No se ha insertado ninguna fila"
                }
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

Method listarCitas(pRequest As cysnet.clinicaDental.msg.listarCitasRequest, Output pResponse As cysnet.clinicaDental.msg.listarCitasResponse) As %Status
{

        Set pResponse = ##class(cysnet.clinicaDental.msg.listarCitasResponse).%New()
        set pResponse.citas = ##class(%ListOfObjects).%New()

        try {
            set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
            if (pRequest.mostrarBajas = 1) {
                
                set sql = "SELECT idCita, idPaciente, descCita, fechaCita, codEstado FROM ClinicaDental.Cita "
                set sc = ..Adapter.ExecuteQuery(.rs, sql)
            } else {
                    set sql = "SELECT idCita, idPaciente, descCita, fechaCita, codEstado FROM ClinicaDental.Cita WHERE codEstado = 1 "
                    set sc = ..Adapter.ExecuteQuery(.rs, sql)
    
            }
          
            
            if ($$$ISOK(sc)) {
                while (rs.%Next(.sc)) {
                    quit:$$$ISERR(sc)
                    set cita = ##class(cysnet.clinicaDental.msg.struct.Cita).%New()
                    set cita.idCita = rs.Get("idCita")
                    set cita.fechaCita = rs.Get("fechaCita")
                    set cita.idPaciente = rs.Get("idPaciente")
                    set cita.descCita = rs.Get("descCita")
                    set cita.codEstado = rs.Get("codEstado")
                    do pResponse.citas.Insert(cita)
                    kill cita
                }
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

Method ConsultarCitaPorId(pRequest As cysnet.clinicaDental.msg.ConsulatCitaPorIdRequest, Output pResponse As cysnet.clinicaDental.msg.ConsulatCitaPorIdResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    set pResponse = ##class(cysnet.clinicaDental.msg.ConsulatCitaPorIdResponse).%New()
    Try {
        set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
        set sqlObtener = "SELECT * FROM ClinicaDental.Cita WHERE IdCita = ?"
        set sc = ..Adapter.ExecuteQuery(.rs, sqlObtener, pRequest.idCita)
        if ($$$ISOK(sc)) {
            if (rs.Next(.sc)) {
                quit:$$$ISERR(sc)
                set pResponse.idPaciente = rs.Get("IdPaciente")
                set pResponse.DescCita = rs.Get("DescCita")
                set pResponse.FechaCita = rs.Get("FechaCita")
                set pResponse.codEstado = rs.Get("CodEstado")
                return $$$OK
            } else {
                set pResponse.idCita = 0
            }
        }
    }
    Catch (err) {
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.idCita = 0
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
        <MapItem MessageType="cysnet.clinicaDental.msg.CrearAltaCitaRequest">
             <Method>altaCita</Method>
        </MapItem>
        <MapItem MessageType="cysnet.clinicaDental.msg.cancelarCitaRequest">
             <Method>cancelarCita</Method>
        </MapItem>
        <MapItem MessageType="cysnet.clinicaDental.msg.modificarCitaRequest">
             <Method>modificarCita</Method>
        </MapItem>
        <MapItem MessageType="cysnet.clinicaDental.msg.listarCitasRequest">
             <Method>listarCitas</Method>
        </MapItem>
        <MapItem MessageType="cysnet.clinicaDental.msg.ConsulatCitaPorIdRequest">
             <Method>ConsultarCitaPorId</Method>
        </MapItem>
</MapItems>
}

}
