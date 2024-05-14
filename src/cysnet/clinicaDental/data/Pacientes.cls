Class cysnet.clinicaDental.data.Pacientes Extends %Persistent
{

/// Nombre del paciente
Property nombre As %String;

/// Apellidos del paciente
Property apellidos As %String;

/// Email del paciente
Property email As %String;

//  Indica si un paciente está dado de baja del sistema

Property permiteNotificaciones As %Boolean;

///  Indica si un paciente está dado de baja del sistema
Property baja As %Boolean;

Storage Default
{
<Data name="PacientesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellidos</Value>
</Value>
<Value name="4">
<Value>email</Value>
</Value>
<Value name="5">
<Value>permiteNotificaciones</Value>
</Value>
<Value name="6">
<Value>baja</Value>
</Value>
</Data>
<DataLocation>^cysnet.clinicaDeBD9C.PacientesD</DataLocation>
<DefaultData>PacientesDefaultData</DefaultData>
<IdLocation>^cysnet.clinicaDeBD9C.PacientesD</IdLocation>
<IndexLocation>^cysnet.clinicaDeBD9C.PacientesI</IndexLocation>
<StreamLocation>^cysnet.clinicaDeBD9C.PacientesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
