Class cysnet.clinicaDental.data.Admisiones Extends (%Persistent, %Populate)
{

// Registro de admisiones de paciente. 

// Registra cuando un paciente entra en la Clínica para su cita y cuándo se va

// Identificador de la cita

Property idCita As %Integer;

// Fecha/hora en la que el paciente entra a la Clínica para su cita

Property fechaAdmision As %TimeStamp;

// Indicador de si los datos de la admisión se han enviado

Property indEnviada As %Boolean;

Storage Default
{
<Data name="AdmisionesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idCita</Value>
</Value>
<Value name="3">
<Value>fechaAdmision</Value>
</Value>
<Value name="4">
<Value>indEnviada</Value>
</Value>
</Data>
<DataLocation>^cysnet.clinicaDBD9C.AdmisionesD</DataLocation>
<DefaultData>AdmisionesDefaultData</DefaultData>
<IdLocation>^cysnet.clinicaDBD9C.AdmisionesD</IdLocation>
<IndexLocation>^cysnet.clinicaDBD9C.AdmisionesI</IndexLocation>
<StreamLocation>^cysnet.clinicaDBD9C.AdmisionesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
