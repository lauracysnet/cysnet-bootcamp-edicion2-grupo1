Class cysnet.clinicaDental.ClinicaDentalProd Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cysnet.clinicaDental.ClinicaDentalProd" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="GestionCitas" Category="" ClassName="cysnet.clinicaDental.agenda.ws.GestionCitas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">1982</Setting>
  </Item>
  <Item Name="GestionPacientes" Category="" ClassName="cysnet.clinicaDental.agenda.ws.GestionPacientes" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">1981</Setting>
  </Item>
  <Item Name="AdmisionesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.AdmisionesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
  </Item>
  <Item Name="AltasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.AltasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
  </Item>
  <Item Name="CitasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.CitasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="PacientesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.PacientesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="NotificacionesSQL" Category="" ClassName="cysnet.clinicaDental.notificaciones.bo.NotificacionesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoPacientes" Category="" ClassName="cysnet.clinicaDental.bp.ProcesoPacientes" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">/shared/mysql/mysql-connector-java-5.1.49.jar</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/temurin-8-jdk-amd64</Setting>
  </Item>
  <Item Name="InSQLAdmisiones" Category="" ClassName="cysnet.clinicaDental.agenda.bo.bs.InSQLAdmisiones" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE ClinicaDental.Admision SET IndEnviada = 1 WHERE IdAdmision = ?</Setting>
    <Setting Target="Adapter" Name="Query">SELECT IdAdmision, IdCita, FechaAdmision  FROM ClinicaDental.Admision WHERE IndEnviada = 0 ORDER BY IdAdmision</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">IdAdmision</Setting>
  </Item>
  <Item Name="OutFileHL7" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/shared/HL7/salida-HL7/</Setting>
  </Item>
  <Item Name="ProcesoCitas" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoCitas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InSQLAltas" Category="" ClassName="cysnet.clinicaDental.agenda.bo.bs.InSQLAltas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">MySQL</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE ClinicaDental.Alta 
SET IndEnviada = 1 
WHERE IdAlta= ?</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">IdAlta</Setting>
    <Setting Target="Adapter" Name="Query">SELECT *
FROM ClinicaDental.Alta 
WHERE IndEnviada = 0 
ORDER BY IdAlta</Setting>
  </Item>
</Production>
}

}
