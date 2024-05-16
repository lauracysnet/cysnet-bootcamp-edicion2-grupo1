Class cysnet.clinicaDental.msg.admitirPacienteRequest Extends Ens.Request
{

Property idPaciente As %Integer;

Property idCita As %Integer;

Property fechaAdmision As %TimeStamp;

Property indEnviada As %Boolean;

Storage Default
{
<Data name="admitirPacienteRequestDefaultData">
<Subscript>"admitirPacienteRequest"</Subscript>
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
<Value>idPaciente</Value>
</Value>
</Data>
<DefaultData>admitirPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
