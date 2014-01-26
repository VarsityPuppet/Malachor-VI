	int iParam = GetScriptParameter(1);
	object oPC = GetFirstPC();
	location wPC1 = Location(Vector(-60.934162140, -25.973459244, 3.0), -142.545913696);
	location wInvis = Location(Vector(-59.515407562, -31.721879959, 3.0), 26.35376358);
	location wRunto = Location(Vector(-69.597, -30.69502, 3.0), 26.35376358);
	location wRunto2 = Location(Vector(-68.2557, -32.41918, 3.0), 26.35376358);

	object oDancerM = GetObjectByTag("barrackscom", 1);
	object oDancerF = GetObjectByTag("barrackscom");
	object oLockerSith1 = GetObjectByTag("locker1");
	object oLockerSith2 = GetObjectByTag("locker2");
	object oLockerSith3 = GetObjectByTag("locker3");
	object oPassedOut = GetObjectByTag("sleepguy");
	object oSoberSith = GetObjectByTag("guard");
	object oPlayerDoor = GetObjectByTag("pazaak1");
	object oPlayerPrison = GetObjectByTag("pazaak2");
	object oCrowd1 = GetObjectByTag("crowd");
	object oCrowd2 = GetObjectByTag("crowd", 1);
	object oCrowd3 = GetObjectByTag("crowd", 2);
	object oCrowd4 = GetObjectByTag("crowd", 3);
	object oInvis = GetObjectByTag("Invisible");


void Narei(float fDelay, string sTag, int nNum){

	object oCreature = GetObjectByTag(sTag, nNum);
	DelayCommand(fDelay + 0.6, AssignCommand(oCreature, SetFacingPoint(GetPosition(GetFirstPC()))));
}


void main(){


	switch(iParam){
		case 0:
			AssignCommand(oDancerM, ClearAllActions());
			AssignCommand(oDancerF, ClearAllActions());
			AssignCommand(oPassedOut, ClearAllActions());
			AssignCommand(oPlayerDoor, ClearAllActions());
			AssignCommand(oPlayerPrison, ClearAllActions());
			AssignCommand(oCrowd1, ClearAllActions());
			AssignCommand(oCrowd2, ClearAllActions());
			AssignCommand(oCrowd3, ClearAllActions());
			AssignCommand(oCrowd4, ClearAllActions());
			AssignCommand(oLockerSith1, ClearAllActions());
			AssignCommand(oLockerSith2, ClearAllActions());
			AssignCommand(oLockerSith3, ClearAllActions());

		break;
		case 1:
			SetGlobalFadeIn();
			DelayCommand(1.5, AssignCommand(oPC, ActionMoveToLocation(wPC1)));
			SetLockOrientationInDialog(oDancerF, TRUE);
			SetLockOrientationInDialog(oDancerM, TRUE);
			SetLockOrientationInDialog(oPassedOut, TRUE);

			CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invis", wInvis);
		break;
		case 2:
			AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT));
		break;
		case 3:
			DestroyObject(oInvis);
		break;
		case 4:
			AssignCommand(oDancerM, ActionPlayAnimation(ANIMATION_LOOPING_DANCE, 1.0, 10.0));
			AssignCommand(oDancerF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE1, 1.0, 10.0));
		break;
		case 5:

			AssignCommand(oDancerM, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oDancerF, SetFacingPoint(GetPosition(GetFirstPC())));
			//ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oPassedOut);
			//AssignCommand(oPassedOut, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oPlayerDoor, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oPlayerPrison, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oCrowd1, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oCrowd2, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oCrowd3, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oCrowd4, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oLockerSith1, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oLockerSith2, SetFacingPoint(GetPosition(GetFirstPC())));
			AssignCommand(oLockerSith3, SetFacingPoint(GetPosition(GetFirstPC())));

			DestroyObject(GetItemInSlot(4, oPlayerDoor));
			DestroyObject(GetItemInSlot(4, oPlayerPrison));


			/*StopandNotice();*/


			//SendMessageToPC(GetFirstPC(), "I'm Firing, I dunno what's up");
		break;
		case 6:
			AssignCommand(oPlayerDoor, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 10.0));
			AssignCommand(oPlayerPrison, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE_STAND, 1.0, 10.0));
			AssignCommand(oCrowd1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 10.0));
			AssignCommand(oCrowd2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 10.0));
			AssignCommand(oCrowd3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 10.0));
			AssignCommand(oCrowd4, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 10.0));
		break;
		case 7:
			//AssignCommand(oPassedOut, ActionPlayAnimation(10375, 1.0, -1.0));
			//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPassedOut, 4.0);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oPassedOut);
		break;
		case 8:
			AssignCommand(oLockerSith1, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, 10.0));
			AssignCommand(oLockerSith2, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, 10.0));
			AssignCommand(oLockerSith3, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, 10.0));
		break;
		case 9:
			ChangeToStandardFaction(oDancerM, 1);
			ChangeToStandardFaction(oDancerF, 1);
			ChangeToStandardFaction(oPlayerDoor, 1);
			ChangeToStandardFaction(oPlayerPrison, 1);
			ChangeToStandardFaction(oCrowd1, 1);
			ChangeToStandardFaction(oCrowd2, 1);
			ChangeToStandardFaction(oCrowd3, 1);
			ChangeToStandardFaction(oCrowd4, 1);
			ChangeToStandardFaction(oLockerSith1, 1);
			ChangeToStandardFaction(oLockerSith2, 1);
			ChangeToStandardFaction(oLockerSith3, 1);
			ChangeToStandardFaction(oSoberSith, 1);
		break;
		case 10:
			AssignCommand(oDancerM, ClearAllActions());
			AssignCommand(oDancerF, ClearAllActions());
			DelayCommand(0.25, AssignCommand(oDancerM, ActionMoveToLocation(wRunto, TRUE)));
			DelayCommand(1.0, AssignCommand(oDancerF, ActionMoveToLocation(wRunto, TRUE)));
		break;
		case 11:
		break;
	}
}