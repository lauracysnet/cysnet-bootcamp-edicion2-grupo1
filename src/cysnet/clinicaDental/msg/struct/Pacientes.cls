Class cysnet.clinicaDental.msg.struct.Pacientes Extends (%SerialObject, %XML.Adaptor)
{

Property nombre As %String;

Property apellidos As %String;

Property email As %String;

Property permiteNotificaciones As %Boolean;

Storage Default
{
<Data name="PacientesState">
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
</Data>
<State>PacientesState</State>
<StreamLocation>^cysnet.clinicaDeA813.PacientesS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
