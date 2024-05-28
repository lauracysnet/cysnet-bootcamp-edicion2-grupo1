Class cysnet.clinicaDental.msg.ConsularAdmisionPorIdResponse Extends Ens.Response
{

Property idAdmision As %Integer;

Property idCita As %Integer;

Property fechaAdmision As %TimeStamp;

Storage Default
{
<Data name="ConsularAdmisionPorIdResponseDefaultData">
<Subscript>"ConsularAdmisionPorIdResponse"</Subscript>
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
<Value name="5">
<Value>idAdmision</Value>
</Value>
<Value name="6">
<Value>idCita</Value>
</Value>
<Value name="7">
<Value>fechaAdmision</Value>
</Value>
</Data>
<DefaultData>ConsularAdmisionPorIdResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
