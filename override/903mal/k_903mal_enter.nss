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
	object oDarthSion = GetObjectByTag("Kreia_Voice", 0);
	object oDarthSion2 = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion001", GetLocation(GetObjectByTag("sp_sion_exile")));
	AssignCommand(oDarthSion, ClearAllActions());
	AssignCommand(oDarthSion, ActionStartConversation(GetFirstPC(), "903kreia", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
}

void BecomePC() {
	SwitchPlayerCharacter(-1);
}

void CleanSpace(){

DestroyObject(GetObjectByTag("Atton"));
DestroyObject(GetObjectByTag("Handmaiden"));
DestroyObject(GetObjectByTag("Mira"));
DestroyObject(GetObjectByTag("VisasMarr"));
DestroyObject(GetObjectByTag("Mand"));
DestroyObject(GetObjectByTag("Disciple"));


int Sithnum = 0;


while(Sithnum <=8){

object Sith1 = GetObjectByTag("SithAmbush", Sithnum);
object Sith2 = GetObjectByTag("SithFight" + IntToString(Sithnum), 0);

AssignCommand(Sith1, SetIsDestroyable(TRUE, FALSE, FALSE));
AssignCommand(Sith2, SetIsDestroyable(TRUE, FALSE, FALSE));

ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), Sith1 );
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), Sith2 );
(Sithnum++);
}

}

void main() {

	if (GetLoadFromSaveGame()) {
		return;
	}

	if ((GetEnteringObject() == GetFirstPC())) {
	
	int i903Scene = GetGlobalNumber("903MAL_Cutscene");

	switch(i903Scene){

		//Fire the ambush scene
		case 0:

			SetGlobalNumber("903MAL_Cutscene",1);
			//SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("wp_party_am")));
			//SetFadeUntilScript();
			//Start Ambush scene
			StartAmbush();

		break;
		case 1:

		//Fire the Exile enters scene
			SetGlobalNumber("903MAL_Cutscene",2);
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			CleanSpace();
			DelayCommand(0.2, BecomePC());//Start enter scene
			DelayCommand(0.4, ExileArrive() );
		//break;


	}

/*//This segment of code following is for Exile Enter Trayus TESTING only. Comment in final result

			SetGlobalNumber("903MAL_Cutscene",2);
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			CleanSpace();
			DelayCommand(0.2, BecomePC());//Start enter scene
			DelayCommand(0.4, ExileArrive() );*/

}
}







