Class cysnet.clinicaDental.msg.listarCitasRequest Extends Ens.Request
{

/// Description
Property mostrarBajas As %Boolean;

Storage Default
{
<Data name="listarCitasRequestDefaultData">
<Subscript>"listarCitasRequest"</Subscript>
<Value name="1">
<Value>mostrarBajas</Value>
</Value>
</Data>
<DefaultData>listarCitasRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
