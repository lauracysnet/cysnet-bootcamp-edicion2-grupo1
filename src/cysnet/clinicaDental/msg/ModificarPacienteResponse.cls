Class cysnet.clinicaDental.msg.ModificarPacienteResponse Extends Ens.Response
{

/// Description
Property exito As %Boolean;

/// Description
Property mensaje As %String;

Storage Default
{
<Data name="ModificarPacienteResponseDefaultData">
<Subscript>"ModificarPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>ModificarPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
