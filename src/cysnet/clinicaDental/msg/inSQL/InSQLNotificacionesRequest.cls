Class cysnet.clinicaDental.msg.inSQL.InSQLNotificacionesRequest Extends Ens.Request
{

Property idNotificacion As %Integer;

Property idPaciente As %Integer;

Property asunto As %String(MAXLEN = 300);

Property mensaje As %String(MAXLEN = 300);

Storage Default
{
<Data name="InSQLNotificacionesRequestDefaultData">
<Subscript>"InSQLNotificacionesRequest"</Subscript>
<Value name="1">
<Value>idNotificacion</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="4">
<Value>mensaje</Value>
</Value>
<Value name="5">
<Value>asunto</Value>
</Value>
</Data>
<DefaultData>InSQLNotificacionesRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
