Class cysnet.clinicaDental.msg.ConsulatCitaPorIdResponse Extends Ens.Response
{

Property idPaciente As %Integer;

Property DescCita As %String(MAXLEN = 300);

Property FechaCita As %TimeStamp;

Property codEstado As %Integer;

Storage Default
{
<Data name="ConsulatCitaPorIdResponseDefaultData">
<Subscript>"ConsulatCitaPorIdResponse"</Subscript>
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>DescCita</Value>
</Value>
<Value name="3">
<Value>FechaCita</Value>
</Value>
<Value name="4">
<Value>codEstado</Value>
</Value>
</Data>
<DefaultData>ConsulatCitaPorIdResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
