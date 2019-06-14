#include <stdio.h>

class Library_Aggregation {
public:
	template <typename K, typename V>
		map<K,V> MIN(map<K,V>);

	template <typename K, typename V>
		map<K,V> MAX(map<K,V>);

	template <typename K, typename V>
		V AVG(map<K,V>);

	template <typename K, typename V>
		V SUM(map<K,V>);
}
