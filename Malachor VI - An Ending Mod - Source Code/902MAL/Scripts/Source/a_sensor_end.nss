void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 0:
			SetGlobalFadeIn(0.0, 1.0);
			SetCommandable(FALSE,GetObjectByTag("Remote"));
			AssignCommand(GetObjectByTag("Remote"), SetFacingPoint(GetPosition(GetObjectByTag("wp_baodur_end") ) ) );
			DelayCommand(2.0, AssignCommand(GetObjectByTag("BaoDur", 0), ActionJumpToObject(GetObjectByTag("wp_baodur_end", 0), 1)));
			DelayCommand(3.0, SetLockOrientationInDialog(GetObjectByTag("BaoDur"), TRUE));
			SetLockOrientationInDialog(GetObjectByTag("HK47"), TRUE);
		break;
		case 1:
			AssignCommand(GetObjectByTag("g0t0", 0), ActionMoveToObject(GetObjectByTag("wp_goto", 0), 0, 1.0));
		break;
		case 2:
			//DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur", 0), ActionJumpToObject(GetObjectByTag("wp_baodur_move", 0), 1)));
			SetLockOrientationInDialog(GetObjectByTag("G0T0"), TRUE);
			DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur", 0), ActionJumpToObject(GetObjectByTag("wp_baodur_move", 0), 1)));

		break;
		case 3:
			CreateObject(1, "p_g0t001", GetLocation(GetWaypointByTag("sp_goto")), 0);

		break;
		case 4:

			DestroyObject(GetObjectByTag("BaoDur") );
			DelayCommand(0.5, AssignCommand(GetObjectByTag("G0t0"), SetFacingPoint(GetPosition(GetObjectByTag("Remote") ) ) ) );

		break;
		case 5:
			/*CreateObject(64, "plc_ring01", GetLocation(GetWaypointByTag("Wp_hk50_1")), 0);
			CreateObject(64, "plc_ring01", GetLocation(GetWaypointByTag("Wp_hk50_2")), 0);
			CreateObject(64, "plc_ring01", GetLocation(GetWaypointByTag("Wp_hk50_3")), 0);
			CreateObject(64, "plc_ring01", GetLocation(GetWaypointByTag("Wp_hk50_4")), 0);*/

			AssignCommand(GetObjectByTag("HK47"), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_end"))));

			if(IsAvailableCreature(5)){
				if(GetGlobalNumber("299TEL_Mission_Over") == 1 ){
					if(GetGlobalNumber("299TEL_HK51_Core") == 1) {
						CreateObject(1, "n_hk51_002", GetLocation(GetWaypointByTag("wp_hk50_1")), 0);
						CreateObject(1, "n_hk51_001", GetLocation(GetWaypointByTag("wp_hk50_2")), 0);
						CreateObject(1, "n_hk51_002", GetLocation(GetWaypointByTag("wp_hk50_3")), 0);
						CreateObject(1, "n_hk51_002", GetLocation(GetWaypointByTag("wp_hk50_4")), 0);
					}
					else{
					}
				}
				else if (GetGlobalNumber("299TEL_Mission_Over") == 0){
					CreateObject(1, "n_hk50_001", GetLocation(GetWaypointByTag("sp_hk50_1")), 0);
					CreateObject(1, "n_hk50_002", GetLocation(GetWaypointByTag("sp_hk50_2")), 0);
					CreateObject(1, "n_hk50_002", GetLocation(GetWaypointByTag("sp_hk50_3")), 0);
					CreateObject(1, "n_hk50_002", GetLocation(GetWaypointByTag("sp_hk50_4")), 0);
				}


			}
		break;
		case 6:
			DelayCommand(5.0, AssignCommand(GetObjectByTag("G0T0", 0), ActionMoveToObject(GetObjectByTag("wp_goto_end", 0), 0, 1.0)));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("G0T0"), SetFacing(GetFacing(GetObjectByTag("G0T0")) -90 )));
			DelayCommand(3.0, AssignCommand(GetObjectByTag("G0T0"), SetFacing(GetFacing(GetObjectByTag("G0T0")) -90 )));
			//Waypoint tracker

			AssignCommand(GetObjectByTag("HK51",0), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_end"))));
			AssignCommand(GetObjectByTag("HK51",1), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_end"))));
			AssignCommand(GetObjectByTag("HK51",2), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_end"))));
			AssignCommand(GetObjectByTag("HK51_1",0), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_end"))));
		break;
		case 7:
			AssignCommand(GetObjectByTag("HK50", 0), ActionMoveToObject(GetObjectByTag("wp_hk50_2", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK50_1", 0), ActionMoveToObject(GetObjectByTag("wp_hk50_1", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK50", 1), ActionMoveToObject(GetObjectByTag("wp_hk50_3", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK50", 2), ActionMoveToObject(GetObjectByTag("wp_hk50_4", 0), 0, 0.1));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK50", 0), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK50", 1), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK50", 2), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
		break;
		case 8:

			AssignCommand(GetObjectByTag("HK51", 0), ActionMoveToObject(GetObjectByTag("wp_hk50_2", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK51_1", 0), ActionMoveToObject(GetObjectByTag("wp_hk50_1", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK51", 1), ActionMoveToObject(GetObjectByTag("wp_hk50_3", 0), 0, 0.1));
			AssignCommand(GetObjectByTag("HK51", 2), ActionMoveToObject(GetObjectByTag("wp_hk50_4", 0), 0, 0.1));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK51", 0), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK51", 1), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
			DelayCommand(5.0, AssignCommand(GetObjectByTag("HK51", 2), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
		break;
		case 10:
			ChangeToStandardFaction(GetObjectByTag("HK51_1",0) , 2);
			ChangeToStandardFaction(GetObjectByTag("HK51", 0), 2);
			ChangeToStandardFaction(GetObjectByTag("HK51", 1), 2);
			ChangeToStandardFaction(GetObjectByTag("HK51", 2), 2);
			ChangeToStandardFaction(GetObjectByTag("HK50_1",0) , 2);
			ChangeToStandardFaction(GetObjectByTag("HK50", 0), 2);
			ChangeToStandardFaction(GetObjectByTag("HK50", 1), 2);
			ChangeToStandardFaction(GetObjectByTag("HK50", 2), 2);
			ChangeToStandardFaction(GetObjectByTag("G0t0"), 3);
                        SetMinOneHP(GetObjectByTag("HK47"),TRUE);
			SetMinOneHP(GetObjectByTag("G0t0"),TRUE);
			ExecuteScript("k_ai_master", GetObjectByTag("G0T0",0), 1003);

                        ExecuteScript("k_ai_master", GetObjectByTag("HK50", 0), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK50", 1), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK50", 2), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK50_1", 0), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK51", 0), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK51", 1), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK51", 2), 1003);
                        ExecuteScript("k_ai_master", GetObjectByTag("HK51_1", 0), 1003);


			object oDoor = GetObjectByTag("ShipDoor");
			AssignCommand(oDoor,ActionLockObject(oDoor));
			AssignCommand(oDoor,ActionCloseDoor(oDoor));
		break;
		case 11:
			SetGlobalNumber("907MAL_CUTSCENE", 4);
			StartNewModule("904Mal", "sp_visas_plan");
		break;
		case 12:
			/*CreatureFlourishWeapon(GetObjectByTag("HK47"));
			CreatureFlourishWeapon(GetObjectByTag("HK50",0));
			CreatureFlourishWeapon(GetObjectByTag("HK50",1));
			CreatureFlourishWeapon(GetObjectByTag("HK50",2));
			CreatureFlourishWeapon(GetObjectByTag("HK50_1",0));
			CreatureFlourishWeapon(GetObjectByTag("HK51",0));
			CreatureFlourishWeapon(GetObjectByTag("HK51",1));
			CreatureFlourishWeapon(GetObjectByTag("HK51",2));
			CreatureFlourishWeapon(GetObjectByTag("HK51_1",0));*/
		break;
		case 13:
			AssignCommand(GetObjectByTag("G0t0", 0), ClearAllActions());
			DelayCommand(0.0, AssignCommand(GetObjectByTag("G0t0", 0), ActionJumpToObject(GetObjectByTag("wp_goto_dead", 0), 1)));

			AssignCommand(GetObjectByTag("HK47", 0), ActionJumpToObject(GetObjectByTag("sp_hk47", 0), 1));
			DelayCommand(0.1, AssignCommand(GetObjectByTag("HK47", 0), SetFacingPoint(GetPosition(GetObjectByTag("wp_goto_dead")))));


			if(GetGlobalNumber("902MassShadow_End") == 1){
				SetMinOneHP(GetObjectByTag("G0t0"), FALSE);
				DelayCommand(0.1, AssignCommand(GetObjectByTag("G0t0", 0), SetFacing(180.00))); 
				DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), GetObjectByTag("G0t0")));
				DelayCommand(0.5, SetCommandable(FALSE, GetObjectByTag("G0t0")));

			}

			else if(GetGlobalNumber("902MassShadow_End") == 2){
				DelayCommand(0.3, AssignCommand(GetObjectByTag("G0t0", 0), SetFacingPoint(GetPosition(GetObjectByTag("HK47")))));
				DelayCommand(0.5, SetCommandable(FALSE, GetObjectByTag("G0t0")));
			}

		break;
		case 14:
			DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FORCE_WAVE), GetLocation(GetObjectByTag("G0t0"))));
		break;
		case 15:
			SetGlobalFadeIn(0.0,0.5);

		break;
		case 16:
			SetGlobalFadeOut(0.0,2.0);	
		break;
		case 17:
				//AssignCommand(GetObjectByTag("G0t0"), ActionJumpToObject(GetObjectByTag("wp_goto_dead")));
				//DelayCommand(0.1, AssignCommand(GetObjectByTag("G0t0"),  SetFacing(180.00)));

				//DelayCommand(0.3, AssignCommand(GetObjectByTag("G0t0"),  ActionPlayAnimation(26, 1.0, -1.0)));


		break;


	}
}












