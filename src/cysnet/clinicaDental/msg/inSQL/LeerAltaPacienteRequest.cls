Class cysnet.clinicaDental.msg.inSQL.LeerAltaPacienteRequest Extends Ens.Request
{

Property idAlta As %Integer;

Property idCita As %Integer;

Property fechaAlta As %TimeStamp;

Storage Default
{
<Data name="LeerAltaPacienteRequestDefaultData">
<Subscript>"LeerAltaPacienteRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>fechaAltas</Value>
</Value>
<Value name="3">
<Value>indEnviada</Value>
</Value>
<Value name="4">
<Value>idAlta</Value>
</Value>
<Value name="5">
<Value>fechaAlta</Value>
</Value>
</Data>
<DefaultData>LeerAltaPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
