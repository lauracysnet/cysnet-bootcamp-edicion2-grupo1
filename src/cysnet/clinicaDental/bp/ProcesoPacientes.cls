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
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='objRequest' type='Ens.Request' instantiate='0' />
<property name='resultadoRegla' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1150' >
<assign name="Asignar Request" property="context.objRequest" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<rule name='ValidaDatos' rule='cysnet.clinicaDental.rules.ValidarDatosCompletos'  resultLocation='context.resultadoRegla' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='Datos Correctos?' condition='context.resultadoRegla = 1' xpos='200' ypos='550' xend='200' yend='1050' >
<true>
<switch name='Tipo De Transacción' xpos='335' ypos='700' xend='335' yend='950' >
<case condition='request.%ClassName() = "nuevoPacienteRequest"' >
<call name='Nuevo Paciente' target='PacientesSQL' async='0' xpos='470' ypos='850' >
<request type='cysnet.clinicaDental.msg.nuevoPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.msg.nuevoPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<default name='default' />
</switch>
</true>
</if>
</sequence>
</process>
}

}
