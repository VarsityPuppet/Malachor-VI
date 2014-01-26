void Narei(float fDelay, string sTag, int nNum){

	object oCreature = GetObjectByTag(sTag, nNum);
	SetCommandable(TRUE, oCreature);
	//DelayCommand(fDelay + 0.2, AssignCommand(oCreature, ClearAllActions()));
	//DelayCommand(fDelay + 0.2, AssignCommand(oCreature, ClearAllEffects()));
	DelayCommand(fDelay + 0.4, ActionPlayAnimation(0, 1.0));
	DelayCommand(fDelay + 0.6, AssignCommand(oCreature, SetFacingPoint(GetPosition(GetFirstPC()))));
}

void StopandNotice(){

object oWitness = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(GetFirstPC()), OBJECT_TYPE_CREATURE);

	
	while(oWitness != OBJECT_INVALID){
		AssignCommand(oWitness, ClearAllActions());
		oWitness = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(GetFirstPC()), OBJECT_TYPE_CREATURE);
	}

}

void main(){
	int iParam = GetScriptParameter(1);
	object oPC = GetFirstPC();
	location wPC1 = Location(Vector(-60.934162140, -25.973459244, 3.0), -142.545913696);
	location wInvis = Location(Vector(-59.515407562, -31.721879959, 3.0), 26.35376358);

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

	switch(iParam){
		case 0:
			SetGlobalFadeIn();

			SetLockOrientationInDialog(oDancerF, TRUE);
			SetLockOrientationInDialog(oDancerM, TRUE);
			SetLockOrientationInDialog(oPassedOut, TRUE);

			CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invis", wInvis);

			AssignCommand(oDancerM, ActionPlayAnimation(ANIMATION_LOOPING_DANCE, 1.0, -1.0));
			AssignCommand(oDancerF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE1, 1.0, -1.0));
			//ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oPassedOut);
			AssignCommand(oPassedOut, ActionPlayAnimation(10375, 1.0, -1.0));
			AssignCommand(oPlayerDoor, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, -1.0));
			AssignCommand(oPlayerPrison, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE_STAND, 1.0, -1.0));
			AssignCommand(oCrowd1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, -1.0));
			AssignCommand(oCrowd2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, -1.0));
			AssignCommand(oCrowd3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, -1.0));
			AssignCommand(oCrowd4, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, -1.0));
			AssignCommand(oLockerSith1, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, -1.0));
			AssignCommand(oLockerSith2, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));
			AssignCommand(oLockerSith3, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));


			DelayCommand(1.5, AssignCommand(oPC, ActionMoveToLocation(wPC1)));
		break;
		case 1:
			AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT));
		break;
		case 2:
			DestroyObject(oInvis);
		break;
		case 3:
			AssignCommand(oDancerM, ActionPlayAnimation(ANIMATION_LOOPING_DANCE, 1.0));
			AssignCommand(oDancerF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE1, 1.0));
		break;
		case 4:
			Narei(0.9, "barrackscom", 1);
			Narei(1.0, "barrackscom", 0);
			Narei(1.2, "locker1",0);
			Narei(1.2, "crowd", 2);
			Narei(1.6, "crowd", 3);
			Narei(0.0, "pazaak2", 0);
			Narei(2.3, "crowd", 1);
			Narei(2.4, "locker2",0);
			Narei(3.1, "locker3",0);
			Narei(4.2, "pazaak1", 0);
			Narei(5.0, "crowd", 0);

			/*StopandNotice();*/


			SendMessageToPC(GetFirstPC(), "I'm Firing, I dunno what's up");
		break;
	}
}