
module Library_AggregationC {
  provides interface Library_Aggregation;
}

implementation {
  command Library_Aggregation.MAX(map<K,V>){
		uint16_t aux;
		return aux;	
	}

  command Library_Aggregation.MIN(map<K,V>){
		uint16_t aux;
		return aux;	
	}

  command Library_Aggregation.AVG(map<K,V>){
		uint16_t aux;
		return aux;	
	}

  command Library_Aggregation.SUM(map<K,V>){
		uint16_t aux;
		return aux;	
	}
}

