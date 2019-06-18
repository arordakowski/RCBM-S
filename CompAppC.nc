
configuration CompAppC {
}
implementation {
	//GENERAL
  components MainC;
	components CompC as App;
	App -> MainC.Boot;
  
	//LIBRARY_AGREGGATION
	components Library_AgreggationC;
	App -> Library_AgreggationC.Library_Agreggation;

	//SENSOR
	components SensorC;
	App -> SensorC.Sensor;

	//CH_ELECTION
	components CH_ElectionC;
	App -> CH_ElectionC.CH_Election;

	//CLUSTER_FORMATION
	components Cluster_FormationC;
	App -> Cluster_FormationC.Cluster_Formation;
	
}
