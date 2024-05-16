Class cysnet.clinicaDental.msg.cancelarCitaRequest Extends Ens.Request
{

Property idCita As %Integer;

Property codEstado As %Integer;

Storage Default
{
<Data name="cancelarCitaRequestDefaultData">
<Subscript>"cancelarCitaRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>codEstado</Value>
</Value>
</Data>
<DefaultData>cancelarCitaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
