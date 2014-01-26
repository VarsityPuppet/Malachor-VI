
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

	object oRemote = SpawnAvailableNPC(1, lLoc);
	SetLockOrientationInDialog(oRemote, TRUE);
	object oFakeBaoDur = CreateObject(OBJECT_TYPE_PLACEABLE, "p_baodur002", GetLocation(GetObjectByTag("wp_baodur_end")), 0);
	object oP_baodur001 = CreateObject(1, "p_baodur001", GetLocation(GetWaypointByTag("sp_goto")), 0);
	DelayCommand(0.8, AssignCommand(oFakeBaoDur, ActionStartConversation(GetObjectByTag("HK47"),  "sensorfi", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
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


void main() {


		location lRem = GetLocation(GetObjectByTag("Remote"));

		if (GetGlobalBoolean("MAL_TURNINTO_REMOTE")){ //If player is playing as Remote's solo mision
			SetGlobalNumber("902MAL_Cutscene", 0);
			SetGlobalFadeOut(0.0, 0.0);
			SetFadeUntilScript();
			makeHK();
			DelayCommand(0.4, BecomeHK());
			DelayCommand(0.6, Remo(GetLocation(GetObjectByTag("wp_cons_rem"))));

		}
		else{ //Remote is with the Exile
			AssignCommand(GetObjectByTag("Remote"), ActionStartConversation(GetFirstPC() , "sensormid", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			object oPortcullis1 = GetObjectByTag("Portcullis2", 0);
			DelayCommand(0.5, SetLocked(oPortcullis1, 0));
			DelayCommand(2.0, AssignCommand(oPortcullis1, ActionOpenDoor(oPortcullis1))); 		}
			
}



