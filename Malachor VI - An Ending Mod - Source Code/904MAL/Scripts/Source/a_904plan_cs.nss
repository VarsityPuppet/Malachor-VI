float Deg(float fRad = 0.0){
	float fDeg = (fRad * 180.0 / 3.1415926535897932384626433832795);
	return fDeg;
}

void MeleeWeapon(object oCreature){
	object oItem = GetItemInSlot(4, oCreature);
	object oItem2 = GetItemInSlot(18, oCreature);
	int a = GetBaseItemType(oItem);
	int b = GetBaseItemType(oItem2);
	if((a == 256) || (GetWeaponRanged(oItem))){
		if((b == 256) || (GetWeaponRanged(oItem2))){
			object oItem3 = CreateItemOnObject("w_melee_02", oCreature, 1, 1);
			AssignCommand(oCreature, ActionEquipItem(oItem3, 4, TRUE));
		}
		else{
			AssignCommand(oCreature, ActionSwitchWeapons());
		}
	}
}

void UnEquipAtton(){

object oItemDestroy = GetFirstItemInInventory(GetObjectByTag("Atton"));

while(oItemDestroy != OBJECT_INVALID){

DestroyObject(oItemDestroy);

oItemDestroy = GetNextItemInInventory(GetObjectByTag("Atton"));
}

}

void Flourish(object oNPC){
	if(GetIsObjectValid(oNPC)){
		object oItem = GetItemInSlot(4, oNPC);
		object oItem2 = GetItemInSlot(18, oNPC);
		int a = GetBaseItemType(oItem);
		int b = GetBaseItemType(oItem2);

		if(a == 256){
			if(b == 256){
				//AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, -1.0));
			}
			else{
				AssignCommand(oNPC, ActionSwitchWeapons());
				DelayCommand(0.8, SetLightsaberPowered(oNPC, TRUE, TRUE, FALSE));
				if(GetWeaponRanged(oItem2)){
					CreatureFlourishWeapon(oNPC);
				}
				//AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, -1.0));
			}
		}
		else{
			CreatureFlourishWeapon(oNPC);
			DelayCommand(0.8, SetLightsaberPowered(oNPC, TRUE, TRUE, FALSE));
			//DelayCommand(1.2, AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, -1.0)));
		}
	}
}

void Paralyze(string svictim){

	effect eParalyze = EffectCutSceneParalyze();
	eParalyze = EffectLinkEffects(eParalyze, EffectVisualEffect(VFX_DUR_HOLD));

	ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, GetObjectByTag(svictim));

}


void UnParalyze(string svictim){

	/*effect eEffect = GetFirstEffect( GetObjectByTag(svictim) );



	while(GetIsEffectValid(eEffect)) {
		if(GetEffectType(eEffect) == 27) {
			RemoveEffect(GetObjectByTag(svictim),eEffect);
		}
		eEffect = GetNextEffect(GetObjectByTag(svictim));
	}*/

AssignCommand(GetObjectByTag(svictim), ClearAllEffects());

SetMinOneHP(GetObjectByTag(svictim), FALSE);

AssignCommand(GetObjectByTag(svictim), SetIsDestroyable(FALSE, FALSE, FALSE));
}

void RedLightsaber(object oNPC, int i = 0){
	if(GetIsObjectValid(oNPC)){
		if((i == 0)&&((GetTag(GetItemInSlot(4, oNPC)) == "g_w_lghtsbr02")||(GetTag(GetItemInSlot(5, oNPC)) == "g_w_lghtsbr02"))){
			AssignCommand(oNPC, ActionSwitchWeapons());
			//DelayCommand(0.5, AssignCommand(oNPC, ActionSwitchWeapons()));
		}
		else if((i == 1)&&((GetTag(GetItemInSlot(18, oNPC)) == "g_w_lghtsbr02")||(GetTag(GetItemInSlot(19, oNPC)) == "g_w_lghtsbr02"))){
			AssignCommand(oNPC, ActionSwitchWeapons());
		}
	}
}


void main(){
	//Participants
	object oAtton = GetObjectByTag("Atton");
	object oHand = GetObjectByTag("Handmaiden");
	object oVisas = GetObjectByTag("VisasMarr");
	object oDisciple = GetObjectByTag("Disciple");
	object oHanharr = GetObjectByTag("Hanharr");
	object oMira = GetObjectByTag("Mira");
	object oKreia = GetObjectByTag("Kreia");
	object oSion = GetObjectByTag("DarthSion");


	int param1 = GetScriptParameter(1);
	int iCam2 = GetScriptParameter(2);
	int iCam3 = GetScriptParameter(3);
	int iCam4 = GetScriptParameter(4);

	switch(param1){

		case 0:		//Actual plan fade-out
			SetGlobalFadeOut(2.0, 2.0);
			RedLightsaber(oVisas);
			RedLightsaber(oMira);
			RedLightsaber(oHand);
			RedLightsaber(oDisciple);
			RedLightsaber(oAtton);
		break;
		case 1:		//Jump characters to right positions
			SetLockOrientationInDialog(oKreia, FALSE);
			CreateObject(OBJECT_TYPE_PLACEABLE, "kreia_invis", GetLocation(GetObjectByTag("sp_kreia")));
			AssignCommand(oKreia, ActionSwitchWeapons());
			AssignCommand(oVisas, ActionJumpToObject(GetObjectByTag("wp_plan_pm_1")));				//wp_kreia_visas_1
			DelayCommand(0.1, AssignCommand(oAtton, ActionJumpToObject(GetObjectByTag("wp_plan_pm_3"))));		//wp_kreia_atton_1
			DelayCommand(0.2, AssignCommand(oMira, ActionJumpToObject(GetObjectByTag("wp_kreia_mira_1"))));		//wp_kreia_mira_1
			DelayCommand(0.2, AssignCommand(oHanharr, ActionJumpToObject(GetObjectByTag("wp_kreia_mira_1"))));	//wp_kreia_mira_1
			DelayCommand(0.4, AssignCommand(oHand, ActionJumpToObject(GetObjectByTag("wp_plan_pm_4"))));		//wp_kreia_handisc_1
			DelayCommand(0.4, AssignCommand(oDisciple, ActionJumpToObject(GetObjectByTag("wp_plan_pm_4"))));	//wp_kreia_handisc_1

			DelayCommand(0.8, ApplyEffectToObject(3, EffectVisualEffect(8000), oAtton, -1.0));
		break;
		case 2:		//Mira/Hanharr walks up to Kreia - NOT rocket case
			SetGlobalFadeIn(0.0, 2.0);
			AssignCommand(oMira, ActionDoCommand(ActionMoveToObject(GetObjectByTag("wp_kreia_mira_2"), FALSE, 0.1)));
			AssignCommand(oHanharr, ActionDoCommand(ActionMoveToObject(GetObjectByTag("wp_kreia_mira_2"), FALSE, 0.1)));
			DelayCommand(4.6, AssignCommand(oMira, ActionDoCommand(SetFacingPoint(GetPosition(oKreia)))));
			DelayCommand(4.6, AssignCommand(oHanharr, ActionDoCommand(SetFacingPoint(GetPosition(oKreia)))));

		break;
		case 3:		//Everyone else enters the scene
			AssignCommand(oHand, ActionMoveToObject(GetObjectByTag("wp_kreia_handisc_2"), FALSE, 0.1));
			AssignCommand(oDisciple, ActionMoveToObject(GetObjectByTag("wp_kreia_handisc_2"), FALSE, 0.1));
			AssignCommand(oVisas, ActionMoveToObject(GetObjectByTag("wp_kreia_visas_2"), FALSE, 0.1));

		break;
		case 14:	//Jump everyone else
			AssignCommand(oHand, JumpToLocation(GetLocation(GetObjectByTag("wp_kreia_handisc_1"))));
			AssignCommand(oDisciple, JumpToLocation(GetLocation(GetObjectByTag("wp_kreia_handisc_1"))));
			AssignCommand(oVisas, JumpToLocation(GetLocation(GetObjectByTag("wp_kreia_visas_1"))));

		break;
		case 4:		//Kreia turns to Handmaiden/Disciple

			//AssignCommand(oAtton, ActionPlayAnimation(10005, 1.0, 10.0));
			AssignCommand(oKreia, SetFacingPoint(GetPosition(GetObjectByTag("wp_kreia_handisc_2"))));

		break;
		case 5:		//Atton decloacks, attacks Kreia.. Party sees that Atton is losing, they attack, 
				//Kreia force pushes Atton away, while she stops the others and chokes them
			ActionPauseConversation();
			SetLockOrientationInDialog(oKreia, TRUE);
			AssignCommand(oKreia, ActionSwitchWeapons());
			//SetLightsaberPowered(oKreia, TRUE, FALSE, FALSE);
				//Atton decloacks
			MeleeWeapon(oAtton);
			AssignCommand(oAtton, JumpToLocation(Location(Vector(0.0, -1.37347, 2.25750), 90.0)));//-0.87347
			ApplyEffectToObject(1, EffectVisualEffect(8001), oAtton);
			SetLightsaberPowered(oAtton, TRUE, TRUE, FALSE);
			DelayCommand(0.7, RemoveEffectByID(oAtton, 8000));
			DelayCommand(0.3, AssignCommand(oKreia, SetFacing(-90.0)));
				//Atton attacks
			//DelayCommand(1.0, ChangeToStandardFaction(oAtton, STANDARD_FACTION_PREDATOR));
			DelayCommand(1.0, ChangeToStandardFaction(oKreia, STANDARD_FACTION_PREY));
 			DelayCommand(0.5, AssignCommand(oAtton, ClearAllActions()));
 			DelayCommand(0.5, AssignCommand(oKreia, ClearAllActions()));
 			DelayCommand(0.5, AssignCommand(oAtton, ActionDoCommand(ActionWait(0.6))));
 			DelayCommand(0.5, AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oKreia, 114, ATTACK_RESULT_PARRIED, 0))));
 			DelayCommand(0.5, AssignCommand(oKreia, ActionDoCommand(ActionWait(0.6))));
 			DelayCommand(1.7, AssignCommand(oKreia, ActionDoCommand(ActionWait(1.0))));
			DelayCommand(2.7, AssignCommand(oAtton, ClearAllActions()));
			DelayCommand(2.7, AssignCommand(oKreia, ClearAllActions()));
			//DelayCommand(2.7, CancelCombat(oAtton));
			DelayCommand(2.7, CancelCombat(oKreia));
			DelayCommand(2.7, ChangeToStandardFaction(oKreia, 5));
			//DelayCommand(2.7, ChangeToStandardFaction(oAtton, 5));
			DelayCommand(2.7, SetLightsaberPowered(oKreia, TRUE, FALSE, FALSE));

				//Kreia force pushes Atton
			DelayCommand(2.8, SetMinOneHP(oAtton, FALSE));
			AssignCommand(oAtton, SetIsDestroyable(TRUE, FALSE, TRUE));
			DelayCommand(2.8, AssignCommand(oKreia, ActionPlayAnimation(121, 1.0, 0.0)));
			DelayCommand(3.0, AssignCommand(oAtton, ApplyEffectToObject(1, EffectLinkEffects(EffectForcePushTargeted(GetLocation(oKreia), 1), EffectVisualEffect(1014, 0)), oAtton, 0.6)));
			DelayCommand(3.1, AssignCommand(oAtton, ApplyEffectToObject(1, EffectForcePushTargeted(GetLocation(oKreia), 1), oAtton, 0.6)));
			DelayCommand(3.5, AssignCommand(oAtton, ApplyEffectToObject(1, EffectForcePushTargeted(GetLocation(oKreia), 1), oAtton, 0.6)));
			DelayCommand(3.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("Atton")));

				//Others make a run at Kreia
			DelayCommand(2.3, AssignCommand(oVisas, ActionMoveToLocation(GetLocation(oKreia), TRUE)));
			DelayCommand(2.3, AssignCommand(oMira, ActionMoveToLocation(GetLocation(oKreia), TRUE)));
			DelayCommand(2.3, AssignCommand(oHanharr, ActionMoveToLocation(GetLocation(oKreia), TRUE)));
			DelayCommand(2.3, AssignCommand(oHand, ActionMoveToLocation(GetLocation(oKreia), TRUE)));
			DelayCommand(2.3, AssignCommand(oDisciple, ActionMoveToLocation(GetLocation(oKreia), TRUE)));

			DelayCommand(2.9, AssignCommand(oMira, ClearAllActions()));
			DelayCommand(2.9, AssignCommand(oVisas, ClearAllActions()));
			DelayCommand(2.9, AssignCommand(oHanharr, ClearAllActions()));
			DelayCommand(2.9, AssignCommand(oHand, ClearAllActions()));
			DelayCommand(2.9, AssignCommand(oDisciple, ClearAllActions())); //EffectForceResisted(oKreia)
			DelayCommand(2.9, AssignCommand(oMira, ApplyEffectToObject(1, EffectForceResisted(oKreia), oMira, 0.6)));
			DelayCommand(2.9, AssignCommand(oHanharr, ApplyEffectToObject(1, EffectForceResisted(oKreia), oHanharr, 0.6)));
			DelayCommand(2.9, AssignCommand(oHand, ApplyEffectToObject(1, EffectForceResisted(oKreia), oHand, 0.6)));
			DelayCommand(2.9, AssignCommand(oVisas, ApplyEffectToObject(1, EffectForceResisted(oKreia), oVisas, 0.6)));
			DelayCommand(2.9, AssignCommand(oDisciple, ApplyEffectToObject(1, EffectForceResisted(oKreia), oDisciple, 0.6)));

			DelayCommand(3.7, AssignCommand(oKreia, SetFacing(90.0)));
			DelayCommand(4.0, UnEquipAtton());
			DelayCommand(4.5, ActionResumeConversation());

		break;
		case 6:		//Kreia chokes Visas
			AssignCommand(oKreia, ActionPlayAnimation(121, 1.0, 6.0));
			AssignCommand(oVisas, ActionPlayAnimation(45, 1.0, 6.5));
			SetLightsaberPowered(oHand, TRUE, TRUE, TRUE);
			SetLightsaberPowered(oMira, TRUE, TRUE, TRUE);
			SetLightsaberPowered(oDisciple, TRUE, TRUE, TRUE);
			//DelayCommand(4.0, Flourish(oHand));
			//DelayCommand(4.0, Flourish(oMira));
			//DelayCommand(4.0, Flourish(oHanharr));
			//DelayCommand(4.0, Flourish(oDisciple));
		break;
		case 7:		//Kreia turns to Visas
			AssignCommand(oKreia, SetFacingPoint(GetPosition(GetObjectByTag("wp_kreia_visas_2"))));
		break;
		case 8:		//Kreia turns to Hanharr/Mira
			AssignCommand(oKreia, SetFacingPoint(GetPosition(GetObjectByTag("wp_kreia_mira_2"))));
		break;
		case 9:		//Rocket node
			SetGlobalFadeIn(0.1, 0.1);
			AssignCommand(oMira, JumpToLocation(Location(Vector(12.17597, 11.51035, 0.47460), Deg(-2.40209))));
			AssignCommand(oMira, ActionMoveToLocation(Location(Vector(9.05581, 8.33247, 0.47460), Deg(-2.36860))));
			DelayCommand(3.0, AssignCommand(oMira, ActionCastSpellAtLocation(190, GetLocation(oKreia), 0 , TRUE, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
			DelayCommand(5.0, AssignCommand(oMira, ActionMoveToLocation(Location(Vector(2.20140, 1.95512, 2.25750), Deg(-2.29113)), TRUE)));
			DelayCommand(7.0, AssignCommand(oMira, ApplyEffectToObject(1, EffectLinkEffects(EffectForcePushTargeted(Location(Vector(3.68550, -0.10507, 2.08491), Deg(0.40613))), EffectVisualEffect(1014, 0)), oMira)));
			
		break;
		case 10:	//Kreia turns, steps back a little, and ignites her saber
			ActionPauseConversation();
			AssignCommand(oKreia, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(32), oKreia, 2.0));
			AssignCommand(oKreia, ActionMoveToLocation(Location(Vector(0.0, -1.87347, 2.25750), -90.0)));
			DelayCommand(1.9, SetLightsaberPowered(oKreia, TRUE, TRUE, TRUE));

			DelayCommand(3.2, AssignCommand(oMira, SetFacingPoint(GetPosition(oKreia))));	//DelayCommand(1.9, 
			DelayCommand(3.2, AssignCommand(oVisas, SetFacingPoint(GetPosition(oKreia))));
			DelayCommand(3.2, AssignCommand(oHand, SetFacingPoint(GetPosition(oKreia))));
			DelayCommand(3.2, AssignCommand(oHanharr, SetFacingPoint(GetPosition(oKreia))));
			DelayCommand(3.2, AssignCommand(oDisciple, SetFacingPoint(GetPosition(oKreia))));
			DelayCommand(3.2, Flourish(oHand));
			DelayCommand(3.2, Flourish(oMira));
			DelayCommand(3.2, Flourish(oHanharr));
			DelayCommand(3.2, Flourish(oVisas));
			DelayCommand(3.2, Flourish(oDisciple));
			DelayCommand(1.9, RedLightsaber(oKreia, 1));
			//DelayCommand(1.5, RedLightsaber(oVisas, 1));
			//DelayCommand(1.5, RedLightsaber(oDisciple, 1));
			//DelayCommand(1.5, RedLightsaber(oHand, 1));
			//DelayCommand(1.5, RedLightsaber(oMira, 1));
			DelayCommand(4.5, ActionResumeConversation());
		break;
		case 11:	//Mira was blown away, she returns to her position
			AssignCommand(oMira, ActionForceMoveToLocation(GetLocation(GetObjectByTag("wp_kreia_mira_2")), TRUE));
		break;
		case 12:	//Party slowly flourish weapons, one by one
			AssignCommand(oMira, SetFacingPoint(GetPosition(oKreia)));
			AssignCommand(oVisas, SetFacingPoint(GetPosition(oKreia)));
			AssignCommand(oHand, SetFacingPoint(GetPosition(oKreia)));
			AssignCommand(oHanharr, SetFacingPoint(GetPosition(oKreia)));
			AssignCommand(oDisciple, SetFacingPoint(GetPosition(oKreia)));
			//Flourish(oHand);
			//Flourish(oMira);
			//Flourish(oHanharr);
			//Flourish(oVisas);
			//Flourish(oDisciple);
			SetLightsaberPowered(oHand, TRUE, TRUE, TRUE);
			SetLightsaberPowered(oMira, TRUE, TRUE, TRUE);
			SetLightsaberPowered(oDisciple, TRUE, TRUE, TRUE);
			SetLightsaberPowered(oVisas, TRUE, TRUE, TRUE);
		break;
		case 13:	//Everyone turns to Kreia
			AssignCommand(oMira, ActionDoCommand(SetFacingPoint(GetPosition(oKreia))));
			AssignCommand(oHanharr, ActionDoCommand(SetFacingPoint(GetPosition(oKreia))));
			AssignCommand(oHand, ActionDoCommand(SetFacingPoint(GetPosition(oKreia))));
			AssignCommand(oDisciple, ActionDoCommand(SetFacingPoint(GetPosition(oKreia))));
			AssignCommand(oVisas, ActionDoCommand(SetFacingPoint(GetPosition(oKreia))));
		break;
		case 15:	//Mira binoculars
			AssignCommand(oMira, JumpToLocation(Location(Vector(-0.35006, -73.43472, 0.79600), Deg(1.55308))));
			//oSion = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion002", Location(Vector(2.09315, 1.80278, 2.25750), Deg(-2.41027)));
			DelayCommand(3.0, AssignCommand(oSion, ActionPlayAnimation(10019)));
			DelayCommand(4.5, AssignCommand(oSion, ActionMoveToLocation(Location(Vector(9.05581, 8.33247, 0.47460), Deg(-2.36860)))));
			DelayCommand(7.0, DestroyObject(oSion));
			DelayCommand(1.3, AssignCommand(oHand, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_handisc_plan")))));
			DelayCommand(1.3, AssignCommand(oDisciple, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_handisc_plan")))));
			AssignCommand(oVisas, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_visas_plan"))));
			DelayCommand(3.9, AssignCommand(oAtton, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_atton_plan")))));
			DelayCommand(6.0, AssignCommand(oMira, ActionPlayAnimation(10039)));
		break;
		case 16:	//Sion leaves Kreia, party enters the core
			//oSion = CreateObject(OBJECT_TYPE_CREATURE, "n_darthsion002", Location(Vector(2.09315, 1.80278, 2.25750), Deg(-2.41027)));
			DelayCommand(3.0, AssignCommand(oSion, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
			DelayCommand(4.5, AssignCommand(oSion, ActionMoveToLocation(Location(Vector(9.05581, 8.33247, 0.47460), Deg(-2.36860)))));
			DelayCommand(7.0, DestroyObject(oSion));
			DelayCommand(1.6, AssignCommand(oHand, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_handisc_plan")))));
			DelayCommand(1.6, AssignCommand(oDisciple, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_handisc_plan")))));
			DelayCommand(1.0, AssignCommand(oVisas, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_visas_plan")))));
			DelayCommand(2.3, AssignCommand(oAtton, ActionMoveToLocation(GetLocation(GetObjectByTag("sp_atton_plan")))));
			DelayCommand(0.5, AssignCommand(oMira, ActionMoveToLocation(Location(Vector(-0.35006, -73.43472, 0.79600), Deg(1.55308)))));
		break;
		case 20:	//Cue in fight
			ChangeToStandardFaction(oKreia, 3);
			AddPartyMember(9, oVisas);
			AddPartyMember(4, oHand);
			AddPartyMember(11, oDisciple);
			AssignCommand(oMira, ClearAllActions());
			AssignCommand(oHanharr, ClearAllActions());
			AssignCommand(oHand, ClearAllActions());
			AssignCommand(oDisciple, ClearAllActions());
			AssignCommand(oVisas, ClearAllActions());
			AssignCommand(oKreia, ActionAttack(GetPartyLeader()));
			AssignCommand(oMira, ActionAttack(oKreia));
			AssignCommand(oHand, ActionAttack(oKreia));
			AssignCommand(oVisas, ActionAttack(oKreia));
			AssignCommand(oHanharr, ActionAttack(oKreia));
			AssignCommand(oDisciple, ActionAttack(oKreia));

			//DelayCommand(0.5, UnParalyze("VisasMarr"));
			//DelayCommand(0.5, UnParalyze("Mira"));
			//DelayCommand(0.5, UnParalyze("Handmaiden"));
			//DelayCommand(0.5, UnParalyze("Disciple"));
			//DelayCommand(0.5, UnParalyze("Hanharr"));
		break;
	}

/*

		case 5:		//Obsolete Atton attacks/runs
			//AssignCommand(oAtton, ActionUseTalentOnObject(TalentFeat(8), oKreia));
			AssignCommand(oAtton, PlayOverlayAnimation(oAtton, 10572));
			AssignCommand(oAtton, ActionMoveToObject(GetObjectByTag("wp_kreia_atton_2"), TRUE, 0.1));

			//AssignCommand(oKreia, SetFacingPoint(GetPosition(GetObjectByTag("wp_kreia_atton_2"))));
		break;
		case 6:		//Obsolete Kreia strikes back

		//Party Members move to Attack
			AssignCommand(oHand, ActionMoveToObject(oKreia, FALSE, 0.1));
			AssignCommand(oDisciple, ActionMoveToObject(oKreia, FALSE, 0.1));
			DelayCommand(0.2, AssignCommand(oVisas, ActionMoveToObject(oKreia, FALSE, 0.1)));
			DelayCommand(0.2, AssignCommand(oMira, ActionMoveToObject(oKreia, FALSE, 0.1)));
			DelayCommand(0.2, AssignCommand(oHanharr, ActionMoveToObject(oKreia, FALSE, 0.1)));
			AssignCommand(oAtton, ActionMoveToObject(GetObjectByTag("wp_kreia_atton_3"), FALSE, 0.1));

			//AssignCommand(oKreia, ActionUseTalentOnObject(TalentSpell(23), oAtton));

			//SetLightsaberPowered(oKreia, TRUE, TRUE, FALSE);
			SetMinOneHP(oAtton, FALSE);
			AssignCommand(oAtton, SetIsDestroyable(TRUE, FALSE, FALSE));

			//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityIncrease(4, 100), oKreia, 5.0);
			//DelayCommand(1.75, AssignCommand(oKreia, ClearAllActions()));
			//AssignCommand(oKreia, ActionCastFakeSpellAtObject(23, oAtton, PROJECTILE_PATH_TYPE_DEFAULT));

		//Kreia casts spell
			AssignCommand(oKreia, ActionPlayAnimation(121, 1.0, 0.0));

		//Pushes Atton
			effect efPush = EffectForcePushTargeted(GetLocation(oKreia), 1);
			efPush = EffectLinkEffects(efPush, EffectVisualEffect(1014, 0));
			DelayCommand(0.5, ApplyEffectToObject(1, efPush, oAtton, 0.4));
			DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oAtton));

		//Freezes everyone else
			DelayCommand(0.5, Paralyze("VisasMarr"));
			DelayCommand(0.5, Paralyze("Mira"));
			DelayCommand(0.5, Paralyze("Handmaiden"));
			DelayCommand(0.5, Paralyze("Disciple"));
			DelayCommand(0.5, Paralyze("Hanharr"));

			//DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectCutSceneParalyze(), GetFirstPC()));

		break;
*/
}