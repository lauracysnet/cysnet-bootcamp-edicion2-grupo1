Class cysnet.clinicaDental.agenda.dtl.TransformacionAdmision Extends Ens.DataTransformDTL [ DependsOn = (cysnet.clinicaDental.msg.struct.MensajeADT01, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='cysnet.clinicaDental.msg.struct.MensajeADT01' targetClass='EnsLib.HL7.Message' targetDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='"BOOTCAMP"' property='target.{MSH:SendingApplication}' action='set' />
<assign value='"IRIS"' property='target.{MSH:SendingFacility}' action='set' />
<assign value='"CLINICADENTAL"' property='target.{MSH:ReceivingApplication}' action='set' />
<assign value='$Replace($Replace($ZDT($H,8)," ",""),":","")' property='target.{MSH:DateTimeOfMessage}' action='set' />
<assign value='"ADT"' property='target.{MSH:MessageType.MessageCode}' action='set' />
<assign value='"A01"' property='target.{MSH:MessageType.TriggerEvent}' action='set' />
<assign value='"P"' property='target.{MSH:ProcessingID}' action='set' />
<assign value='"2.5"' property='target.{MSH:VersionID}' action='set' />
<assign value='"A01"' property='target.{EVN:EventTypeCode}' action='set' />
<assign value='$Replace($Replace($ZDT($H,8)," ",""),":","")' property='target.{EVN:RecordedDateTime}' action='set' />
<assign value='"1"' property='target.{PID:SetIDPID}' action='set' />
<assign value='source.idPaciente' property='target.{PID:PatientIdentifierList(1).IDNumber}' action='set' />
<assign value='"ID"' property='target.{PID:PatientIdentifierList(1).IdentifierTypeCode}' action='set' />
<assign value='source.apellidos' property='target.{PID:PatientName(1).FamilyName}' action='set' />
<assign value='source.nombre' property='target.{PID:PatientName(1).GivenName}' action='set' />
<assign value='"1"' property='target.{PV1:SetIDPV1}' action='set' />
<assign value='source.idAdmision' property='target.{PV1:VisitNumber}' action='set' />
<assign value='$Replace($Replace($Replace(source.fechaAdmision,"-", ""), " ",""), ":", "")' property='target.{PV1:AdmitDateTime}' action='set' />
</transform>
}

}
