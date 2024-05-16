Class cysnet.clinicaDental.msg.altaPacienteRequest Extends Ens.Request
{

Property idPaciente As %Integer;

Property idCita As %Integer;

Property fechaAltas As %TimeStamp;

Property indEnviada As %Boolean;

Storage Default
{
<Data name="altaPacienteRequestDefaultData">
<Subscript>"altaPacienteRequest"</Subscript>
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
<Value>idPaciente</Value>
</Value>
</Data>
<DefaultData>altaPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
