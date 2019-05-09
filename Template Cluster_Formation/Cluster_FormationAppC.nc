
configuration Cluster_FormationAppC
{
  provides interface Cluster_Formation;
}
implementation
{
  components Cluster_FormationC;
  
  Cluster_Formation = Cluster_FormationC;
}
