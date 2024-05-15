Class cysnet.clinicaDental.msg.ModificarPacienteRequest Extends Ens.Request
{

Property nombre As %String;

Property apellidos As %String;

Property NuevoEmail As %String;

Property emailAcutal As %String;

Property permiteNotificaciones As %Boolean;

Property conservarCorreo As %Boolean;

Storage Default
{
<Data name="ModificarPacienteRquestDefaultData">
<Subscript>"ModificarPacienteRquest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellidos</Value>
</Value>
<Value name="3">
<Value>NuevoEmail</Value>
</Value>
<Value name="4">
<Value>emailAcutal</Value>
</Value>
<Value name="5">
<Value>permiteNotificaciones</Value>
</Value>
<Value name="6">
<Value>conservarCorreo</Value>
</Value>
</Data>
<DefaultData>ModificarPacienteRquestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
