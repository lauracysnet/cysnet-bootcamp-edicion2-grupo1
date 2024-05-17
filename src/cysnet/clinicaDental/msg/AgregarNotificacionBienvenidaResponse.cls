Class cysnet.clinicaDental.msg.AgregarNotificacionBienvenidaResponse Extends Ens.Response
{

Property exito As %Boolean;

Property mensaje As %String;

Storage Default
{
<Data name="AgregarNotificacionBienvenidaResponseDefaultData">
<Subscript>"AgregarNotificacionBienvenidaResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>AgregarNotificacionBienvenidaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
