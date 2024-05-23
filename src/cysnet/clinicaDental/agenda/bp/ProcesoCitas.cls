/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoCitas Extends Ens.BusinessProcessBPL
{

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
</context>
<sequence xend='200' yend='1250' >
<assign name="Asignar Request" property="context.objRequest" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<if name='Datos correctos?' condition='context.resultadoRegla = 0' xpos='200' ypos='450' xend='200' yend='1150' >
<true>
<switch name='Tipo de transaccion' xpos='335' ypos='600' xend='335' yend='1050' >
<case condition='request.%ClassName() = "cancelarCitaRequest"' name='cancelar cita' >
<call name='Cancelar cita' target='CitasSQL' async='0' xpos='470' ypos='750' >
<request type='cysnet.clinicaDental.msg.cancelarCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.cancelarCitaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "modificarCitaRequest"' name='Modificar cita' >
<call name='Modificar cita' target='CitasSQL' async='0' xpos='740' ypos='750' >
<request type='cysnet.clinicaDental.msg.modificarCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.ModificarPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "CrearAltaCitaRequest"' name='nueva cita' >
<call name='Nueva cita' target='CitasSQL' async='0' xpos='1010' ypos='750' >
<request type='cysnet.clinicaDental.msg.CrearAltaCitaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.CrearAltaCitaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<transform name='Tranformarn S12' class='cysnet.clinicaDental.agenda.bp.InfoNuevaCitaSIU12' source='context.objRequest' target='context.mensajeHL7' xpos='1010' ypos='850' />
<call name='Enviar HL7 cita nueva' target='OutFileHL7' async='1' xpos='1010' ypos='950' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</case>
<default name='default' />
</switch>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
