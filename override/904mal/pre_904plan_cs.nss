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


void main(){

int param1 = GetScriptParameter(1);




	switch(param1){

		case 0:
			SpawnAvailableNPC(4, GetLocation(GetObjectByTag("sp_handisc_plan")));
			RemoveAvailableNPC(11);
		break;
		case 1:
			SpawnAvailableNPC(11, GetLocation(GetObjectByTag("sp_handisc_plan")));
			RemoveAvailableNPC(4);			
		break;
		case 2:

			SpawnAvailableNPC(7, GetLocation(GetObjectByTag("sp_mira_plan")));
			RemoveAvailableNPC(10);
		break;
		case 3:
			SpawnAvailableNPC(10, GetLocation(GetObjectByTag("sp_hanharr_plan")));
			RemoveAvailableNPC(7);

		break;
		case 4:
			SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_visas_plan")));
		break;
		case 5:
			DestroyObject(GetObjectByTag("Handmaiden"));
			RemoveAvailableNPC(4);
		break;
		case 6:
			RemoveAvailableNPC(0);
		break;
		case 7:
			SpawnAvailableNPC(0, GetLocation(GetObjectByTag("sp_atton_plan")));
			//CreateObject(1, "p_atton", GetLocation(GetObjectByTag("sp_atton_plan", 0)), 0);
		break;
		case 8:
			object oConvo = GetObjectByTag("904plancs");

			DelayCommand(0.2, BecomeVisas());

DelayCommand(0.4, AssignCommand(oConvo, ActionStartConversation(oConvo, "904plan", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));

		break;
		case 9:
			CreateObject(1, "p_hanharr003", GetLocation(GetObjectByTag("sp_hanharr_plan", 0)), 0);
		break;
		case 10:
			object oAtton = SpawnAvailableNPC(NPC_ATTON, GetLocation(GetObjectByTag("wp_avs_atton_1", 0)));
			object oSion = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion002", GetLocation(GetObjectByTag("wp_avs_sion_1", 0)));
			CreateObject(1, "g_sith_assassin", GetLocation(GetObjectByTag("wp_avs_sa_1", 0)), 0);
			CreateObject(1, "g_sith_assassin", GetLocation(GetObjectByTag("wp_avs_sa_2", 0)), 0);
			CreateObject(1, "g_sith_assassin", GetLocation(GetObjectByTag("wp_avs_sa_3", 0)), 0);
		break;
		case 11:
			object oAttsion = GetObjectByTag("904plancs");
			DelayCommand(0.2, BecomeAtton());
			DelayCommand(0.6, AssignCommand(oAttsion, ActionStartConversation(oAttsion, "attsion", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		break;
		case 12:
			RemoveAvailableNPC(9);
		break;
		case 13:
			DelayCommand(1.0, AssignCommand(GetObjectByTag("904Plancs"), ActionStartConversation(GetObjectByTag("904Plancs"), "904defeat", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		break;
		case 20:
			CreateObject(1, "p_hanharr", GetLocation(GetObjectByTag("sp_hanharr_plan", 0)), 0);
			CreateObject(1, "p_disciple", GetLocation(GetObjectByTag("sp_handisc_plan", 0)), 0);
		break;
		case 21:
			AddAvailableNPCByObject(NPC_HANHARR,GetObjectByTag("Hanharr"));
			AddAvailableNPCByObject(NPC_DISCIPLE,GetObjectByTag("Disciple"));
		break;
		case 22:
			DestroyObject(GetObjectByTag("Disciple"));
			DestroyObject(GetObjectByTag("Hanharr"));
		break;


	}



}