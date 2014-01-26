void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 0:
			object oKreia = GetObjectByTag("KreiaEvil");
			object oSion = GetObjectByTag("DarthSion");
			SetGlobalFadeIn(0.5, 2.0, 0.0, 0.0, 0.0);
			SetLockOrientationInDialog(oKreia, 1);
			SetLockOrientationInDialog(oSion, 1);
			AssignCommand(oKreia, SetFacing(-65.0));
			AssignCommand(oKreia, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
			AssignCommand(oSion, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_sion_start")), 0));
			DelayCommand(7.4, SetGlobalFadeOut(0.0, 2.0));
			DelayCommand(10.4, AssignCommand(oSion, SetDialogPlaceableCamera(27)));
			DelayCommand(10.4, AssignCommand(oSion, ClearAllActions()));
			DelayCommand(10.5, AssignCommand(oSion, ActionJumpToObject(GetObjectByTag("sp_sith2", 0))));
			DelayCommand(11.6, AssignCommand(oSion, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_sion_start")), 0)));
			DelayCommand(11.6, SetGlobalFadeIn(0.0, 1.4));


			/*SetDialogPlaceableCamera(1);
			int i = 1;
			while(i<=46){
				DelayCommand(i*4.0, SetDialogPlaceableCamera(i));
				i++;
			}*/
			break;
		case 1:
			SetGlobalFadeOut(0.0, 3.0);
			//DelayCommand(3.4, AssignCommand(GetObjectByTag("darthsion"), ActionJumpToLocation(Location(Vector(0.94324, 3.10226, 2.25750), 175.73761))));
			DelayCommand(4.0, ExecuteScript("a_cleanup", OBJECT_SELF, 0xFFFFFFFF));
			DelayCommand(4.0, StartNewModule("900MAL", "", "", "", "", "", "", ""));
			break;
		case 2:
			SetGlobalFadeIn(0.5, 2.0, 0.0, 0.0, 0.0);
			CreateObject(1, "g_sithassarre", Location(Vector(-11.41516, 5.35886, 0.47460), -25.8919627619619));
			DelayCommand(0.3, SetLockOrientationInDialog(GetObjectByTag("sithassarre"), 1));
			AssignCommand(GetObjectByTag("DarthSion"), SetFacingPoint(GetPosition(GetObjectByTag("KreiaEvil"))));
			DelayCommand(2.0, AssignCommand(GetObjectByTag("DarthSion"), SetFacingPoint(GetPosition(GetObjectByTag("sithassarre")))));
			DelayCommand(0.5, AssignCommand(GetObjectByTag("sithassarre"), ActionMoveToLocation(Location(Vector(-4.12917, 2.28083, 1.84940), -27.2521645676), 0)));
			break;
		case 3:
			DelayCommand(0.5, AssignCommand(GetObjectByTag("sithassarre"), ActionMoveToLocation(Location(Vector(-11.41516, 5.35886, 0.47460), -25.8919627619619), 0)));
			DelayCommand(2.8, DestroyObject(GetObjectByTag("sithassarre")));
			DelayCommand(4.0, AssignCommand(GetObjectByTag("DarthSion"), SetFacingPoint(GetPosition(GetObjectByTag("KreiaEvil")))));
			break;
		case 4:
			AssignCommand(GetObjectByTag("KreiaEvil"), SetFacingPoint(GetPosition(GetObjectByTag("DarthSion"))));
			DelayCommand(0.4, AssignCommand(GetObjectByTag("KreiaEvil"), ActionMoveToLocation(Location(Vector(0.94324, 3.10226, 2.25750), 175.73761), 0)));
			DelayCommand(3.4, AssignCommand(GetObjectByTag("KreiaEvil"), ActionPlayAnimation(10468)));
			DelayCommand(5.6, AssignCommand(GetObjectByTag("KreiaEvil"), ActionPlayAnimation(107)));
			break;
		case 5:
			AssignCommand(GetObjectByTag("KreiaEvil"), SetFacing(-65.0));
			DelayCommand(0.4, AssignCommand(GetObjectByTag("KreiaEvil"), ActionMoveToObject(GetObjectByTag("wp_kreia_start", 0), 0, 0.0)));
			break;
		case 6:
			AssignCommand(GetObjectByTag("DarthSion"), ActionMoveToLocation(Location(Vector(-11.41516, 5.35886, 0.47460), -25.8919627619619), 0));
			AssignCommand(GetObjectByTag("KreiaEvil"), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
			//SetGlobalFadeOut(1.0, 1.5);
			//clean-up
			break;
		case 7:
			//AssignCommand(GetObjectByTag("KreiaEvil"), ActionPlayAnimation(10040, 1.0, (-1.0)));
			break;
	}
}




