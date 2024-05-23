Class cysnet.clinicaDental.agenda.bp.InfoNuevaCitaSIU12 Extends Ens.DataTransformDTL [ DependsOn = (cysnet.clinicaDental.msg.CrearAltaCitaRequest, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='cysnet.clinicaDental.msg.CrearAltaCitaRequest' targetClass='EnsLib.HL7.Message' targetDocType='2.5:SIU_S12' create='new' language='objectscript' >
<assign value='"BOOTCAMP"' property='target.{MSH:SendingApplication}' action='set' />
<assign value='"IRIS"' property='target.{MSH:SendingFacility}' action='set' />
<assign value='"CLINICADENTAL"' property='target.{MSH:ReceivingApplication}' action='set' />
<assign value='"SIU"' property='target.{MSH:MessageType.MessageCode}' action='set' />
<assign value='source.idPaciente' property='target.{PIDgrp(1).PID:PatientID.IDNumber}' action='set' />
<assign value='source.descCita' property='target.{SCH:AppointmentReason.Text}' action='set' />
<assign value='source.fechaCita' property='target.{SCH:AppointmentTimingQuantity(1).StartDateTime}' action='set' />
</transform>
}

}
