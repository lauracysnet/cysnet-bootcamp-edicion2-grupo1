Class cysnet.clinicaDental.msg.inSQL.InSQLNotificacionesResponse Extends Ens.Response
{

Property exito As %Boolean;

Property mensaje As %String;

Storage Default
{
<Data name="InSQLNotificacionesResponseDefaultData">
<Subscript>"InSQLNotificacionesResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>InSQLNotificacionesResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
