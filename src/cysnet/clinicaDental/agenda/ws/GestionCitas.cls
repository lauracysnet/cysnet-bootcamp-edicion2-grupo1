Class cysnet.clinicaDental.agenda.ws.GestionCitas Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "GestionCitas";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "BOOTCAMP";

/// Se utilizarÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡n namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

Method altaCita(idPaciente As %BigInt, descCita As %String, fechaCita As %TimeStamp) As cysnet.clinicaDental.msg.CrearAltaCitaResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.CrearAltaCitaRequest
    #dim rsp As cysnet.clinicaDental.msg.CrearAltaCitaResponse

    set req = ##Class(cysnet.clinicaDental.msg.CrearAltaCitaRequest).%New()

    set req.idPaciente = idPaciente
    set req.descCita = descCita
    set req.fechaCita = fechaCita
    set req.codEstado = 1

    do ..SendRequestSync("CitasSQL", req, .rsp)
    
    quit rsp
}

/// Description
Method cancelarCita(idCita As %Integer) As cysnet.clinicaDental.msg.cancelarCitaResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.cancelarCitaRequest
    #dim rsp As cysnet.clinicaDental.msg.cancelarCitaResponse

    set req = ##class(cysnet.clinicaDental.msg.cancelarCitaRequest).%New()
    set req.idCita = idCita
    set req.codEstado = 4
    
    do ..SendRequestSync("CitasSQL", req, .rsp)
    Return rsp
}

Method modificarCita(idCita As %Integer, fechaCita As %TimeStamp) As cysnet.clinicaDental.msg.modificarCitaResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.modificarCitaRequest
    #dim rsp As cysnet.clinicaDental.msg.modificarCitaResponse

    set req = ##class(cysnet.clinicaDental.msg.modificarCitaRequest).%New()
    set req.idCita = idCita
    set req.fechaCita = fechaCita

    do ..SendRequestSync("CitasSQL", req, .rsp)
    Return rsp
}

Method listarCitas(mostrarBajas As %Boolean) As cysnet.clinicaDental.msg.listarCitasResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.listarCitasRequest
    #dim rsp As cysnet.clinicaDental.msg.listarCitasResponse

    set req = ##class(cysnet.clinicaDental.msg.listarCitasRequest).%New()
    set req.mostrarBajas = 0
    if (mostrarBajas = 1) {
        set req.mostrarBajas = mostrarBajas
    }
    

    do ..SendRequestSync("CitasSQL", req, .rsp)
    Return rsp
}

Method admitirPaciente(idPaciente As %Integer, idCita As %Integer, fechaAdmision As %TimeStamp) As cysnet.clinicaDental.msg.admitirPacienteResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.admitirPacienteRequest
    #dim rsp As cysnet.clinicaDental.msg.admitirPacienteResponse

    set req = ##class(cysnet.clinicaDental.msg.admitirPacienteRequest).%New()
    set req.idPaciente = idPaciente
    set req.idCita = idCita
    set req.fechaAdmision = fechaAdmision
    set req.indEnviada = 0
   
    

    do ..SendRequestSync("AdmisionesSQL", req, .rsp)
    Return rsp
}

Method altaPaciente(idPaciente As %Integer, idCita As %Integer, fechaAltas As %TimeStamp) As cysnet.clinicaDental.msg.altaPacienteResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.altaPacienteRequest
    #dim rsp As cysnet.clinicaDental.msg.altaPacienteResponse

    set req = ##class(cysnet.clinicaDental.msg.altaPacienteRequest).%New()
    set req.idPaciente = idPaciente
    set req.idCita = idCita
    set req.fechaAltas = fechaAltas
    set req.indEnviada = 0
   
    

    do ..SendRequestSync("AltasSQL", req, .rsp)
    Return rsp
}

}
