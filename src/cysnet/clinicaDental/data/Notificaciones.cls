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
<IdLocation>^cysnet.clinBD9C.NotificacionesD</IdLocation>
<IndexLocation>^cysnet.clinBD9C.NotificacionesI</IndexLocation>
<StreamLocation>^cysnet.clinBD9C.NotificacionesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
