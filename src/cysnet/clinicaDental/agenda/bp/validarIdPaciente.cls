/// 
Class cysnet.clinicaDental.agenda.bp.validarIdPaciente Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<when condition="nombreClase = &quot;admitirPacienteRequest&quot;" comment="">
<return>objRequest.idPaciente</return>
</when>
<when condition="nombreClase=&quot;altaPacienteRequest&quot;" comment="">
<return>()</return>
</when>
<when condition="nombreClase=&quot;CrearAltaCitaRequest&quot;" comment="">
<return>objRequest.idPaciente</return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
