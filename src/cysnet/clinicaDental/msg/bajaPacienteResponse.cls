Class cysnet.clinicaDental.msg.BajaPacienteResponse Extends Ens.Response
{

/// Se logró la ejecucion o no
Property exito As %Boolean;

/// Mesnaje de respuesta
Property mensaje As %String(MAXLEN = 250);

Storage Default
{
<Data name="BajaPacienteResponseDefaultData">
<Subscript>"BajaPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>BajaPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
