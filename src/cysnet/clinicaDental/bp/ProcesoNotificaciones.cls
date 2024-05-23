/// 
Class cysnet.clinicaDental.bp.ProcesoNotificaciones Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='Notificacion' type='Ens.Request' instantiate='0' />
<property name='Paciente' type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' instantiate='0' />
</context>
<sequence xend='200' yend='1050' >
<assign name="Asignar notificació" property="context.Notificacion" value="request" action="set" xpos='200' ypos='250' />
<call name='Buscar paciente' target='PacientesSQL' async='0' xpos='200' ypos='350' >
<request type='cysnet.clinicaDental.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.id" value="context.Notificacion.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.BuscarPacientePorIDResponse' >
<assign property="context.Paciente" value="callresponse" action="set" />
</response>
</call>
<if name='Existe paciente?' condition='context.Paciente.mensaje = "Exitoso"' xpos='200' ypos='450' xend='200' yend='950' >
<true>
<if name='Permite notificaciones?' condition='context.Paciente.permiteNotificaciones = 1' xpos='470' ypos='600' xend='470' yend='850' >
<true>
<call name='Enviar notificación' target='EnviarEmail' async='0' xpos='605' ypos='750' >
<request type='cysnet.clinicaDental.msg.EnviarEmailRequest' >
<assign property="callrequest.asunto" value="context.Notificacion.asunto" action="set" />
<assign property="callrequest.mensaje" value="context.Notificacion.mensaje_&quot; &quot;_context.Paciente.nombre" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.EnviarEmailResponse' />
</call>
</true>
</if>
</true>
<false>
<call name='Enviar email error paciente' target='EnviarEmail' async='0' xpos='200' ypos='600' >
<request type='cysnet.clinicaDental.msg.EnviarEmailRequest' >
<assign property="callrequest.asunto" value="&quot;Consulta no valida&quot;" action="set" />
<assign property="callrequest.mensaje" value="&quot;No se encuentra al paciente&quot;" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.EnviarEmailResponse' />
</call>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
