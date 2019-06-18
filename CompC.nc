
module CompC @safe(){
	
	uses{

	//GERAL
  	interface Boot;

	//LIBRARY_AGGREGGATION
	interface Library_Agreggation;

	//SENSOR
	interface Sensor;

	//CH_ELECTION
	interface CH_Election;

	//CLUSTER_FORMATION
	interface Cluster_Formation;

	}
}
implementation {

	event void Boot.booted() {
		
		//Library_Agregation
		call Library_Aggregation.MAX(map<K<V>);
		call Library_Aggregation.MIN(map<K<V>);
		call Library_Aggregation.AVG(map<K<V>);
		call Library_Aggregation.SUM(map<K<V>);
  
		//Sensor
		call Sensor.setNeighborReadings(map<K<V>);
		call Sensor.getNeighborReadings(map<K<V>);
		call Sensor.getCandidateCHs(map<K<V>);

		//CH_Election
		call CH_Election.selectCH(map<K<V>);

		//Cluster_Formation
		call Cluster_Formation.join(map<K<V>);
		
	}
}
