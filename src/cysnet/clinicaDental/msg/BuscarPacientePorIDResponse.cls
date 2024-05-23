Class cysnet.clinicaDental.msg.BuscarPacientePorIDResponse Extends Ens.Response
{

Property id As %BigInt;

Property nombre As %String;

Property apellidos As %String;

Property email As %String;

Property permiteNotificaciones As %Boolean;

Property mensaje As %String(MAXLEN = 250);

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
<Value name="5">
<Value>id</Value>
</Value>
<Value name="6">
<Value>permiteNotificaciones</Value>
</Value>
</Data>
<DefaultData>BuscarPacientePorIDResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
