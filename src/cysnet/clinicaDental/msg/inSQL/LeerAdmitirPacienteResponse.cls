Class cysnet.clinicaDental.msg.inSQL.LeerAdmitirPacienteResponse Extends Ens.Response
{

Property mensaje As %String(MAXLEN = "");

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="LeerAdmitirPacienteResponseDefaultData">
<Subscript>"LeerAdmitirPacienteResponse"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
<Value name="2">
<Value>exito</Value>
</Value>
<Value name="3">
<Value>error</Value>
</Value>
</Data>
<DefaultData>LeerAdmitirPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
