Class cysnet.clinicaDental.data.Altas Extends (%Persistent, %Populate)
{

// Registro de altas de paciente. Registra cuando un paciente se va de la Clínica

// Identificador de la cita

Property idCita As %Integer;

// Fecha/hora en la que el paciente se va de la Clínica (cuando ha terminado su cita)

Property fechaAltas As %TimeStamp;

// Indicador de si los datos del alta se han enviado

Property indEnviada As %Boolean;

Storage Default
{
<Data name="AltasDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idCita</Value>
</Value>
<Value name="3">
<Value>fechaAltas</Value>
</Value>
<Value name="4">
<Value>indEnviada</Value>
</Value>
</Data>
<DataLocation>^cysnet.clinicaDentalBD9C.AltasD</DataLocation>
<DefaultData>AltasDefaultData</DefaultData>
<IdLocation>^cysnet.clinicaDentalBD9C.AltasD</IdLocation>
<IndexLocation>^cysnet.clinicaDentalBD9C.AltasI</IndexLocation>
<StreamLocation>^cysnet.clinicaDentalBD9C.AltasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
