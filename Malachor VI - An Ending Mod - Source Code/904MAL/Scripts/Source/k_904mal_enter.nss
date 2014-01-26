float Deg(float fRad = 0.0){
	float fDeg = (fRad * 180.0 / 3.1415926535897932384626433832795);
	return fDeg;
}

void Run904Plan(){
	object oSion = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion", Location(Vector(2.09315, 1.80278, 2.25750), Deg(-2.41027)));
	object oKreia = CreateObject(1, "p_kreiaparty", GetLocation(GetObjectByTag("sp_kreia", 0)), 0);
	object oConvo = CreateObject(OBJECT_TYPE_PLACEABLE, "p_904plan", GetLocation(GetObjectByTag("sp_kreia", 0)), 0);

	SetGlobalNumber("907MAL_CUTSCENE", 5);
	AssignCommand(oConvo, ActionStartConversation(oConvo, "pre904plan", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	SetLockOrientationInDialog(oKreia, 1);
	AssignCommand(oKreia, SetFacing(90.0));
	AssignCommand(oKreia, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
}

void SpawnParty(){

	SetNPCSelectability(9, 1);

	SetNPCSelectability(4, 1);

	SetNPCSelectability(7, 1);

	SetNPCSelectability(0, 1);



	object oAtton = SpawnAvailableNPC(0, Location(Vector(-1.06933, -85.48196, 0.79600), -90.0));
	//object oAtton = CreateObject(1, "p_atton", GetLocation(GetObjectByTag("sp_atton_plan", 0)), 0);

	object oHand = SpawnAvailableNPC(4, Location(Vector(1.83571, -85.09681, 0.79600), -90.0));
	//SpawnAvailableNPC(11, Location(Vector(1.83571, -85.09681, 0.79600), -90.0));

	object oMira = SpawnAvailableNPC(7, Location(Vector(0.22363, -85.33105, 0.79600), -90.0));
	object oVisas = SpawnAvailableNPC(9, Location(Vector(3.32801, -84.84205, 0.79600), -90.0));


	//object oHanharr = CreateObject(1, "p_hanharr003", GetLocation(GetObjectByTag("sp_hanharr_plan", 0)), 0);
			//SpawnAvailableNPC(10, GetLocation(GetObjectByTag("sp_hanharr_plan")));




//AssignCommand(GetObjectByTag("Atton"), ActionUnequipItem( GetItemInSlot(0, GetObjectByTag("Atton")), FALSE ));



}

void PlayDeadAgain(object oObject){

	int anim;
	string sTag = GetTag(oObject);
	object o904plancs = GetObjectByTag("904plancs");
	SetCommandable(TRUE, oObject);
	SetMinOneHP(oObject, FALSE);
	effect FPDamage = EffectDamageForcePoints(GetCurrentForcePoints(oObject));
	effect efDeath = EffectDeath(FALSE, FALSE, TRUE);
	AssignCommand(oObject, SetIsDestroyable(FALSE, TRUE, FALSE));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, FPDamage, oObject);

	if(sTag == "Mira"){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Hanharr"){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "VisasMarr"){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Disciple"){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Handmaiden"){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}



}

void FixMissingDead(){

	if(IsAvailableCreature(4) && !GetIsObjectValid(GetObjectByTag("Handmaiden")) ){

		object oHand = SpawnAvailableNPC(NPC_HANDMAIDEN, GetLocation(GetObjectByTag("wp_dead_hand", 0)));
		PlayDeadAgain(oHand);
	}

	if(IsAvailableCreature(11) && !GetIsObjectValid(GetObjectByTag("Disciple")) ){
		object oDisc = SpawnAvailableNPC(NPC_DISCIPLE, GetLocation(GetObjectByTag("wp_dead_hand", 0)));
		PlayDeadAgain(oDisc);
	}


	if(IsAvailableCreature(7) && !GetIsObjectValid(GetObjectByTag("Hanharr")) ){

		object oHanh = SpawnAvailableNPC(NPC_MIRA, GetLocation(GetObjectByTag("wp_dead_mira", 0)));
		PlayDeadAgain(oHanh);

	}

	if(IsAvailableCreature(10) && !GetIsObjectValid(GetObjectByTag("Mira")) ){
		object oMira = SpawnAvailableNPC(NPC_HANHARR, GetLocation(GetObjectByTag("wp_dead_mira", 0)));
		PlayDeadAgain(oMira);
	}

	if(IsAvailableCreature(9) && !GetIsObjectValid(GetObjectByTag("VisasMarr")) ){

		object oVisa = SpawnAvailableNPC(NPC_VISAS, GetLocation(GetObjectByTag("wp_dead_visas", 0)));
		PlayDeadAgain(oVisa);

	}


}

void AttSion(){

	SetGlobalNumber("907MAL_CUTSCENE", 5);
	object oAttsion = CreateObject(OBJECT_TYPE_PLACEABLE, "attsion_atton", GetLocation(GetObjectByTag("wp_avs_atton_4")));
	DelayCommand(0.4, AssignCommand(oAttsion, ActionStartConversation(oAttsion, "904attsion", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));

}


void SecondLeader(){

	if(IsAvailableCreature(7) && GetCurrentHitPoints(GetObjectByTag("Mira")) > 0){

		SwitchPlayerCharacter(7);
	}

	else if(IsAvailableCreature(10) && GetCurrentHitPoints(GetObjectByTag("Hanharr")) > 0){

		SwitchPlayerCharacter(10);
	}


}


void main() {

	if (GetLoadFromSaveGame()) {

		return;

	}

	object oEntering = GetEnteringObject();

	if ((oEntering == GetFirstPC()) ){

	int nGlobal = GetGlobalNumber("907MAL_CUTSCENE");

	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);

	SetFadeUntilScript();

	switch (nGlobal) {

	//The Dark Places of the Galaxy sequence.

		case 0:

			CreateObject(1, "p_kreia_evil001", GetLocation(GetObjectByTag("sp_kreia", 0)), 0);

			CreateObject(1, "n_darthnihilu001", GetLocation(GetObjectByTag("sp_nihilus", 0)), 0);

			CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("sp_sion1", 0)), 0);

			AssignCommand(GetObjectByTag("Kreia", 0), ActionStartConversation(oEntering, "kreiaend", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

		break;

	//Smuggler's Moon sequence.

		case 1:
	
		{

				object oN_darthsion = CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);

				object oC_hologrampc = CreateObject(1, "c_hologrampc", GetLocation(GetObjectByTag("wp_hologram", 0)), 0);

				CreateObject(1, "g_sithass002", GetLocation(GetObjectByTag("sp_sith1", 0)), 0);

				CreateObject(1, "g_sithass003", GetLocation(GetObjectByTag("sp_sith2", 0)), 0);

				int int4 = GetAppearanceType(GetEnteringObject());
				effect effect1 = EffectDisguise(int4);

				ApplyEffectToObject(2, effect1, oC_hologrampc, 0.0);

				AssignCommand(oN_darthsion, ActionStartConversation(oEntering, "sioncut1", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

			}

		break;

	//Kreia's arrival to Malachor

		case 2:

			{

				object oP_kreia_evil001 = CreateObject(1, "p_kreia_evil001", GetLocation(GetObjectByTag("sp_kreia2", 0)), 0);

				CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);

				AssignCommand(oP_kreia_evil001, ClearAllActions());

				AssignCommand(GetFirstPC(), ClearAllActions());

				AssignCommand(oP_kreia_evil001, ActionStartConversation(oEntering, "krecut1", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

			}

		break;

	//Exile's arrival to Malachor

		case 3:

			object oSionSpawn = GetObjectByTag("sp_sith2", 0);

			object oSion = CreateObject(1, "n_darthsion", GetLocation(oSionSpawn));

			object oKreia = CreateObject(OBJECT_TYPE_CREATURE, "p_kreia_evil001", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);

			AssignCommand(oSion, ClearAllActions());

			AssignCommand(oSion, ActionStartConversation(GetFirstPC(), "904sion", CONVERSATION_TYPE_CINEMATIC));

		break;

//Party Attacks Kreia
		case 4:

			//DelayCommand(0.2, SpawnParty());

			//DelayCommand(0.4, SecondLeader());

			DelayCommand(0.6, Run904Plan());

		break;
//Default Case, nothing happens
		case 5:
		break;

//Special Atton vs. Sion. Fixed to fire on load because the game doesn't seem to like switching player characters more than once in a module
		case 6:
			AttSion();
		break;
		default:
			return;
		break;

	}}

}










