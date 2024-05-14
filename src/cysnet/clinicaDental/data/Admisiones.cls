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

}