/// 
Class cysnet.clinicaDental.rules.ValidarDatosCompletos Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Validar Datos" disabled="false">
<when condition="nombreClase=&quot;nuevoPacienteRequest&quot;" comment="">
<rule name="" disabled="false">
<when condition="(objRequest.nombre!=&quot;&quot;)&amp;&amp;(objRequest.apellidos!=&quot;&quot;)&amp;&amp;(objRequest.email!=&quot;&quot;)&amp;&amp;(objRequest.permiteNotificaciones!=&quot;&quot;)&amp;&amp;objRequest.baja!= &quot;&quot;" comment="">
<return>1</return>
</when>
</rule>
</when>
<when condition="nombreClase=&quot;BajaPacienteRequest&quot;" comment="">
<rule name="" disabled="false">
<when condition="objRequest.email!=&quot;&quot;" comment="">
<return>1</return>
</when>
</rule>
</when>
<when condition="nombreClase=&quot;ModificarPacienteRequest&quot;" comment="">
<rule name="" disabled="false">
<when condition="(objRequest.nombre!=&quot;&quot;)&amp;&amp;(objRequest.apellidos!=&quot;&quot;)&amp;&amp;(objRequest.emailAcutal!=&quot;&quot;)&amp;&amp;(objRequest.permiteNotificaciones!=&quot;&quot;)&amp;&amp;objRequest.conservarCorreo!=&quot;&quot;" comment="">
<rule name="Valida si actualiza email" disabled="false">
<when condition="!objRequest.conservarCorreo" comment="">
<rule name="" disabled="false">
<when condition="objRequest.nuevoEmail!=&quot;&quot;" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
<return>1</return>
</when>
</rule>
</when>
<when condition="nombreClase=&quot;ListarPacientesRequest&quot;" comment="">
<rule name="" disabled="false">
<when condition="objRequest.mostrarBajas!=&quot;&quot;" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
