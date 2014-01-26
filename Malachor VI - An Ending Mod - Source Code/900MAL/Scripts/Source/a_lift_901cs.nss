void main() {

int Param1 = GetScriptParameter(1);

switch (Param1){

	case 0:
		ActionPauseConversation();
		SetGlobalFadeOut(2.0, 2.0);
		AssignCommand(GetFirstPC(), ActionPlayAnimation(10047, 0.50));
		DelayCommand(3.0, ActionResumeConversation());
	break;
	case 1:
		ActionPauseConversation();
		SetGlobalFadeIn(2.0, 2.0);
		AssignCommand(GetFirstPC(), ActionPlayAnimation(10047, -0.50));
		DelayCommand(4.0, ActionResumeConversation());
	break;
	case 2:
		ActionPauseConversation();
		AssignCommand(GetFirstPC(), ActionPlayAnimation(10563, 0.50));
		DelayCommand(2.0, ActionResumeConversation());
	break;
	case 3:

		SetLockOrientationInDialog(GetFirstPC(), TRUE);
		AssignCommand(GetFirstPC(), SetFacingPoint(GetPosition(GetObjectByTag("lift_to_901"))));

	break;
	case 4:

		SetLockOrientationInDialog(GetFirstPC(), FALSE);

	break;

	}


}