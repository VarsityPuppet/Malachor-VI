int DISC_ALIVE = 20;
int HAND_ALIVE = 21;
int VISAS_ALIVE = 22;
int HANHARR_ALIVE = 23;
int MIRA_ALIVE = 24;

void PlayDead(object oObject){

	int anim;
	string sTag = GetTag(oObject);
	object o904plancs = GetObjectByTag("904plancs");
	SetCommandable(TRUE, oObject);
	SetMinOneHP(oObject, FALSE);
	effect FPDamage = EffectDamageForcePoints(GetCurrentForcePoints(oObject));
	effect efDeath = EffectDeath(FALSE, FALSE, TRUE);
	AssignCommand(oObject, SetIsDestroyable(FALSE, TRUE, FALSE));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, FPDamage, oObject);

	if(sTag == "Mira" && GetLocalNumber(o904plancs, MIRA_ALIVE) == 0){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Hanharr" && GetLocalNumber(o904plancs, HANHARR_ALIVE) == 0){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "VisasMarr" && GetLocalNumber(o904plancs, VISAS_ALIVE) == 0){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Disciple" && GetLocalNumber(o904plancs, DISC_ALIVE) == 0){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}
	else if(sTag == "Handmaiden" && GetLocalNumber(o904plancs, HAND_ALIVE) == 0){
		ApplyEffectToObject(DURATION_TYPE_INSTANT, efDeath, oObject);
	}




}

void BecomeAtton(){

		SwitchPlayerCharacter(0);

}

void CleanParty(){
if(GetIsObjectValid(GetObjectByTag("Handmaiden")))
	DestroyObject(GetObjectByTag("Handmaiden"));

if(GetIsObjectValid(GetObjectByTag("Disciple")))
	DestroyObject(GetObjectByTag("Disciple"));

if(GetIsObjectValid(GetObjectByTag("Mira")))
	DestroyObject(GetObjectByTag("Mira"));

if(GetIsObjectValid(GetObjectByTag("Hanharr")))
	DestroyObject(GetObjectByTag("Hanharr"));

if(GetIsObjectValid(GetObjectByTag("VisasMarr")))
	DestroyObject(GetObjectByTag("VisasMarr"));

//DestroyObject(GetObjectByTag("Kreia"), 0.0, TRUE);
}

void Post904Setup(){


	if(IsAvailableCreature(4)){

		SpawnAvailableNPC(NPC_HANDMAIDEN, GetLocation(GetObjectByTag("wp_dead_hand", 0)));
	}

	if(IsAvailableCreature(11)){
		SpawnAvailableNPC(NPC_DISCIPLE, GetLocation(GetObjectByTag("wp_dead_hand", 0)));
	}


	if(IsAvailableCreature(7)){

		SpawnAvailableNPC(NPC_MIRA, GetLocation(GetObjectByTag("wp_dead_mira", 0)));

	}

	if(IsAvailableCreature(10)){
		SpawnAvailableNPC(NPC_HANHARR, GetLocation(GetObjectByTag("wp_dead_mira", 0)));
	}

	if(IsAvailableCreature(9)){

		SpawnAvailableNPC(NPC_VISAS, GetLocation(GetObjectByTag("wp_dead_visas", 0)));

	}


	object oSion = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion002", GetLocation(GetObjectByTag("wp_plan_sion_1", 0)));
	//object oKreia = CreateObject(OBJECT_TYPE_CREATURE, "p_kreiaparty", GetLocation(GetObjectByTag("sp_kreia", 0)));


	AssignCommand(GetObjectByTag("Kreia"), ClearAllActions());
	AssignCommand(GetObjectByTag("Kreia"), ClearAllEffects());
	ChangeToStandardFaction(GetObjectByTag("Kreia"), 5);
	AssignCommand(GetObjectByTag("Kreia"), ActionMoveToObject(GetObjectByTag("wp_plan_sion_2")));
	DelayCommand(0.1, AssignCommand(GetObjectByTag("Kreia"), ActionJumpToObject(GetObjectByTag("sp_kreia"))));

	if(GetFirstPC() == GetObjectByTag("Atton")){
		DelayCommand(0.3, AssignCommand(GetFirstPC(), ActionJumpToObject(GetObjectByTag("wp_dead_atton"))));
	}
	else{
		DelayCommand(0.3, AssignCommand(GetFirstPC(), ActionJumpToObject(GetObjectByTag("wp_exile_wait"))));
	}

	DelayCommand(0.5, AssignCommand(oSion, ActionMoveToObject(GetObjectByTag("wp_plan_sion_2"))));

	PlayDead(GetObjectByTag("VisasMarr"));
	PlayDead(GetObjectByTag("Mira"));
	PlayDead(GetObjectByTag("Hanharr"));
	PlayDead(GetObjectByTag("Handmaiden"));
	PlayDead(GetObjectByTag("Disciple"));


}

void main() {



	int param1 = GetScriptParameter(1);



		switch(param1){



			case 0:
				int nCount = 0;
				CleanParty();
				Post904Setup();

				SetGlobalFadeIn(1.0, 2.0);
				SetLockOrientationInDialog(GetObjectByTag("DarthSion"), TRUE);
				AssignCommand(GetFirstPC(), ClearAllActions());
				CancelCombat(GetFirstPC());
			break;

			case 1:
				effect efBeam = EffectBeam(2029, GetObjectByTag("Kreia"), 2, 0);
				effect eVFX = EffectVisualEffect(VFX_PRO_DRAIN);

				object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 3.0, GetLocation(GetObjectByTag("Kreia")), TRUE, OBJECT_TYPE_CREATURE );
				AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(10067, 1.0, 3.0));

				while(GetIsObjectValid(oTarget)){
					if(!GetIsDead(oTarget) && GetTag(oTarget) != "Kreia" && GetTag(oTarget) != "DarthSion" && oTarget != GetFirstPC()){

						ApplyEffectToObject(DURATION_TYPE_TEMPORARY, efBeam, oTarget, 3.0);
						ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oTarget, 3.0);

						DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));

					}
						oTarget = GetNextObjectInShape(SHAPE_SPHERE, 4.0, GetLocation(GetObjectByTag("Kreia")), TRUE, OBJECT_TYPE_CREATURE );


				}

			break;
			case 2:
				SetGlobalFadeOut(2.0, 2.0);
				SetFadeUntilScript();
			break;
			case 3:
				DelayCommand(0.4, AssignCommand(GetObjectByTag("904Plancs"), ActionStartConversation(GetObjectByTag("904Plancs"), "904postfight", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
			break;

			case 20:
				SetLockOrientationInDialog(GetObjectByTag("Atton"), TRUE);
				AssignCommand(GetObjectByTag("Atton"), ClearAllActions());
				DelayCommand(0.2, AssignCommand(GetObjectByTag("Atton"), ActionMoveToObject(GetObjectByTag("wp_avs_atton_2"), TRUE, 0.1)));
				//DelayCommand(0.2, AssignCommand(GetFirstPC(), ActionForceMoveToObject(GetObjectByTag("wp_avs_atton_2"), TRUE, 0.1, 45.00)));
				ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedIncrease(25), GetObjectByTag("DarthSion"), 12.00);
			break;
			case 21:
				SetGlobalFadeOut(2.0, 1.0);
				SetFadeUntilScript();
				AssignCommand(GetObjectByTag("Atton"), ActionForceMoveToObject(GetObjectByTag("wp_avs_atton_2"), TRUE, 0.1, 45.00));

				DelayCommand(1.0, AssignCommand(GetObjectByTag("DarthSion"), ActionMoveToObject(GetObjectByTag("wp_avs_sion_1"), TRUE, 0.1)));
			break;
			case 22:

				//DelayCommand(0.2, BecomeAtton());
				SetGlobalNumber("907MAL_CUTSCENE", 6);
				//DelayCommand(0.4, AssignCommand(oAttsion, ActionStartConversation(oAttsion, "904attsion", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
				StartNewModule("904Mal", "sp_avs_atton");

			break;
			case 4:

			break;
		}



}