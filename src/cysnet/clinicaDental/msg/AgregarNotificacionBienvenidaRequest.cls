Class cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaRequest Extends Ens.Request
{

Property idPaciente As %Integer;

Property asunto As %String(MAXLEN = 100);

Property mensaje As %String(MAXLEN = 300);

Property indEnviado As %Integer;

Storage Default
{
<Data name="AgregarNotificacionBienvenidaRequestDefaultData">
<Subscript>"AgregarNotificacionBienvenidaRequest"</Subscript>
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>asunto</Value>
</Value>
<Value name="3">
<Value>mensaje</Value>
</Value>
<Value name="4">
<Value>indEnviado</Value>
</Value>
</Data>
<DefaultData>AgregarNotificacionBienvenidaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
