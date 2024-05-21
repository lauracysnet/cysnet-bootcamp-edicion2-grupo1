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
        #;  &sql(INSERT INTO cysnet_clinicaDental_data.Citas (idPaciente, descCita,fechaCita,codEstado) VALUES (:pRequest.idPaciente, :pRequest.descCita, :pRequest.fechaCita, :pRequest.codEstado))
        #; if (SQLCODE = 0) {
        #; // La instrucción ha ido bien
        #; } else {
        #;     set pResponse.exito = 0
        #;     set pResponse.error = $System.SQL.Functions.SQLCODE(SQLCODE)
        #; }
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
        
        #;  &sql(UPDATE cysnet_clinicaDental_data.Citas SET codEstado = :pRequest.codEstado WHERE %ID = :pRequest.idCita)
        #; if (SQLCODE = 0) {
        #; // La instrucción ha ido bien
        #; } else {
        #;     set pResponse.exito = 0
        #;     set pResponse.error = $System.SQL.Functions.SQLCODE(SQLCODE)
        #; }
       
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
            set sql = "UPDATE ClinicaDental.Cita SET fechaCita = ? WHERE idCita = ?"
            set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.fechaCita, pRequest.idCita)
            if ($$$ISOK(sc)) {
                if (numRows = 0) {
                    set pResponse.exito = 0
                    set pResponse.error = "No se ha insertado ninguna fila"
                }
            }
        #;  &sql(UPDATE cysnet_clinicaDental_data.Citas SET fechaCita = :pRequest.fechaCita WHERE %ID = :pRequest.idCita)
        #; if (SQLCODE = 0) {
        #; // La instrucción ha ido bien
        #; } else {
        #;     set pResponse.exito = 0
        #;     set pResponse.error = $System.SQL.Functions.SQLCODE(SQLCODE)
        #; }
       
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
        #; #dim sc As %Status = $$$OK
        #; #dim stm As %SQL.Statement
        #; #dim rs As %SQL.StatementResult

        Set pResponse = ##class(cysnet.clinicaDental.msg.listarCitasResponse).%New()
        set pResponse.citas = ##class(%ListOfObjects).%New()

        try {
            #; Set stm = ##class(%SQL.Statement).%New()
            set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
            if (pRequest.mostrarBajas = 1) {
                
                set sql = "SELECT idCita, idPaciente, descCita, fechaCita, codEstado FROM ClinicaDental.Cita "
                set sc = ..Adapter.ExecuteQuery(.rs, sql)
                #; set sc = stm.%Prepare("SELECT ID, idPaciente, descCita, fechaCita, codEstado FROM cysnet_clinicaDental_data.Citas")
            } else {
                    set sql = "SELECT idCita, idPaciente, descCita, fechaCita, codEstado FROM ClinicaDental.Cita WHERE codEstado = 1 "
                    set sc = ..Adapter.ExecuteQuery(.rs, sql)
                #; set sc = stm.%Prepare("SELECT ID, idPaciente, descCita, fechaCita, codEstado FROM cysnet_clinicaDental_data.Citas WHERE codEstado = 1")
            }
          
            
            if ($$$ISOK(sc)) {
                #; Set rs = stm.%Execute()
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
</MapItems>
}

}
