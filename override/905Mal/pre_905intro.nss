float Deg(float fRad = 0.0){
	float fDeg = (fRad * 180.0 / 3.1415926535897932384626433832795);
	return fDeg;
}

void BecomeVisas(){

if(GetIsObjectValid(GetObjectByTag("Mira")) ){

	SwitchPlayerCharacter(7);
}

else if(GetIsObjectValid(GetObjectByTag("Hanharr")) ){

	SwitchPlayerCharacter(10);
}

else if(GetIsObjectValid(GetObjectByTag("VisasMarr")) ){

	SwitchPlayerCharacter(9);
}

else if(GetIsObjectValid(GetObjectByTag("Handmaiden")) ){

	SwitchPlayerCharacter(4);
}

else if(GetIsObjectValid(GetObjectByTag("Disciple")) ){

	SwitchPlayerCharacter(11);
}



}


void BecomeAtton(){

	SwitchPlayerCharacter(0);

}

void AttvDisciple(){
	AssignCommand(GetObjectByTag("Disciple"), ActionJumpToObject(GetObjectByTag("sp_cage_cell")));
	SpawnAvailableNPC(0, GetLocation(GetObjectByTag("wp_vsa_1")));
	object oS = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905vs", GetLocation(GetObjectByTag("sp_cage_cell")));
}


void HandvVisas(){
	AssignCommand(GetObjectByTag("VisasMarr"), ActionJumpToObject(GetObjectByTag("sp_cage_cell")));
	object oS = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905vs", GetLocation(GetObjectByTag("sp_cage_cell")));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("Handmaiden"), ActionJumpToObject(GetObjectByTag("wp_vsa_1"))));
}

void main(){

int param1 = GetScriptParameter(1);
object oPLC;



	switch(param1){

		case 0:

			SpawnAvailableNPC(4, GetLocation(GetObjectByTag("sp_cage_hand")));

		break;
		case 1:
			//SpawnAvailableNPC(11, GetLocation(GetObjectByTag("sp_cage_hand")));
			if(GetGlobalNumber("000_JoinKreia") == 2){
				CreateObject(1, "p_disciple", GetLocation(GetObjectByTag("sp_cage_cell", 0)), 0);
				oPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905vs", GetLocation(GetObjectByTag("sp_cage_cell")));
			}
			else{
				CreateObject(1, "p_disciple", GetLocation(GetObjectByTag("sp_cage_hand", 0)), 0);			
			}	
		break;
		case 2:
			SpawnAvailableNPC(7, GetLocation(GetObjectByTag("sp_cage_mira")));
		break;
		case 3:
			CreateObject(1, "p_hanharr", GetLocation(GetObjectByTag("sp_cage_mira", 0)), 0);
		break;
		case 4:
			if(GetGlobalNumber("000_JoinKreia") == 1){
				SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_cage_cell")));
				oPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905vs", GetLocation(GetObjectByTag("sp_cage_cell")));
			}
			else{
				SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_cage_visas")));	
			}
		break;
		case 5:
			SetGlobalNumber("000_JoinKreia", 1);
			//SpawnAvailableNPC(4, GetLocation(GetObjectByTag("wp_vsa_1")));
			CreateObject(1, "c_vshandmaiden", GetLocation(GetObjectByTag("wp_vsa_2")));

		break;
		case 6:
			SetGlobalNumber("000_JoinKreia", 2);
			//SpawnAvailableNPC(0, GetLocation(GetObjectByTag("wp_vsa_1")));
			CreateObject(1, "c_vsatton", GetLocation(GetObjectByTag("wp_vsa_2")));
		break;
		case 7:
	object oBoss = CreateObject(OBJECT_TYPE_CREATURE, "g_intro_sl", GetLocation(GetObjectByTag("sp_intro_sl")));
	object o905Intro = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905intro", GetLocation(GetObjectByTag("sp_intro_sl")));
			AssignCommand(GetFirstPC(), ActionStartConversation(GetFirstPC(), "905intro", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

		break;
		case 8:

			AssignCommand(GetFirstPC(), ActionStartConversation(GetFirstPC(), "905vs", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

		break;


	}



}