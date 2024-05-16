Class cysnet.clinicaDental.msg.listarCitasResponse Extends Ens.Response
{

Property citas As list Of cysnet.clinicaDental.msg.struct.Cita;

Storage Default
{
<Data name="listarCitasResponseDefaultData">
<Subscript>"listarCitasResponse"</Subscript>
<Value name="1">
<Value>citas</Value>
</Value>
</Data>
<DefaultData>listarCitasResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
