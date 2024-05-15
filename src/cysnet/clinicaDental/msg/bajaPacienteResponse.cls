Class cysnet.clinicaDental.msg.bajaPacienteResponse Extends Ens.Response
{

/// Se logró la ejecucion o no
Property exito As %Boolean;

/// Mesnaje de respuesta
Property mensaje As %String(MAXLEN = 250);

Storage Default
{
<Data name="bajaPacienteResponseDefaultData">
<Subscript>"bajaPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>bajaPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
