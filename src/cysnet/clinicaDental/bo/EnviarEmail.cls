Class cysnet.clinicaDental.bo.EnviarEmail Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.EMail.OutboundAdapter";

Property Adapter As EnsLib.EMail.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method enviarEmail(pRequest As cysnet.clinicaDental.msg.EnviarEmailRequest, pResponse As cysnet.clinicaDental.msg.EnviarEmailResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim msg As %Net.MailMessage
    set pResponse = ##class(cysnet.clinicaDental.msg.EnviarEmailResponse).%New()
    set pResponse.exito = 1
    try {
        set msg = ##class(%Net.MailMessage).%New()
        set msg.Subject = pRequest.asunto
        set sc = msg.TextData.WriteLine(pRequest.mensaje)
        if ($$$ISOK(sc)) {
            set sc = ..Adapter.SendMail(msg)
        }
    } catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.error = $System.Status.GetErrorText(sc)
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.msg.EnviarEmailRequest">
        <Method>enviarEmail</Method>
    </MapItem>
</MapItems>
}

}
