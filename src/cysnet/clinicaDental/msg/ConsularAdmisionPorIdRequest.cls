Class cysnet.clinicaDental.msg.ConsularAdmisionPorIdRequest Extends Ens.Request
{

/// Description
Property idCita As %Integer;

Storage Default
{
<Data name="ConsularAdmisionPorIdRequestDefaultData">
<Subscript>"ConsularAdmisionPorIdRequest"</Subscript>
<Value name="1">
<Value>idAdmision</Value>
</Value>
<Value name="2">
<Value>idCita</Value>
</Value>
</Data>
<DefaultData>ConsularAdmisionPorIdRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
