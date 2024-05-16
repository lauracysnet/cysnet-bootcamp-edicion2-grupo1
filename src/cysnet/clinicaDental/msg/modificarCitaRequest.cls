Class cysnet.clinicaDental.msg.modificarCitaRequest Extends Ens.Request
{

Property idCita As %Integer;

Property fechaCita As %TimeStamp;

Storage Default
{
<Data name="modificarCitaRequestDefaultData">
<Subscript>"modificarCitaRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>fechaCita</Value>
</Value>
</Data>
<DefaultData>modificarCitaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
