Class cysnet.clinicaDental.msg.CrearAltaCitaResponse Extends Ens.Response
{

Property idCita As %Integer;

Property mensaje As %String(MAXLEN = "");

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="CrearAltaCitaResponseDefaultData">
<Subscript>"CrearAltaCitaResponse"</Subscript>
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
</Data>
<DefaultData>CrearAltaCitaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
