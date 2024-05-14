Class cysnet.clinicaDental.data.Citas Extends %Persistent
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
<Data name="CitasDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="3">
<Value>descCita</Value>
</Value>
<Value name="4">
<Value>fechaCita</Value>
</Value>
<Value name="5">
<Value>codEstado</Value>
</Value>
</Data>
<DataLocation>^cysnet.clinicaDentalBD9C.CitasD</DataLocation>
<DefaultData>CitasDefaultData</DefaultData>
<IdLocation>^cysnet.clinicaDentalBD9C.CitasD</IdLocation>
<IndexLocation>^cysnet.clinicaDentalBD9C.CitasI</IndexLocation>
<StreamLocation>^cysnet.clinicaDentalBD9C.CitasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
