Class cysnet.clinicaDental.msg.BuscarPacientePorIDResponse Extends Ens.Response
{

Property nombre As %String;

Property apellidos As %String;

Property email As %String;

Property mensaje As %String;

Storage Default
{
<Data name="BuscarPacientePorIDResponseDefaultData">
<Subscript>"BuscarPacientePorIDResponse"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellidos</Value>
</Value>
<Value name="3">
<Value>email</Value>
</Value>
<Value name="4">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>BuscarPacientePorIDResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
