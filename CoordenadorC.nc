
module Coordinator(){

	uses{
 		interface Boot;
 		interface Packet;
 		interface AMSend;
 		interface Receive;
 		interface SplitControl as AMControl;
 		interface Timer<TMilli> as Timer0;
		
		interface compSensor as WSN_ComponentsSensor;
		interface compCH as WSN_ComponentsCH;
		interface compCM as WSN_ComponentsCM;
 		interface compLibMSG as ComponentsLibMessage;
 	}
 
} implementation{

	uint16_t controlState;
	message_t pkt;
	
	const p = 0.2;	
	const tCluster = 25;
	const tExit = 0.1;	

	double RSS;
	uint16_t myCH;	
	uint16_t myID  = compSensor->getSensorId();
	map <uint16_t, double>  knownCHs;	
	list<uint16_t>  sensorList;
	
	void state_Select_CH(){
		controlState = 1;
		
		if( compCH->selectCH( myID, p)){
			sendBroadcast(CH_ANNOUNCE, compLibMSG->GetNextMsgId(), myID);
			compSensor->role = CH;
		} else {
			compSensor->role = CM;		
		}
		state_Join_Cluster();
	}

	void state_JoinCluster(){
		controlState = 2;
		call Timer0.startOneShot(tCluster);		
	}

	void state_Cluster_Formation(){
		controlState = 3;
		if(compSensor->role = CM){
			myCH = compCM->joinCluster(knownCHs);
			sensorListe.insert(myCH);
			send(AK_CH_ANNOUNCE, compLibMSG->GetNextId(), sensorList, myID);
			exit();		
		} else {
			state_Sotre_Members();
		}	
	}
	
	void state_StoreMembers(){
		controlState = 4;
		call Timer0.startOneShot(tExit);		
	}

 /* ======== Começam aqui os eventos do nesC ======== */

	event void Boot.booted() {
 		call AMControl.start(); 	// initialize Radio
		state_INI();
	}

	event void AMControl.startDone(error_t err){
		if(err == SUCCESS){
			printf("APPL: started");
		} else {
			printf("APPL start error");
		}
	}

	void sendBroadcast(uint_16 typeMsg, uint_16 idMsg, uint_16 myId) {
	 	GenericMsg* btrpkt = (GenericMsg*)(call Packet.getPayload(&pkt, sizeof(GenericMsg)));
	 	btrpkt->msgType = TtypeMsg; 
	 	btrpkt->msgId = idMsg;
	 	btrpkt->sensorId = myId;
	 	call AMSend.send(AM_BROADCAST_ADDR, &pkt, sizeof(GenericMsg));
	}

 	void sendMsg(uint_16 TtypeMsg, uint_16 idMsg, list<uint_16> sensorAnnouncements, uint_16 myId) {
	 	GenericMsg* btrpkt = (GenericMsg*)(call Packet.getPayload(&pkt, sizeof(GenericMsg)));
	 	btrpkt->msgType = TtypeMsg; 
	 	btrpkt->msgId = idMsg;
	 	btrpkt->sensorId = myId;

		 while(sensorAnnouncements.next()){
	 		call AMSend.send(sensorAnnouncements.next(), &pkt, sizeof(GenericMsg));
		}
	}

	//timer fired
	event void Timer0.fired(){
		if(controlState == 2){
			state_Cluster_Formation();
		}
		if(controlState == 4){
			exit();
		}
	}

	//event to receive messages 
	event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
		if(controlState == 2){
			RSS = compSensor->getRSS(ID);
			knownCHs.insert(ID, RSS);
		}
		if(controlState == 3){	
			listSensorAnnouncements.insert(ID);
		}
		if(controlState == 4){
			for(destListID.next()){
				uint_16 v = listSensorAnnouncements.next();
				if( v == myID ){
					compCH->members.insert(fromID);
				}
			}
		}
		return msg;
	}

event void AMControl.stopDone(error_t err) {	}

event void AMSend.sendDone(message_t* msg, error_t err) {	}

event void AMControl.startDone(error_t err) {	}
}
