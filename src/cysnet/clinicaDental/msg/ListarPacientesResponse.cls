Class cysnet.clinicaDental.msg.ListarPacientesResponse Extends Ens.Response
{

Property pacientes As list Of cysnet.clinicaDental.msg.struct.Pacientes;

Storage Default
{
<Data name="ListarPacientesResponseDefaultData">
<Subscript>"ListarPacientesResponse"</Subscript>
<Value name="1">
<Value>pacientes</Value>
</Value>
</Data>
<DefaultData>ListarPacientesResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
