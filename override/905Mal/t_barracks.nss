void main(){
	object oPC = GetFirstPC();
	object oDLG = GetObjectByTag("905dlghost");
	location wDoor1 = Location(Vector(-58.784904480, -24.032024384, 3.0), -141.171020508);
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

	AssignCommand(oDancerM, ClearAllActions());
	AssignCommand(oDancerF, ClearAllActions());
	//ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oPassedOut);
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

	SetGlobalFadeOut();
	SetFadeUntilScript();
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, JumpToLocation(wDoor1));
	AssignCommand(oDLG, ActionStartConversation(oDLG, "905barracks"));
}