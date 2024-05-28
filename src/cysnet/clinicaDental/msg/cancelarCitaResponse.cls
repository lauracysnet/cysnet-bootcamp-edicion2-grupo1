Class cysnet.clinicaDental.msg.cancelarCitaResponse Extends Ens.Response
{

Property idPaciente As %Integer;

Property mensaje As %String;

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="cancelarCitaResponseDefaultData">
<Subscript>"cancelarCitaResponse"</Subscript>
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
</Data>
<DefaultData>cancelarCitaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
