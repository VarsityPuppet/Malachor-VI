// Prototypes
void sub2();
void sub1();
void AttonSion(){

}

void StartAmbush(){
	object oAtton = SpawnAvailableNPC(0, GetLocation(GetObjectByTag("sp_atton_am")));
	object oHand = SpawnAvailableNPC(4, GetLocation(GetObjectByTag("sp_hand_am")));
	object oMira = SpawnAvailableNPC(7, GetLocation(GetObjectByTag("sp_mira_am")));
	object oMand = SpawnAvailableNPC(2, GetLocation(GetObjectByTag("sp_mand_am")));
	object oVisas = SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_visas_am")));
		DelayCommand(0.5, AssignCommand(oAtton, ActionStartConversation(GetFirstPC(), "903ambush", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}

void ExileArrive() {
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	AssignCommand(oDarthSion, ClearAllActions());
	AssignCommand(oDarthSion, ActionStartConversation(GetFirstPC(), "903kreia", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
}

void BecomePC() {
	SwitchPlayerCharacter((-1));
}

void main() {

	if (GetLoadFromSaveGame()) {
		return;
	}

	if ((GetEnteringObject() == GetFirstPC())) {
	
	//Fire the ambush scene
		if(GetLocalNumber(GetModule(), 20) == 0){
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("wp_party_am")));
			SetFadeUntilScript();
			//Start Ambush scene
			StartAmbush();

		}
	//Fire the Exile enters scene
		if(GetLocalNumber(GetModule(), 20) == 1){
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			BecomePC();//Start enter scene
			DelayCommand(0.2, ExileArrive() );
		}
	//Do nothing
		if(GetLocalNumber(GetModule(), 20) == 2){
			//Normal, do nothing except the normal stuff

		}

	}
}







