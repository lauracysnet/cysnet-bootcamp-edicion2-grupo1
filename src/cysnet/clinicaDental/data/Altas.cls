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
<ExtentSize>1</ExtentSize>
<IdLocation>^cysnet.clinicaDentalBD9C.AltasD</IdLocation>
<IndexLocation>^cysnet.clinicaDentalBD9C.AltasI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="fechaAltas">
<AverageFieldSize>21</AverageFieldSize>
<OutlierSelectivity>.999999:"2024-05-16 09:00:00"</OutlierSelectivity>
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
<StreamLocation>^cysnet.clinicaDentalBD9C.AltasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
