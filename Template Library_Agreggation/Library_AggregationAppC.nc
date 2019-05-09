
configuration Library_AggregationAppC
{
  provides interface Library_Aggregation;
}
implementation
{
  components Library_AggregationC;
  
  Library_Aggregation = Library_AggregationC;
}
