Class cysnet.clinicaDental.agenda.ws.GestionPacientes Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "GestionPacientes";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "BOOTCAMP";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

/*
Crea un nuevo registro de paciente. Antes de darle de alta, comprobará que no exista un paciente 
con el mismo email. El campo permiteNotificaciones tendrá valor por defecto 
1 (true) y el campo baja 0 (false)
*/
Method nuevoPaciente(nombre As %String, apellidos As %String, email As %String, permiteNotificaciones As %Boolean, baja As %Boolean) As cysnet.clinicaDental.msg.nuevoPacienteResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.nuevoPacienteRequest
	#dim rsp As cysnet.clinicaDental.msg.nuevoPacienteResponse

    set req = ##class(cysnet.clinicaDental.msg.nuevoPacienteRequest).%New()
    set req.nombre = nombre
    set req.apellidos = apellidos
    set req.email = email
    set req.permiteNotificaciones = permiteNotificaciones
    set req.baja = baja

    do ..SendRequestSync("ProcesoPacientes", req, .rsp)
	quit rsp

	Quit "prueba"
}

}
