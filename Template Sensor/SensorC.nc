
module SensorC {
  provides interface Sensor;
}

implementation {
  command Sensor.setNeighborReadings(map<K,V>){
		uint16_t aux;
		return aux;	
	}

  command Sensor.getNeighborReadings(map<K,V>){
		uint16_t aux;
		return aux;	
	}

  command Sensor.getCandidateCHs(map<K,V>){
		uint16_t aux;
		return aux;	
	}

}

