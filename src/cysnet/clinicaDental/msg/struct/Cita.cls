Class cysnet.clinicaDental.msg.struct.Cita Extends (%SerialObject, %XML.Adaptor)
{

Property idCita As %Integer;

Property idPaciente As %Integer;

Property descCita As %String(MAXLEN = "");

Property fechaCita As %TimeStamp;

Property codEstado As %Integer;

Storage Default
{
<Data name="CitaState">
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="3">
<Value>descCita</Value>
</Value>
<Value name="4">
<Value>fechaCita</Value>
</Value>
<Value name="5">
<Value>codEstado</Value>
</Value>
</Data>
<State>CitaState</State>
<StreamLocation>^cysnet.clinicaDentalA813.CitaS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
