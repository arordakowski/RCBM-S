
configuration SensorAppC
{
  provides interface Sensor;
}
implementation
{
  components SensorC;
  
  Sensor = SensorC;
}
