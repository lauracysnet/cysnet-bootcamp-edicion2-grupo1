Class cysnet.clinicaDental.msg.inSQL.LeerAdmitirPacienteRequest Extends Ens.Request
{

Property idAdmision As %Integer;

Property idCita As %Integer;

Property fechaAdmision As %TimeStamp;

Storage Default
{
<Data name="LeerAdmitirPacienteRequestDefaultData">
<Subscript>"LeerAdmitirPacienteRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>fechaAdmision</Value>
</Value>
<Value name="3">
<Value>indEnviada</Value>
</Value>
<Value name="4">
<Value>IdAdmision</Value>
</Value>
<Value name="5">
<Value>idAdmision</Value>
</Value>
</Data>
<DefaultData>LeerAdmitirPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
