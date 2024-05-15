Class cysnet.clinicaDental.msg.nuevoPacienteResponse Extends Ens.Response
{

/// Informa si la petición se realizó o no
Property exito As %Boolean;

/// Contiene el mensaje de error en caso de que se genere alguno
Property mensajeError As %String;

Storage Default
{
<Data name="nuevoPacienteResponseDefaultData">
<Subscript>"nuevoPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensajeError</Value>
</Value>
</Data>
<DefaultData>nuevoPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
