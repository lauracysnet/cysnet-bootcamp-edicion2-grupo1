Class cysnet.clinicaDental.msg.struct.MensajeADT01 Extends (%SerialObject, %XML.Adaptor)
{

Property idPaciente As %Integer;

Property nombre As %String;

Property apellidos As %String;

Property idAdmision As %Integer;

Property fechaAdmision As %TimeStamp;

Storage Default
{
<Data name="MensajeADT01State">
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellidos</Value>
</Value>
<Value name="4">
<Value>idAdmision</Value>
</Value>
<Value name="5">
<Value>fechaAdmision</Value>
</Value>
</Data>
<State>MensajeADT01State</State>
<StreamLocation>^cysnet.clinicA813.MensajeADT01S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
