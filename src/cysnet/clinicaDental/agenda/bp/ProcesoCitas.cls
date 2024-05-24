/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoCitas Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='objRequest' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='resultadoRegla' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='mensajeHL7' type='EnsLib.HL7.Message' instantiate='0' />
<property name='infoCItaPaciente' type='cysnet.clinicaDental.msg.struct.MensajeSIUS12' instantiate='0' />
<property name='infoAltaP' type='cysnet.clinicaDental.msg.struct.MensajeADT03' instantiate='0' />
<property name='idPaciente' type='%Integer' initialexpression='0' instantiate='0' />
</context>
<sequence xend='200' yend='1650' >
<assign name="Asignar Request" property="context.objRequest" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<if name='Datos correctos?' condition='context.resultadoRegla = 0' xpos='200' ypos='450' xend='200' yend='1550' >
<true>
<switch name='Tipo de transaccion' xpos='335' ypos='600' xend='335' yend='1450' >
<case condition='request.%ClassName() = "cancelarCitaRequest"' name='cancelar cita' >
<call name='Cancelar cita' target='CitasSQL' async='0' xpos='470' ypos='1000' >
<request type='cysnet.clinicaDental.msg.cancelarCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.cancelarCitaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "LeerAltaPacienteRequest"' name='leer alta' >
<call name='Obtener cita' target='CitasSQL' async='0' xpos='740' ypos='750' >
<request type='cysnet.clinicaDental.msg.ConsulatCitaPorIdRequest' >
<assign property="callrequest.idCita" value="request.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.ConsulatCitaPorIdResponse' >
<assign property="context.infoAltaP.idPaciente" value="callresponse.idPaciente" action="set" />
</response>
</call>
<call name='Obtener Admision con cita' target='AdmisionesSQL' async='0' xpos='740' ypos='850' >
<request type='cysnet.clinicaDental.msg.ConsularAdmisionPorIdRequest' >
<assign property="callrequest.idCita" value="request.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.ConsularAdmisionPorIdResponse' >
<assign property="context.infoAltaP.idAdmision" value="callresponse.idAdmision" action="set" />
<assign property="context.infoAltaP.fechaAdmision" value="callresponse.fechaAdmision" action="set" />
</response>
</call>
<call name='obtener paciente Alta' target='ProcesoPacientes' async='0' xpos='740' ypos='950' >
<request type='cysnet.clinicaDental.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.id" value="context.infoAltaP.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' >
<assign property="context.infoAltaP.nombre" value="callresponse.nombre" action="set" />
<assign property="context.infoAltaP.apellidos" value="callresponse.apellidos" action="set" />
</response>
</call>
<assign name="Asignar fechaAlta" property="context.infoAltaP.fechaAlta" value="request.fechaAlta" action="set" xpos='740' ypos='1050' />
<transform name='Transforma ADTA03' class='cysnet.clinicaDental.agenda.bp.InfoAltaPacienteToADTA03' source='context.infoAltaP' target='context.mensajeHL7' xpos='740' ypos='1150' />
<call name='Enviar HL7 Alta' target='OutFileHL7' async='0' xpos='740' ypos='1250' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</case>
<case condition='request.%ClassName() = "modificarCitaRequest"' name='Modificar cita' >
<call name='Modificar cita' target='CitasSQL' async='0' xpos='1010' ypos='750' >
<request type='cysnet.clinicaDental.msg.modificarCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.modificarCitaResponse' >
<assign property="response" value="callresponse" action="set" />
<assign property="context.infoCItaPaciente.idPaciente" value="callresponse.idPaciente" action="set" />
<assign property="context.infoCItaPaciente.descCita" value="callresponse.descCita" action="set" />
<assign property="context.infoCItaPaciente.fechaCita" value="callresponse.fechaCita" action="set" />
<assign property="context.infoCItaPaciente.idCita" value="callresponse.idCita" action="set" />
</response>
</call>
<call name='Obtener Paciente' target='ProcesoPacientes' async='0' xpos='1010' ypos='850' >
<request type='cysnet.clinicaDental.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.id" value="context.infoCItaPaciente.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' >
<assign property="context.infoCItaPaciente.nombre" value="callresponse.nombre" action="set" />
<assign property="context.infoCItaPaciente.apellidos" value="callresponse.apellidos" action="set" />
</response>
</call>
<transform name='Transformar SIUS15' class='cysnet.clinicaDental.agenda.bp.InfoNuevaCitaSIU15' source='context.infoCItaPaciente' target='context.mensajeHL7' xpos='1010' ypos='950' />
<call name='Enviar HL7 S15' target='OutFileHL7' async='0' xpos='1010' ypos='1050' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
<assign name="Asignar fecha modificada" property="context.infoCItaPaciente.fechaCita" value="request.fechaCita" action="set" xpos='1010' ypos='1150' />
<transform name='TransformaSIUS12' class='cysnet.clinicaDental.agenda.bp.InfoNuevaCitaSIU12' source='context.infoCItaPaciente' target='context.mensajeHL7' xpos='1010' ypos='1250' />
<call name='Enviar HL7' target='OutFileHL7' async='0' xpos='1010' ypos='1350' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</case>
<case condition='request.%ClassName() = "LeerAdmitirPacienteRequest"' name='admitir paciente' >
<call name='Admitir paciente' target='AdmisionesSQL' async='0' xpos='1010' ypos='1000' >
<request type='cysnet.clinicaDental.msg.admitirPacienteRequest' />
<response type='cysnet.clinicaDental.msg.admitirPacienteResponse' />
</call>
</case>
<default name='default' />
</switch>
</true>
<false>
<switch name='Tipo de transaccion con paciente' xpos='1415' ypos='850' xend='1415' yend='1400' >
<case condition='request.%ClassName() = "CrearAltaCitaRequest"' name='nueva cita' >
<call name='Nueva cita' target='CitasSQL' async='0' xpos='1280' ypos='750' >
<request type='cysnet.clinicaDental.msg.CrearAltaCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.CrearAltaCitaResponse' >
<assign property="response" value="callresponse" action="set" />
<assign property="context.infoCItaPaciente.idCita" value="callresponse.idCita" action="set" />
</response>
</call>
<assign name="asignar idPaciente" property="context.infoCItaPaciente.idPaciente" value="request.idPaciente" action="set" xpos='1280' ypos='850' />
<assign name="asignar desCita" property="context.infoCItaPaciente.descCita" value="request.descCita" action="set" xpos='1280' ypos='950' />
<assign name="Asignar fechaCita" property="context.infoCItaPaciente.fechaCita" value="request.fechaCita" action="set" xpos='1280' ypos='1050' />
<call name='obtener paciente' target='ProcesoPacientes' async='0' xpos='1280' ypos='1150' >
<request type='cysnet.clinicaDental.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.id" value="request.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' >
<assign property="context.infoCItaPaciente.nombre" value="callresponse.nombre" action="set" />
<assign property="context.infoCItaPaciente.apellidos" value="callresponse.apellidos" action="set" />
</response>
</call>
<transform name='Transformar SIUS12' class='cysnet.clinicaDental.agenda.bp.InfoNuevaCitaSIU12' source='context.infoCItaPaciente' target='context.mensajeHL7' xpos='1280' ypos='1250' />
<call name='Enviar HL7 cita nueva' target='OutFileHL7' async='0' xpos='1280' ypos='1350' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</case>
<default name='default' />
</switch>
</false>
</if>
</sequence>
</process>
}

}
