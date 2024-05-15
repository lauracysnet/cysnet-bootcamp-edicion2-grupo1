Class cysnet.clinicaDental.msg.nuevoPacienteRequest Extends Ens.Request
{

Property nombre As %String;

Property apellidos As %String;

Property email As %String;

Property permiteNotificaciones As %Boolean;

Property baja As %Boolean;

Storage Default
{
<Data name="nuevoPacienteRequestDefaultData">
<Subscript>"nuevoPacienteRequest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellidos</Value>
</Value>
<Value name="3">
<Value>email</Value>
</Value>
<Value name="4">
<Value>permiteNotificaciones</Value>
</Value>
<Value name="5">
<Value>baja</Value>
</Value>
</Data>
<DefaultData>nuevoPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
