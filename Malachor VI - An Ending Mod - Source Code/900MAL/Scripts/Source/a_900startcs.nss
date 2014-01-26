void Blink(float ftime, float fdur);

void main() {

int Param1 = GetScriptParameter(1);

switch (Param1){

	case 0:
		ActionPauseConversation();
		//AssignCommand(GetFirstPC(), ActionPlayAnimation(10079, 1.0, 10.0));
		DelayCommand(3.0, ActionResumeConversation());
	break;
	case 1:
		ActionPauseConversation();
		//AssignCommand(GetFirstPC(), SetFacing(0.00));
		//AssignCommand(GetFirstPC(), ActionPlayAnimation(10316, 0.5, -1.0));
		AssignCommand(GetFirstPC(), ActionPlayAnimation(10022, 0.75));
		DelayCommand(2.5, ActionResumeConversation());
	break;
	case 2:
		ActionPauseConversation();
		SetGlobalFadeOut(2.0, 2.0);
		AssignCommand(GetFirstPC(), SetFacing(270.00));
		SetLockOrientationInDialog(GetFirstPC(), TRUE);
		AssignCommand(GetFirstPC(), ActionPlayAnimation(10079, -0.25, 34.0));
		DelayCommand(4.0, ActionResumeConversation());
	break;
	case 3:
		ActionPauseConversation();
		AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("InvisibleLocationMark2")));
		DelayCommand(0.6, AssignCommand(GetFirstPC(), SetFacing(0.00)));
		DelayCommand(0.6, AssignCommand(GetFirstPC(), ActionForceMoveToLocation(Location(Vector(44.7078486633301, 37.6219940185547, 1.80000019073486), 0.0), FALSE, 0.50)));
		DelayCommand(3.5, AssignCommand(GetFirstPC(), ActionPlayAnimation(10022, 2.0)));
		DelayCommand(4.0, ActionResumeConversation());

	break;
	case 4:
		ActionPauseConversation();
		AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("InvisibleLocationMark3")));
		DelayCommand(0.6, AssignCommand(GetFirstPC(), ActionForceMoveToObject(GetObjectByTag("from_901MAL"), FALSE, 0.0, 10.40)));
		DelayCommand(4.0,  AssignCommand(GetFirstPC(), ClearAllActions()));
		DelayCommand(4.4, AssignCommand(GetFirstPC(), SetFacingPoint(GetPosition(GetObjectByTag("T3M4")))));
		//DelayCommand(2.7, AssignCommand(GetFirstPC(), ActionPlayAnimation(10291, 0.5)));
		DelayCommand(5.3, AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("T3M4"))));
		DelayCommand(5.0, SetLockOrientationInDialog(GetFirstPC(), FALSE));
		DelayCommand(5.5, ActionResumeConversation());

	break;
	case 5:
		ActionPauseConversation();
		ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SPEED), GetFirstPC(), 5.0);
		SetGlobalFadeIn(1.0, 2.0);
		Blink(3.0, 0.2);
		Blink(4.0, 0.2);
		Blink(4.6, 0.02);
		Blink(5.0, 0.02);
		Blink(5.3, 0.3);
		Blink(5.5, 0.01);
		//AssignCommand(GetFirstPC(), ActionPlayAnimation(10079, 1.0, 10.0));
		DelayCommand(20.0, ActionResumeConversation());
	break;
	case 6:
		ActionPauseConversation();
		//DelayCommand(0.0,  AssignCommand(GetFirstPC(), ClearAllActions()));
		DelayCommand(0.0, AssignCommand(GetFirstPC(), ActionPlayAnimation(10316, 0.5, 0.5)));
		DelayCommand(4.0, ActionResumeConversation());
	break;
	case 7:
		ActionPauseConversation();
		DelayCommand(10.5, AssignCommand(GetFirstPC(), ClearAllActions()));
		DelayCommand(10.5, AssignCommand(GetObjectByTag("T3M4"), ClearAllActions()));
		DelayCommand(10.5, ActionResumeConversation());
		DelayCommand(10.53, AssignCommand(GetFirstPC(), ActionStartConversation(GetObjectByTag("T3M4"))));
	}
}

void Blink(float ftime, float fdur){

		DelayCommand(ftime, SetGlobalFadeOut(fdur, fdur));
		DelayCommand(ftime + fdur, SetGlobalFadeIn(fdur, fdur));


}
