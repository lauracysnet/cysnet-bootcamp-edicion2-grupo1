Class cysnet.clinicaDental.msg.struct.MensajeSIUS12 Extends (%SerialObject, %XML.Adaptor)
{

Property nombre As %String;

Property apellidos As %String;

Property idCita As %Integer;

Property idPaciente As %BigInt;

Property descCita As %String(MAXLEN = "");

Property fechaCita As %TimeStamp;

Storage Default
{
<Data name="MensajeSIUS12State">
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
<Value>nombre</Value>
</Value>
<Value name="6">
<Value>apellidos</Value>
</Value>
</Data>
<State>MensajeSIUS12State</State>
<StreamLocation>^cysnet.cliniA813.MensajeSIUS12S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
