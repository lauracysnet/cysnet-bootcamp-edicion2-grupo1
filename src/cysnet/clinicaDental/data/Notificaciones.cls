Class cysnet.clinicaDental.data.Notificaciones Extends %Persistent
{

/// id del paciente
Property idPaciente As %Integer;

/// asunto de la notificación
Property asunto As %String;

/// mensaje descriptor
Property mensaje As %String;

/// id de enviado
Property indEnviado As %Integer;

Storage Default
{
<Data name="NotificacionesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="3">
<Value>asunto</Value>
</Value>
<Value name="4">
<Value>mensaje</Value>
</Value>
<Value name="5">
<Value>indEnviado</Value>
</Value>
</Data>
<DataLocation>^cysnet.clinBD9C.NotificacionesD</DataLocation>
<DefaultData>NotificacionesDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^cysnet.clinBD9C.NotificacionesD</IdLocation>
<IndexLocation>^cysnet.clinBD9C.NotificacionesI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="asunto">
<AverageFieldSize>6</AverageFieldSize>
<OutlierSelectivity>.999999:"test"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="idPaciente">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="indEnviado">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:0</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="mensaje">
<AverageFieldSize>6</AverageFieldSize>
<OutlierSelectivity>.999999:"test"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.clinBD9C.NotificacionesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
