Class cysnet.clinicaDental.msg.BajaPacienteRequest Extends Ens.Request
{

/// Email para identificar a que paciente darle de baja
Property email As %String;

Storage Default
{
<Data name="BajaPacienteRequestDefaultData">
<Subscript>"BajaPacienteRequest"</Subscript>
<Value name="1">
<Value>email</Value>
</Value>
</Data>
<DefaultData>BajaPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
