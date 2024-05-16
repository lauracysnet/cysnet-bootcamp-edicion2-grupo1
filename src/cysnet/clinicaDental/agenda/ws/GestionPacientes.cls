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
}

/// Da de baja un paciente. Para darlo de baja no eliminarlo, actualizar el campo baja a 1
Method bajaPaciente(email As %String) As cysnet.clinicaDental.msg.bajaPacienteResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.bajaPacienteRequest
	#dim rsp As cysnet.clinicaDental.msg.bajaPacienteResponse

    set req = ##class(cysnet.clinicaDental.msg.bajaPacienteRequest).%New()
    set req.email = email

    do ..SendRequestSync("ProcesoPacientes", req, .rsp)

	quit rsp
}

/// Modifica un paciente. Al modificar, se comprobará que el email no exista en OTRO paciente. 
/// Permitir modificar los campos: nombre, apellidos, email, permiteNotificaciones
Method modificarPaciente(nombre As %String, apellidos As %String, nuevoEmail As %String, emailAcutal As %String, permiteNotificaciones As %Boolean, conservarCorreo As %Boolean) As cysnet.clinicaDental.msg.ModificarPacienteResponse [ WebMethod ]
{
    #dim req As cysnet.clinicaDental.msg.ModificarPacienteRequest
	#dim rsp As cysnet.clinicaDental.msg.ModificarPacienteResponse

    set req = ##class(cysnet.clinicaDental.msg.ModificarPacienteRequest).%New()
    set req.nombre = nombre
    set req.apellidos = apellidos
    set req.nuevoEmail = nuevoEmail
    set req.emailAcutal = emailAcutal
    set req.permiteNotificaciones = permiteNotificaciones
    set req.conservarCorreo = conservarCorreo

    do ..SendRequestSync("ProcesoPacientes", req, .rsp)

	quit rsp
}

}
