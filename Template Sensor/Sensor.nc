
interface Sensor {
	command setNeighborReadings(map<K, V>);
	command getNeighborReadings(map<K, V>);
	command getCandidateCHs(map<K, V>);
}
