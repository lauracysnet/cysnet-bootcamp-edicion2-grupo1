/// 
Class cysnet.clinicaDental.bp.ProcesoPacientes Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2285' >
<context>
<property name='objRequest' type='Ens.Request' instantiate='0' />
<property name='resultadoRegla' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1500' >
<assign name="Asignar Request" property="context.objRequest" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<rule name='ValidaDatos' rule='cysnet.clinicaDental.rules.ValidarDatosCompletos'  resultLocation='context.resultadoRegla' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='Datos Correctos?' condition='context.resultadoRegla = 1' xpos='200' ypos='550' xend='200' yend='1400' >
<true>
<switch name='Tipo De Transacción' xpos='335' ypos='700' xend='335' yend='1300' >
<case condition='request.%ClassName() = "BajaPacienteRequest"' name='Baja Paciente ' >
<call name='Baja Paciente' target='PacientesSQL' async='0' xpos='470' ypos='850' >
<request type='cysnet.clinicaDental.msg.BajaPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BajaPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ModificarPacienteRequest"' name='Modificar Paciente ' >
<call name='Modificar Paciente' target='PacientesSQL' async='0' xpos='740' ypos='850' >
<request type='cysnet.clinicaDental.msg.ModificarPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.ModificarPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ListarPacientesRequest"' name='Listar Pacientes' >
<call name='Listar Pacientes ' target='PacientesSQL' async='0' xpos='1010' ypos='850' >
<request type='cysnet.clinicaDental.msg.ListarPacientesRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.ListarPacientesResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "BuscarPacientePorIDRequest"' name='Buscar Paciente Por ID' >
<call name='Buscar Paciente Por ID' target='PacientesSQL' async='0' xpos='1280' ypos='850' >
<request type='cysnet.clinicaDental.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "NuevoPacienteRequest"' name='Nuevo Paciente ' >
<call name='Nuevo Paciente' target='PacientesSQL' async='0' xpos='1550' ypos='850' >
<request type='cysnet.clinicaDental.msg.NuevoPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.NuevoPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<if name='inserción correcta?' condition='response.exito' xpos='1550' ypos='950' xend='1550' yend='1200' >
<true>
<call name='Notificar' target='NotificacionesSQL' async='0' xpos='1685' ypos='1100' >
<request type='cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaRequest' >
<assign property="callrequest.asunto" value="&quot;Notificar Bienvenida&quot;" action="set" />
<assign property="callrequest.indEnviado" value="0" action="set" />
<assign property="callrequest.idPaciente" value="&quot;&quot;" action="set" />
<assign property="callrequest.idPaciente" value="response.id" action="set" />
<assign property="callrequest.mensaje" value="response.mensaje" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
</case>
<default name='default' />
</switch>
</true>
</if>
</sequence>
</process>
}

}
