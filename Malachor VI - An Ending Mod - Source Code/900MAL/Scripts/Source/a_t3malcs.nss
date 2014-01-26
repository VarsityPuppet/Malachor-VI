void main() {

int Param1 = GetScriptParameter(1);
object oT3M4 = GetObjectByTag("T3M4");

switch (Param1){


	case 0:
		ActionPauseConversation();
		SetGlobalFadeOut(1.0, 2.0);
		DelayCommand(1.0, ActionResumeConversation());
	break;
	case 1:
		ActionPauseConversation();
		SetGlobalFadeIn(1.0, 1.0);
		SetLockOrientationInDialog(oT3M4, TRUE);
		AssignCommand(oT3M4, SetFacingPoint(GetPosition(GetObjectByTag("lift_to_901"))));
		DelayCommand(4.0, ActionResumeConversation());
	break;
	case 2:
		AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("wp_pc_lift")));
		AssignCommand(oT3M4  , JumpToObject(GetObjectByTag("wp_t3_lift")));
		
	break;
	case 3:
		SetLockOrientationInDialog(oT3M4, FALSE);
		DelayCommand(0.1, AssignCommand(oT3M4  , ActionForceMoveToObject(GetObjectByTag("wp_t3_fix"), TRUE, 0.01, 30.0)));
		
		DelayCommand(5.5, SignalEvent(oT3M4, EventUserDefined(110)));
	break;
	case 4:
		SignalEvent(oT3M4, EventUserDefined(110));
	break;
	}


}


