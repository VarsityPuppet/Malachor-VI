void PrepareBarracksGuy(){
	object oGuy = GetObjectByTag("SleepGuy");
	location wGuyLocation = Location(Vector(-65.495002747, -29.591926575, 3.0), -141.665206909);

	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(100), oGuy);
	AssignCommand(oGuy, ClearAllActions());
	AssignCommand(oGuy, ClearAllEffects());
	AssignCommand(oGuy, JumpToLocation(wGuyLocation));
}

void main(){

	int param1 = GetScriptParameter(1);

	object oDoor = GetObjectByTag("md01-10");

	switch(param1){
		case 0:
			AssignCommand(oDoor, ActionOpenDoor(oDoor));
			SetLockOrientationInDialog(GetFirstPC(), TRUE);
		break;
		case 1:
			AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("wp_intro_sl_2"), FALSE, 0.01));
		break;
		case 2:
			//SetGlobalFadeOut(1.0, 2.0);
		break;
		case 3:
			//SetGlobalFadeIn(0.0, 2.0);
			SetLockOrientationInDialog(GetFirstPC(), FALSE);
			PrepareBarracksGuy();
		break;
	}


}