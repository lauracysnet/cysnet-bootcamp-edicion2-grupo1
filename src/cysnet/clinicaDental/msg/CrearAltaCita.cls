Class cysnet.clinicaDental.msg.CrearAltaCita Extends Ens.Request
{

/// Description
Property idPaciente As %BigInt;

/// Description
Property descCita As %String;

/// Description
Property fechaCita As %TimeStamp;

/// Description
Property codEstado As %Integer;

Storage Default
{
<Data name="CrearAltaCitaDefaultData">
<Subscript>"CrearAltaCita"</Subscript>
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>descCita</Value>
</Value>
<Value name="3">
<Value>fechaCita</Value>
</Value>
<Value name="4">
<Value>codEstado</Value>
</Value>
</Data>
<DefaultData>CrearAltaCitaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
