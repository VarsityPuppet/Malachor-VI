object o901wp = GetObjectByTag("FROM_901MAL");


void sub2() {

	AssignCommand(GetFirstPC(), ClearAllActions());
	AssignCommand(GetFirstPC(), ActionDoCommand(ActionJumpToObject(o901wp, FALSE)));
	SetCameraFacing(GetFacing(GetFirstPC()));
	SetNPCSelectability(7,0);
}

void main() {
	int nParam1 = GetScriptParameter(1);
	object oLeader = GetPartyLeader();
	object oHanharr2 = GetObjectByTag("Hanharr2", 0);


	switch (nParam1) {
		case 0:
			AssignCommand(oLeader, SetFacing(0.0));
			DelayCommand(0.4, AssignCommand(oLeader, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_mira")), 0)));
			SetLockOrientationInDialog(oLeader, 1);
			SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0);
			break;
		case 1:
			DelayCommand(0.4, AssignCommand(oHanharr2, ActionMoveToLocation(GetLocation( GetWaypointByTag("wp_hanharr") ), 0)));
			break;
		case 2:
                        {
       			object oPortcullis2 = GetObjectByTag("Portcullis1", 0);
			DelayCommand(0.5, AssignCommand(oPortcullis2, ActionCloseDoor(oPortcullis2)));
			DelayCommand(1.5, SetLocked(oPortcullis2, 1));
			oPortcullis2 = GetObjectByTag("Portcullis2", 0);
			DelayCommand(0.5, AssignCommand(oPortcullis2, ActionCloseDoor(oPortcullis2)));
			DelayCommand(1.5, SetLocked(oPortcullis2, 1));
			DelayCommand(2.0, ChangeToStandardFaction(oHanharr2, 1));
			DelayCommand(2.1, ActionAttack(oLeader));
			break;
                       }
		case 3:
			AssignCommand(oLeader, ActionDoCommand(SetFacingPoint(GetPosition( oHanharr2))));
			AssignCommand(oHanharr2, ActionDoCommand(SetFacingPoint(GetPosition(GetWaypointByTag("wp_mira")))));
			break;
		case 4:
                {
			SetGlobalFadeIn(0.5, 2.0, 0.0, 0.0, 0.0);
			AssignCommand(oHanharr2, ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC() ))));
			SetLockOrientationInDialog(oLeader, 1);
			SetLockOrientationInDialog(oHanharr2, 1);
			if (GetGlobalBoolean("MAL_TURNINTO_REMOTE")){ //If player is playing as Remote's solo mision
				object oPortcullis1 = GetObjectByTag("Portcullis2", 0);
				DelayCommand(0.5, SetLocked(oPortcullis1, 0));
				DelayCommand(2.0, AssignCommand(oPortcullis1, ActionOpenDoor(oPortcullis1)));
			}
                }
		case 5:
			AssignCommand(oLeader, ActionMoveToObject(GetObjectByTag("wp_mira_end", 0), 0, 1.0));
			DelayCommand(3.5, AssignCommand(oHanharr2, ActionDoCommand(SetFacingPoint(GetPosition(GetWaypointByTag("wp_mira_end"))))));
			break;
		case 6:
			SetGlobalFadeOut(0.5, 2.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			ApplyEffectToObject(0, EffectHeal(GetMaxHitPoints(GetFirstPC())), GetFirstPC(), 0.0);
			SetMinOneHP(GetFirstPC(), 0);
			//DelayCommand(0.2, sub1());
			//AssignCommand(oHanharr2, DelayCommand(3.0, sub1()));
			AssignCommand(oHanharr2, DelayCommand(3.2, sub2()));
			//DelayCommand(3.0, sub1());
			//DelayCommand(3.2, sub2());
			//DelayCommand(3.4, RemoteParty());	
			//DelayCommand(3.2, ExecuteScript("902mira_end", GetFirstPC()));
			break;
		case 7:
			AssignCommand(oHanharr2, ActionMoveToObject(GetObjectByTag("wp_hanharr_end", 0), 0, 1.0));
			DelayCommand(4.0, AssignCommand(oLeader, ActionMoveToObject(GetObjectByTag("wp_mira_end", 0), 0, 1.0)));
			break;
		case 8:
			CreatureFlourishWeapon(oLeader);
			DelayCommand(2.0, SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0));
			break;
		case 9:
			SetGlobalFadeIn(0.1, 0.5, 0.0, 0.0, 0.0);
			AssignCommand(oHanharr2, ActionPlayAnimation(26, 1.0, (-1.0)));
			break;
		case 10:
			AssignCommand(oLeader, ActionDoCommand(SetFacingPoint(GetPosition( oHanharr2))));
			DelayCommand(2.0, AssignCommand(oLeader, ActionDoCommand(SetFacingPoint(GetPosition( GetWaypointByTag("wp_hanharr"))))));
			DelayCommand(3.0, AssignCommand(oHanharr2, ActionDoCommand(SetFacingPoint(GetPosition(GetWaypointByTag("wp_mira"))))));
		break;
	}
}
