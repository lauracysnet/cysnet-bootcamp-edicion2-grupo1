Class cysnet.clinicaDental.msg.NuevoPacienteResponse Extends Ens.Response
{

/// Informa si la petición se realizó o no
Property exito As %Boolean;

/// Contiene el mensaje de error en caso de que se genere alguno
Property mensaje As %String;

/// Ultimo ID agregado en la db
Property id As %BigInt;

Storage Default
{
<Data name="NuevoPacienteResponseDefaultData">
<Subscript>"NuevoPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>NuevoPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
