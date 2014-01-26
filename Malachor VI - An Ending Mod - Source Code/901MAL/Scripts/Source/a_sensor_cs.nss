void main() {
	int nParam1 = GetScriptParameter(1);

	object oBaoDur = GetObjectByTag("BaoDur") ;
	object sBaoDur = GetWaypointByTag("sp_baodur");


	switch (nParam1) {
		case 0:
			SetGlobalNumber("901MAL_REMOTE", 1);
			DestroyObject(GetObjectByTag("tr_remote_bao"));
			DelayCommand(1.0, AssignCommand(GetPartyLeader(), ActionMoveToObject(GetObjectByTag("wp_remote_move", 0), 0)));
			SetLockOrientationInDialog(GetObjectByTag("BaoDur", 0), 1);
			AssignCommand(GetObjectByTag("BaoDur", 0), SetFacing(GetFacing(GetWaypointByTag("wp_baodur"))));
			object oRemote = GetObjectByTag("Remote", 0);
			effect efSpeedInc = EffectMovementSpeedIncrease(99);
			ApplyEffectToObject(2, efSpeedInc, oRemote, 0.0);
			SetCommandable(TRUE, oRemote);
			//SetMinOneHP(GetPartyLeader(), 0);
			break;
		case 1:
			DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur", 0), ActionJumpToObject(GetWaypointByTag("wp_baodur"))));
			break;
		case 2:	
			AssignCommand(GetObjectByTag("BaoDur"), SetIsDestroyable(TRUE, FALSE, FALSE));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur"), ActionJumpToLocation(GetLocation(sBaoDur))));
			DelayCommand(2.0, DestroyObject(GetObjectByTag("BaoDur"), 0.0));

		break;
		case 3:
			SetGlobalNumber("901MAL_REMOTE", 0);
	
			AssignCommand(GetObjectByTag("Remote"), ClearAllActions());
			AssignCommand(GetObjectByTag("Remote"), SetIsDestroyable(TRUE, FALSE, FALSE));
			DelayCommand(0.4, AssignCommand(GetObjectByTag("Remote", 0), ActionMoveToObject(GetObjectByTag("wp_remopc"), TRUE, 0.5)));

			DelayCommand(8.0, DestroyObject(GetObjectByTag("Remote"),  0.0));

		break;
		case 4:	
			SetGlobalNumber("901MAL_REMOTE", 1);
			SetNPCSelectability(1,TRUE);	
			AddAvailableNPCByObject(1, GetObjectByTag("Remote", 0) );

			AddPartyMember(1, GetObjectByTag("Remote") );
		break;
	}
}




