
object o901wprem = GetWaypointByTag("from_901_rem");

void makeHK(){
if(IsAvailableCreature(5)){
	SetNPCSelectability(5,1);
	SpawnAvailableNPC(5, GetLocation(GetObjectByTag("sp_hk47")));
}
}

void BecomeHK(){

	SwitchPlayerCharacter(5);

}

void Remo(location lLoc){
	if(!GetIsObjectValid(GetObjectByTag("Remote"))){
		object oRemote = SpawnAvailableNPC(1, lLoc);
	}
	SetLockOrientationInDialog(GetObjectByTag("Remote"), TRUE);
	object oFakeBaoDur = CreateObject(OBJECT_TYPE_PLACEABLE, "p_baodur002", GetLocation(GetObjectByTag("wp_baodur_end")), 0);
	object oP_baodur001 = CreateObject(1, "p_baodur001", GetLocation(GetWaypointByTag("sp_goto")), 0);
	DelayCommand(0.8, AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetObjectByTag("HK47"),  "sensorfi", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}

void RemoParty() {
	if ((GetGlobalNumber("901MAL_REMOTE") == 1) && !GetIsObjectValid(GetObjectByTag("Remote"))) {
		SetNPCSelectability(1,TRUE);
		object object1 = SpawnAvailableNPC(1, GetLocation(GetObjectByTag("From_901mal", 0)));
		//SendMessageToPC(GetFirstPC(), "Remote is in party");
	}
		AddPartyMember(1, GetObjectByTag("Remote"));
		SetNPCSelectability(1,TRUE);
}

void BecomePC(){

	SwitchPlayerCharacter(-1);
}

void VisMan() {
	object oPC = GetFirstPC();
	SetNPCSelectability(NPC_CANDEROUS, 1);
	SetNPCSelectability(NPC_VISAS, 1);
	object oMand = SpawnAvailableNPC(NPC_CANDEROUS, GetLocation(GetObjectByTag("sp_mand")));
	object oVisas = SpawnAvailableNPC(NPC_VISAS, GetLocation(GetObjectByTag("sp_visas")));
	SetLockOrientationInDialog(oMand, 1);
	SetLockOrientationInDialog(oVisas, 1);
	AssignCommand(oMand, ActionStartConversation(oVisas, "902visman"));
}

void BecomeAtton(){

	SwitchPlayerCharacter(0);

}

void AttonPart(){
	
		AddPartyMember(4, GetObjectByTag("Handmaiden") );

		object o902boss = GetObjectByTag("902boss", 0);

		if (GetIsObjectValid(o902boss)) {
			AssignCommand(o902boss, ActionStartConversation(GetFirstPC(), "902boss", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
		}
		else {
			AurPostString("k902boss: INVIS BOSS PLACEABLE MISSING!", 5, 5, 5.0);
		}


}

void BecomeMira(){

	SwitchPlayerCharacter(7);

}
void MiraPart() {
	DelayCommand(0.2, AssignCommand(GetPartyLeader(), ClearAllActions()));
	DelayCommand(0.2, AssignCommand(GetPartyLeader(), ActionJumpToObject(GetWaypointByTag("sp_mira"), 1)));
	object oHanharr = CreateObject(1, "p_hanharr002", GetLocation(GetWaypointByTag("sp_hanharr")), 0);
	DelayCommand(0.3, AssignCommand(GetObjectByTag("Mira"), ActionStartConversation(oHanharr, "902mira", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}


void main() {

	if (GetLoadFromSaveGame()) {
		return;
	}
//Run Visas and Mandalore scene
	if(GetGlobalNumber("902MAL_Cutscene") == 1){
			HoldWorldFadeInForDialog();
			VisMan();
	}
//Run Mira Scene
	if(GetGlobalNumber("902MAL_Cutscene") == 2){
		if(IsAvailableCreature(7)){
			SetGlobalNumber("902MAL_Cutscene", 0);
			HoldWorldFadeInForDialog();
			SetNPCSelectability(7,TRUE);
			RemovePartyMember(1);
			SetNPCSelectability(1,FALSE);
			object oMira = SpawnAvailableNPC(7, GetLocation(GetWaypointByTag("sp_mira")));
			DelayCommand(0.2, BecomeMira());
			DelayCommand(0.4, MiraPart());
		}
		else{

			SetGlobalNumber("902MAL_Cutscene", 0);
		}
	}
//Run outside Trayus fight scene
	if(GetGlobalNumber("902MAL_Cutscene") == 4){
			SetGlobalNumber("902MAL_Cutscene", 0);
			DelayCommand(0.2, BecomePC());
			DelayCommand(0.4, ExecuteScript("902scenic", GetModule()));
			DelayCommand(0.4, RemoParty());
	}
//Run the Robot scene
	if(GetGlobalNumber("902MAL_Cutscene") == 3){
			SetGlobalNumber("902MAL_Cutscene", 0);
			SetGlobalFadeOut(0.0, 0.0);
			SetFadeUntilScript();
			makeHK();
			DelayCommand(0.4, BecomeHK());
			DelayCommand(0.6, Remo(GetLocation(GetObjectByTag("wp_cons_rem"))));
	}

}







