Class cysnet.clinicaDental.data.Altas Extends (%Persistent, %Populate)
{
    // Registro de altas de paciente. Registra cuando un paciente se va de la Clínica

    // Identificador de la cita
    Property idCita As %Integer;

    // Fecha/hora en la que el paciente se va de la Clínica (cuando ha terminado su cita)
    Property fechaAltas As %TimeStamp;

    // Indicador de si los datos del alta se han enviado
    Property indEnviada As %Boolean;
}