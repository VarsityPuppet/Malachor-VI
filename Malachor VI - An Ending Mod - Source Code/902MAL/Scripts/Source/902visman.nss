object Object(string sTag){
	
	return GetObjectByTag("sTag", 0);
}

void main() {
	int nParam1 = GetScriptParameter(1);
	object oMand = GetObjectByTag("Mand", 0);
	object oVisas = GetObjectByTag("VisasMarr", 0);

	switch (nParam1) {
		case 0:
			ActionPauseConversation();
			SetGlobalNumber("902MAL_Cutscene", 2);
			SetGlobalFadeIn(1.0, 4.0, 0.0, 0.0, 0.0);
			ChangeObjectAppearance(oMand, 462);
			SetLockOrientationInDialog(oMand, 1);
			SetLockOrientationInDialog(oVisas, 1);
			AssignCommand(oVisas, ClearAllActions());
			AssignCommand(oMand, ClearAllActions());
			DelayCommand(0.25, AssignCommand(oVisas, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_visas")), FALSE)));
			DelayCommand(0.25, AssignCommand(oMand, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_mand")), FALSE)));
			DelayCommand(15.6, AssignCommand(oMand, ClearAllActions()));
			DelayCommand(15.7, AssignCommand(oMand, SetFacingPoint(GetPosition(GetWaypointByTag("WP_SithAssassin2")))));

			DelayCommand(7.0, ActionResumeConversation());
			break;
		case 1:
			AssignCommand(oVisas, SetFacing(90.0));
			break;
		case 2:
			DelayCommand(2.9, AssignCommand(oMand, SetFacingPoint(GetPosition(oVisas))));
			break;
		case 3:
			DelayCommand(7.6, AssignCommand(oVisas, SetFacingPoint(GetPosition(oMand))));
			DelayCommand(7.7, SetDialogPlaceableCamera(41));
			break;
		case 4:
			DelayCommand(1.0, AssignCommand(oMand, SetFacing(270.0)));
			break;
		case 5:
			//Visas turns to Trayus, nods
			AssignCommand(oVisas, SetFacing(90.0));
			DelayCommand(1.0, AssignCommand(oVisas, ActionPlayAnimation(10466)));
			DelayCommand(2.1, AssignCommand(oVisas, ActionMoveToLocation(GetLocation(GetWaypointByTag("WP_SithAssassin2")), FALSE)));
			break;
		case 6:
			//Visas starts walking to trayus
			//AssignCommand(oVisas, ActionMoveToLocation(GetLocation(GetWaypointByTag("WP_SithAssassin2")), FALSE));
			break;
		case 7:
			//Mand walks away from Academy
			//DelayCommand(1.5, AssignCommand(oMand, ActionMoveToLocation(GetLocation(GetWaypointByTag("sp_mand")), FALSE)));

			//Alternate: Mand runs to catch up with Visas
			DelayCommand(1.5, AssignCommand(oMand, ActionMoveToLocation(GetLocation(GetWaypointByTag("WP_SithAssassin2")), TRUE)));
			SetGlobalFadeOut(1.5, 3.0, 0.0, 0.0, 0.0);

			break;
		case 8:
			//Housecleaning
			SetNPCSelectability(2, 0);
			SetNPCSelectability(9, 0);
			DestroyObject(oMand); DestroyObject(oVisas);
			StartNewModule("901mal");
			break;
		case 9:
			ActionPauseConversation();
			DelayCommand(0.5, AssignCommand(oMand, SetFacingPoint(GetPosition(GetWaypointByTag("WP_SithAssassin2")))));
			DelayCommand(3.0, ActionResumeConversation());
			break;
		case 10:
			ActionPauseConversation();
			DelayCommand(0.5, AssignCommand(oMand, SetFacingPoint(GetPosition(Object("VisasMarr")))));
			DelayCommand(1.0, ActionResumeConversation());
			break;
	}
}









