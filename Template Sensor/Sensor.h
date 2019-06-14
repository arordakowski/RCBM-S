#include <stdio.h>

class Sensor {
public:
	template <typename K, typename V>
		void setNeighborReadings (map<K,V>);

	template <typename K, typename V>
		map<K,V> getNeighborReadings();

	
	template <typename K, typename V>
		map<K,V> getCandidateCHs();
}
