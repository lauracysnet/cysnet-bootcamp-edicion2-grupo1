Class cysnet.clinicaDental.msg.bajaPacienteRequest Extends Ens.Request
{

/// Email para identificar a que paciente darle de baja
Property email As %String;

Storage Default
{
<Data name="bajaPacienteRequestDefaultData">
<Subscript>"bajaPacienteRequest"</Subscript>
<Value name="1">
<Value>email</Value>
</Value>
</Data>
<DefaultData>bajaPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
