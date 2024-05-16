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
<ExtentSize>2</ExtentSize>
<IdLocation>^cysnet.clinicaDentalBD9C.CitasD</IdLocation>
<IndexLocation>^cysnet.clinicaDentalBD9C.CitasI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="codEstado">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="descCita">
<AverageFieldSize>28</AverageFieldSize>
<OutlierSelectivity>.999999:"Nueva consulta odontología"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="fechaCita">
<AverageFieldSize>21</AverageFieldSize>
<OutlierSelectivity>.999999:"2024-03-31 23:59:59"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="idPaciente">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.clinicaDentalBD9C.CitasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
