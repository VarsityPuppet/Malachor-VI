float Deg(float fRad = 0.0){
	float fDeg = (fRad * 180.0 / 3.1415926535897932384626433832795);
	return fDeg;
}

void CreateAssarre(){
	CreateObject(1, "g_sithstealth", GetLocation(GetObjectByTag("sp_pfc_assarre", 0)));
}


void FixMissingDead(){

	if(IsAvailableCreature(4) && !GetIsObjectValid(GetObjectByTag("Handmaiden")) ){

		object oHand = SpawnAvailableNPC(NPC_HANDMAIDEN, GetLocation(GetObjectByTag("wp_pfc_hand_1", 0)));
	}

	if(IsAvailableCreature(11) && !GetIsObjectValid(GetObjectByTag("Disciple")) ){
		object oDisc = SpawnAvailableNPC(NPC_DISCIPLE, GetLocation(GetObjectByTag("wp_pfc_hand_1", 0)));
	}


	if(IsAvailableCreature(7) && !GetIsObjectValid(GetObjectByTag("Hanharr")) ){

		object oHanh = SpawnAvailableNPC(NPC_MIRA, GetLocation(GetObjectByTag("wp_pfc_mira_1", 0)));

	}

	if(IsAvailableCreature(10) && !GetIsObjectValid(GetObjectByTag("Mira")) ){
		object oMira = SpawnAvailableNPC(NPC_HANHARR, GetLocation(GetObjectByTag("wp_pfc_mira_1", 0)));
	}

	if(IsAvailableCreature(9) && !GetIsObjectValid(GetObjectByTag("VisasMarr")) ){

		object oVisa = SpawnAvailableNPC(NPC_VISAS, GetLocation(GetObjectByTag("wp_pfc_visas_1", 0)));

	}


}

void JumpToPFC(){

	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), GetObjectByTag("Mira"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), GetObjectByTag("VisasMarr"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), GetObjectByTag("Handmaiden"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), GetObjectByTag("Disciple"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), GetObjectByTag("Hanharr"));

	ChangeToStandardFaction(GetObjectByTag("DarthSion"), 5);

	AssignCommand(GetObjectByTag("Mira"), ActionJumpToObject(GetObjectByTag("wp_pfc_mira_1", 0)));
	AssignCommand(GetObjectByTag("Hanharr"), ActionJumpToObject(GetObjectByTag("wp_pfc_mira_1", 0)));

	AssignCommand(GetObjectByTag("VisasMarr"), ActionJumpToObject(GetObjectByTag("wp_pfc_visas_1", 0)));

	AssignCommand(GetObjectByTag("Handmaiden"), ActionJumpToObject(GetObjectByTag("wp_pfc_hand_1", 0)));
	AssignCommand(GetObjectByTag("Disciple"), ActionJumpToObject(GetObjectByTag("wp_pfc_hand_1", 0)));


	DelayCommand(0.98, AssignCommand(GetObjectByTag("Mira"), ActionPlayAnimation(10375, 1.0, -1.0)));
	DelayCommand(0.98, AssignCommand(GetObjectByTag("Hanharr"), ActionPlayAnimation(10375, 1.0, -1.0)));

	DelayCommand(0.98, AssignCommand(GetObjectByTag("Handmaiden"), ActionPlayAnimation(10081, 1.0, -1.0)));
	DelayCommand(0.98, AssignCommand(GetObjectByTag("Disciple"), ActionPlayAnimation(10081, 1.0, -1.0)));

	DelayCommand(0.98, AssignCommand(GetObjectByTag("VisasMarr"), ActionPlayAnimation(10083, 1.0, -1.0)));
			
}

void DeletePerson(object oCreature){
	AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
	AssignCommand(oCreature, ClearAllEffects());
	AssignCommand(oCreature, ClearAllActions());
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), oCreature);
	AssignCommand(oCreature, ClearAllEffects());
	AssignCommand(oCreature, ClearAllActions());
	DestroyObject(oCreature, 0.0, TRUE);
}

void main(){

//Participants

	object oKreia = GetObjectByTag("Kreia", 0);
	object oSion = GetObjectByTag("DarthSion", 0);
	object oAtton = GetObjectByTag("Atton", 0);
	object oVisas = GetObjectByTag("VisasMarr", 0);
	object oMira;
	object oHand;
	object oAss1 = GetObjectByTag("sith_assassin_1", 0);
	object oAss2 = GetObjectByTag("sith_assassin_2", 0);
	object oAss3 = GetObjectByTag("sith_assassin_3", 0);
	object oAss5;
	object oAssarre = GetObjectByTag("sithstealth", 0);

	if(!GetIsObjectValid(GetObjectByTag("Mira", 0))){
		oMira = GetObjectByTag("Hanharr", 0);
	}
	else{
		oMira = GetObjectByTag("Mira", 0);
	}
	if(!GetIsObjectValid(GetObjectByTag("Disciple", 0))){
		oHand = GetObjectByTag("Handmaiden", 0);
	}
	else{
		oHand = GetObjectByTag("Disciple", 0);
	}
	if(GetIsObjectValid(GetObjectByTag("sithstealth", 0))){
		oAssarre = GetObjectByTag("sithstealth", 0);
	}

//The scene
	
	int iParam = GetScriptParameter(1);
	int iCamera2  = GetScriptParameter(2);
	int iCamera3  = GetScriptParameter(3);
	int iCamera4  = GetScriptParameter(4);

	switch(iParam){
		case 0: 	//Atton defeats Sion

			SetGlobalFadeIn(0.1, 2.0);

			SetLockOrientationInDialog(oSion, TRUE);
			SetLockOrientationInDialog(oKreia, TRUE);
			AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));


			//AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_atton_2", 0))));
			//AssignCommand(oSion, ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_sion_1", 0))));
			SetLightsaberPowered(oSion, 1);
			DelayCommand(1.0, SetLightsaberPowered(oAtton, 1));
			/*ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oAtton)), oAtton);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oSion)), oSion);
			SetFakeCombatState(oAtton, 1);
			SetFakeCombatState(oSion, 1);
			ChangeToStandardFaction(oSion, 5);
			ChangeToStandardFaction(oAtton, 2);*/

			//AssignCommand(oAtton, ActionAttack(oSion, FALSE));
 			/*AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 114, ATTACK_RESULT_PARRIED, 0)));
 			AssignCommand(oSion, ActionWait(0.8));
 			AssignCommand(oSion, ActionDoCommand(CutsceneAttack(oAtton, 410, ATTACK_RESULT_MISS, 0)));
 			AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 411, ATTACK_RESULT_MISS, 0)));
 			AssignCommand(oSion, ActionDoCommand(CutsceneAttack(oAtton, 123, ATTACK_RESULT_MISS, 0)));
 			AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 115, ATTACK_RESULT_HIT_SUCCESSFUL, 0)));
 			AssignCommand(oSion, ActionDoCommand(ActionWait(3.0)));
 			AssignCommand(oAtton, ActionDoCommand(ActionWait(3.0)));*/
			//AssignCommand(oAtton, CutsceneAttack(oSion, 117,, 0));

			//DelayCommand(5.0, SetDialogPlaceableCamera(iCamera2));
			//DelayCommand(8.5, AssignCommand(oSion, ClearAllActions()));
			//DelayCommand(8.5, CancelCombat(oSion));
			//DelayCommand(1.5, AssignCommand(oSion, ClearAllActions()));
			//DelayCommand(1.5, ChangeToStandardFaction(oSion, 5));
			//DelayCommand(8.5, ActionWait(1.0));
			DelayCommand(1.5, AssignCommand(oSion, ActionPlayAnimation(26, 1.0, 9.9)));
			DelayCommand(2.1, SetLightsaberPowered(oSion, TRUE, FALSE, TRUE));
			DelayCommand(1.8, SetLightsaberPowered(oAtton, TRUE, FALSE, TRUE));
			//DelayCommand(2.4, AssignCommand(oAtton, ClearAllActions()));
			//DelayCommand(2.4, CancelCombat(oAtton));
			//DelayCommand(2.4, AssignCommand(oAtton, ClearAllActions()));
			//DelayCommand(9.4, ActionWait(1.0));
			DelayCommand(2.9, AssignCommand(oAtton, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT)));

			DelayCommand(5.0, SetDialogPlaceableCamera(iCamera3));
			DelayCommand(5.5, AssignCommand(oAtton, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_avs_atton_3", 0)), TRUE)));

			DelayCommand(8.0, SetDialogPlaceableCamera(iCamera4));
			DelayCommand(10.0, AssignCommand(oAtton, JumpToLocation(Location(Vector(12.71554, -81.53741, 0.79600), 0.0))));
			DelayCommand(14.0, AssignCommand(oSion, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN_INJURED, 1.0, 1.9)));

			DelayCommand(16.0, AssignCommand(oSion, ActionPlayAnimation(ANIMATION_FIREFORGET_SCREAM)));

			DelayCommand(19.0, AssignCommand(oSion, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_pfc_sion_1", 0)), FALSE)));
			DelayCommand(21.0, SetGlobalFadeOut(0.0, 2.0));



		break;
		case 1: 	//prepare atton-loses, atton injured

			//AssignCommand(GetFirstPC(), JumpToLocation(Location(Vector(12.71554, -81.53741, 0.79600), 0.0)));
			SetLockOrientationInDialog(oSion, TRUE);
			SetLockOrientationInDialog(oKreia, TRUE);
			SetLockOrientationInDialog(oAtton, TRUE);
			//ChangeObjectAppearance(GetObjectByTag("Atton"), 675); // ChangeObjectAppearance(GetObjectByTag("Atton"), 2DAMEMORY2); 
			AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
			DelayCommand(0.25, AssignCommand(oAtton, ClearAllActions()));
			DelayCommand(0.25, AssignCommand(oAtton, ClearAllEffects()));
			//AssignCommand(oSion, ClearAllActions());
			//DelayCommand(0.75, AssignCommand(oAtton, ActionJumpToObject(GetObjectByTag("wp_avs_atton_4", 0))));
			//DelayCommand(0.75, AssignCommand(oSion, ActionJumpToObject(GetObjectByTag("wp_avs_sion_2", 0))));
			//DelayCommand(0.80, AssignCommand(oSion, SetFacing(90.0)));
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oAtton)), oAtton);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oSion)), oSion);
		break;
		case 2: 	//Sion chops hand, walks away.

			//effect eSpeed1 = EffectMovementSpeedDecrease(15);
			//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed1, oSion, 20.0);
			//DelayCommand(1.0, SetDialogPlaceableCamera(iCamera2));
			ChangeToStandardFaction(oSion, 5);
			//DelayCommand(2.0, SetLightsaberPowered(oSion, TRUE, FALSE, TRUE));
			AssignCommand(oSion, ClearAllActions());
			DelayCommand(2.0, CancelCombat(oSion));
			DelayCommand(3.0, AssignCommand(GetObjectByTag("DarthSion"), ActionMoveToObject(GetObjectByTag("wp_pfc_sion_1", 0), FALSE)));
		break;
		case 3: 	//FLASH, Atton lying on the ground, gets up
			//SetGlobalFadeOut(0.0, 0.8);
			//SetGlobalFadeIn(2.0, 1.0);
		break;
		case 13: 	//Sion stops
			DelayCommand(1.0, AssignCommand(oSion, ClearAllActions()));
		break;
		case 11: 	//Sion turns around
			AssignCommand(oSion, SetFacingPoint(GetPosition(oAtton)));
		break;
		case 14: 	//Sion ignites his lightsaber
			//DelayCommand(4.0, SetDialogPlaceableCamera(iCamera2));
			//DelayCommand(5.8, SetDialogPlaceableCamera(iCamera3));
			AssignCommand(oSion, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_avs_sion_3", 0)), FALSE));
			//DelayCommand(6.0, SetLightsaberPowered(oSion, TRUE, TRUE, TRUE));
		break;
		case 12: 	//Sion starts moving towards Atton
			SetLightsaberPowered(oSion, TRUE, TRUE, TRUE);
		break;
		case 4: 	//Fade out, clean-up
			SetGlobalFadeOut(2.0, 2.0);
			DelayCommand(4.2, DestroyObject(oAtton));
			DelayCommand(4.2, SetLightsaberPowered(oSion, TRUE, FALSE, FALSE));
		break;
		case 5: 	//Sion pride do centra

			SetGlobalFadeIn(2.0, 2.0);
			//effect eSpeed = EffectMovementSpeedDecrease(15);
			//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oKreia, 500.0);


			oAss1 = CreateObject(OBJECT_TYPE_CREATURE, "g_sith_assassin1", GetLocation(GetObjectByTag("wp_pfc_assassin_1", 0)));
			if(GetIsObjectValid(oHand)) oAss2 = CreateObject(OBJECT_TYPE_CREATURE, "g_sith_assassin2", GetLocation(GetObjectByTag("wp_pfc_assassin_2", 0)));
			if(GetIsObjectValid(oVisas)) oAss3 = CreateObject(OBJECT_TYPE_CREATURE, "g_sith_assassin3", GetLocation(GetObjectByTag("wp_pfc_assassin_3", 0)));
			object oAss4 = CreateObject(OBJECT_TYPE_CREATURE, "g_sith_assassin", Location(Vector(-9.91423, -16.79163, 0.47460), 8.1308440707015121556264261496697));
			if(GetIsObjectValid(oHand)) oAss5 = CreateObject(OBJECT_TYPE_CREATURE, "g_sith_assassin", Location(Vector(3.83530, -15.35088, 0.47460), -138.56239430105289233882235365779));

			JumpToPFC();


			DelayCommand(1.0, AssignCommand(oAss1, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, -1.0)));
			DelayCommand(1.0, AssignCommand(oAss2, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, -1.0)));
			DelayCommand(1.0, AssignCommand(oAss3, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, -1.0)));
			DelayCommand(7.5, AssignCommand(oAss4, ActionMoveToLocation(Location(Vector(14.78922, -17.73409, 0.47460), -6.9408107302147923510153284741807), FALSE)));
			DelayCommand(1.0, AssignCommand(oAss5, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, 3.0)));
			DelayCommand(4.5, AssignCommand(oAss5, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_avs_sion_1", 0)), TRUE)));

			AssignCommand(oSion, ClearAllActions());
			AssignCommand(oSion, ActionJumpToObject(GetObjectByTag("wp_pfc_sion_1", 0)));
			DelayCommand(1.5, AssignCommand(oSion, ActionMoveToObject(GetObjectByTag("wp_pfc_sion_2", 0), FALSE)));

			DelayCommand(7.5, SetDialogPlaceableCamera(iCamera2));

			//DelayCommand(13.95, AssignCommand(oMira, PlayOverlayAnimation(oMira, 10579)));
			//DelayCommand(12.0, AssignCommand(oMira, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_pfc_sion_1", 0)), FALSE)));
			DelayCommand(18.0, DestroyObject(oAss4));
			DelayCommand(10.0, DestroyObject(oAss5));
			DelayCommand(13.0, SetDialogPlaceableCamera(iCamera3));

			DelayCommand(14.0, CreateAssarre());
			DelayCommand(14.9, SetLockOrientationInDialog(GetObjectByTag("sithstealth", 0), 1));
			DelayCommand(19.9, AssignCommand(oSion, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("sithstealth", 0))))));
			DelayCommand(14.5, AssignCommand(GetObjectByTag("sithstealth", 0), ActionMoveToLocation(GetLocation(GetObjectByTag("wp_pfc_assarre", 0)), 0)));


		break;
		case 6: 	//The Assassin leaves
			DelayCommand(0.5, AssignCommand(GetObjectByTag("sithstealth", 0), ActionMoveToLocation(GetLocation(GetObjectByTag("sp_pfc_assarre", 0)), 0)));
			DelayCommand(2.8, DestroyObject(GetObjectByTag("sithstealth", 0)));
			DelayCommand(4.0, AssignCommand(GetObjectByTag("DarthSion", 0), SetFacingPoint(GetPosition(GetObjectByTag("Kreia", 0)))));

				//Visas and Mira are taken away
			oAss1 = GetObjectByTag("sith_assassin_1");
			oAss3 = GetObjectByTag("sith_assassin_3");
			oVisas = GetObjectByTag("VisasMarr");
			if(!GetIsObjectValid(GetObjectByTag("Mira", 0))){
				oMira = GetObjectByTag("Hanharr", 0);
			}
			else{
				oMira = GetObjectByTag("Mira", 0);
			}
			if(GetIsObjectValid(oVisas)){
				DeletePerson(oVisas);
				AssignCommand(oAss3, JumpToLocation(Location(Vector(-0.01396, -52.45873, 0.47460), -90.0)));
				AssignCommand(oAss3, ActionMoveToLocation(Location(Vector(0.25098, -79.45361, 0.79600), -90.0)));
			}
			DeletePerson(oMira);
			AssignCommand(oAss1, JumpToLocation(Location(Vector(-0.01396, -48.42736, 0.47460), -90.0)));
			AssignCommand(oAss1, ActionMoveToLocation(Location(Vector(0.25098, -79.45361, 0.79600), -90.0)));
		break;
		case 7: 	//Kreia gets up?
			AssignCommand(GetObjectByTag("Kreia", 0), SetFacing(GetFacing(GetObjectByTag("DarthSion", 0))));
			DelayCommand(0.1, AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (0.5))));
		break;
		case 8: 	//Kreia se Sion-u pribli?a, then clutches her hand
			vector vSion = GetPosition(GetObjectByTag("DarthSion", 0));
			AssignCommand(GetObjectByTag("Kreia", 0), SetFacingPoint(GetPosition(GetObjectByTag("wp_pfc_sion_2", 0))));
			DelayCommand(0.6, AssignCommand(GetObjectByTag("Kreia", 0), ActionForceMoveToLocation(Location(Vector(-0.80903, -2.01617, 2.25750), 116.33449663895260595466850949766), 0)));
			DelayCommand(3.3, SetDialogPlaceableCamera(33));
			DelayCommand(3.4, AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(10468)));
			DelayCommand(5.6, AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(107)));
		break;
		case 9: 	//Kreia se vrne
			AssignCommand(GetObjectByTag("Kreia", 0), SetFacing(-65.0));
			DelayCommand(0.5, AssignCommand(GetObjectByTag("Kreia", 0), ActionMoveToLocation(GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0)));

				//Hand is taken away
			oAss1 = GetObjectByTag("sith_assassin_1");
			oAss3 = GetObjectByTag("sith_assassin_3");
			oAss2 = GetObjectByTag("sith_assassin_2");
			DestroyObject(oAss3);
			if(!GetIsObjectValid(GetObjectByTag("Disciple", 0))){
				oHand = GetObjectByTag("Handmaiden", 0);
			}
			else{
				oHand = GetObjectByTag("Disciple", 0);
			}
			if(GetIsObjectValid(oHand)){
				DeletePerson(oHand);
				AssignCommand(oAss1, JumpToLocation(Location(Vector(-0.01396, -48.42736, 0.47460), -90.0)));
				AssignCommand(oAss1, ActionMoveToLocation(Location(Vector(0.25098, -79.45361, 0.79600), -90.0)));
				AssignCommand(oAss2, JumpToLocation(Location(Vector(-0.01396, -52.45873, 0.47460), -90.0)));
				AssignCommand(oAss2, ActionMoveToLocation(Location(Vector(0.25098, -79.45361, 0.79600), -90.0)));
			}
			else DestroyObject(oAss1);
		break;
		case 10: 	//Sion leaves, fade out, clean-up
			AssignCommand(GetObjectByTag("DarthSion", 0), ActionMoveToLocation(GetLocation(GetObjectByTag("wp_pfc_sion_1", 0)), 0));
			AssignCommand(GetObjectByTag("Kreia", 0), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
			SetGlobalFadeOut(1.0, 1.5);
			SetFadeUntilScript();
			//clean-up
		break;
		case 20:
			AssignCommand(GetObjectByTag("Atton"), ClearAllActions());
			AssignCommand(GetObjectByTag("DarthSion"), ClearAllActions());

		break;
		case 21:
			SetGlobalFadeIn(0.0, 2.0);
			//DelayCommand(1.0, AssignCommand(GetObjectByTag("DarthSion"), ActionPlayAnimation(10557, 1.0, -1.0)));
			//AssignCommand(GetObjectByTag("Atton"), ActionPlayAnimation(27, 1.0, 1.5));
			DelayCommand(2.0, AssignCommand(GetObjectByTag("Atton"), ActionPlayAnimation(10558, 1.0, -1.0)));
			DelayCommand(6.9, AssignCommand(GetObjectByTag("Atton"), ActionPlayAnimation(10571, 1.0, 100.0)));
		break;
		case 30: 	//Load up 903Mal
			DelayCommand(2.0, StartNewModule("903mal"));
			//clean-up
		break;
	}

}