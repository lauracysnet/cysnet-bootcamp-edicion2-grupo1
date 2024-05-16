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
<ExtentSize>1</ExtentSize>
<IdLocation>^cysnet.clinicaDBD9C.AdmisionesD</IdLocation>
<IndexLocation>^cysnet.clinicaDBD9C.AdmisionesI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="fechaAdmision">
<AverageFieldSize>21</AverageFieldSize>
<OutlierSelectivity>.999999:"2024-05-15 08:00:00"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="idCita">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="indEnviada">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:0</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.clinicaDBD9C.AdmisionesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
