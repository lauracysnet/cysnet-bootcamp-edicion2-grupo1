Class cysnet.clinicaDental.msg.struct.MensajeADT03 Extends (%SerialObject, %XML.Adaptor)
{

Property nombre As %String;

Property apellidos As %String;

Property idPaciente As %BigInt;

Property idAdmision As %Integer;

Property fechaAdmision As %TimeStamp;

Property idAlta As %Integer;

Property fechaAlta As %TimeStamp;

Storage Default
{
<Data name="MensajeADT03State">
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellidos</Value>
</Value>
<Value name="3">
<Value>idCita</Value>
</Value>
<Value name="4">
<Value>idPaciente</Value>
</Value>
<Value name="5">
<Value>idAdmision</Value>
</Value>
<Value name="6">
<Value>fechaAdmision</Value>
</Value>
<Value name="7">
<Value>idAlta</Value>
</Value>
<Value name="8">
<Value>fechaAlta</Value>
</Value>
</Data>
<State>MensajeADT03State</State>
<StreamLocation>^cysnet.clinicA813.MensajeADT03S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
