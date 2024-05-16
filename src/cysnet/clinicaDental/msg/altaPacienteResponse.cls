Class cysnet.clinicaDental.msg.altaPacienteResponse Extends Ens.Response
{

Property mensaje As %String(MAXLEN = "");

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="altaPacienteResponseDefaultData">
<Subscript>"altaPacienteResponse"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
<Value name="2">
<Value>exito</Value>
</Value>
<Value name="3">
<Value>error</Value>
</Value>
</Data>
<DefaultData>altaPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
