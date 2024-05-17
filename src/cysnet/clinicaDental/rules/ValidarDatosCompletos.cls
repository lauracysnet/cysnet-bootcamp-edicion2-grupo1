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
</rule>
</ruleSet>
</ruleDefinition>
}

}
