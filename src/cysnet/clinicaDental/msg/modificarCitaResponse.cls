Class cysnet.clinicaDental.msg.modificarCitaResponse Extends Ens.Response
{

Property idCita As %Integer;

Property idPaciente As %Integer;

Property descCita As %String;

Property fechaCita As %TimeStamp;

Property mensaje As %String;

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="modificarCitaResponseDefaultData">
<Subscript>"modificarCitaResponse"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
<Value name="2">
<Value>exito</Value>
</Value>
<Value name="3">
<Value>error</Value>
</Value>
<Value name="4">
<Value>idCita</Value>
</Value>
<Value name="5">
<Value>idPaciente</Value>
</Value>
<Value name="6">
<Value>descCita</Value>
</Value>
<Value name="7">
<Value>fechaCita</Value>
</Value>
</Data>
<DefaultData>modificarCitaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
