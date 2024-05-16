Class cysnet.clinicaDental.msg.modificarCitaResponse Extends Ens.Response
{

Property mensaje As %String;

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="modificarCitaResponseDefaultData">
<Subscript>"modificarCitaResponse"</Subscript>
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
<DefaultData>modificarCitaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
