void main(){




	int param1 = GetScriptParameter(1);



		switch(param1){
			case 0:
				SetGlobalFadeIn(0.1, 1.5);
				AssignCommand(GetObjectByTag("Atton"), ActionMoveToObject(GetObjectByTag("wp_avs_atton_2"), TRUE, 0.1));
				AssignCommand(GetObjectByTag("DarthSion"), ActionMoveToObject(GetObjectByTag("wp_avs_sion_1"), TRUE, 0.1));
				CreateObject(OBJECT_TYPE_PLACEABLE, "attsion_atton", GetLocation(GetObjectByTag("wp_avs_atton_4")));
				SetLockOrientationInDialog(GetObjectByTag("Atton"), TRUE);

			break;
			case 1:
				AssignCommand(GetFirstPC(), SetFacingPoint(GetPosition(GetObjectByTag("DarthSion"))));

			break;
			case 2:
				ChangeToStandardFaction(GetObjectByTag("DarthSion"), 1);
				SetMinOneHP(GetFirstPC(), TRUE);
				SetLocalNumber(GetObjectByTag("Atton_fake"), 20, 1);
				AssignCommand(GetFirstPC(), ActionAttack(GetObjectByTag("DarthSion")));
			break;
			case 3:
				object oSion = GetObjectByTag("DarthSion", 0);
				object oAtton = GetFirstPC();
				SetGlobalFadeIn(2.0, 2.0);

				CancelCombat(oAtton);
				CancelCombat(oSion);
				AssignCommand(oAtton, ClearAllActions());
				AssignCommand(oSion, ClearAllActions());
				AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_atton_2", 0))));
				AssignCommand(oSion, ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_sion_1", 0))));
				SetLightsaberPowered(oSion, 1);
				SetLightsaberPowered(oAtton, 1);
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oAtton)), oAtton);

				ChangeToStandardFaction(oAtton, 2);
				ChangeToStandardFaction(oSion, 4);
				AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 114, ATTACK_RESULT_PARRIED, 0)));
				AssignCommand(oSion, ActionWait(0.7));
				AssignCommand(oSion, ActionDoCommand(CutsceneAttack(oAtton, 410, ATTACK_RESULT_MISS, 0)));
				AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 411, ATTACK_RESULT_MISS, 0)));
				AssignCommand(oSion, ActionDoCommand(CutsceneAttack(oAtton, 123, ATTACK_RESULT_MISS, 0)));
				AssignCommand(oAtton, ActionDoCommand(CutsceneAttack(oSion, 115, ATTACK_RESULT_HIT_SUCCESSFUL, 0)));
				//AssignCommand(oAtton, CutsceneAttack(oSion, 117,, 0));

				DelayCommand(5.0, SetDialogPlaceableCamera(11));
				DelayCommand(8.4, AssignCommand(oSion, ClearAllActions()));
				DelayCommand(8.4, CancelCombat(oSion));
				DelayCommand(8.4, AssignCommand(oSion, ActionPlayAnimation(26, 1.0, 10.0)));
				DelayCommand(9.4, AssignCommand(oAtton, ClearAllActions()));
				DelayCommand(9.4, CancelCombat(oAtton));
				DelayCommand(9.9, AssignCommand(oAtton, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT)));

				DelayCommand(12.0, SetDialogPlaceableCamera(15));
				DelayCommand(12.5, AssignCommand(oAtton, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_avs_atton_3", 0)), TRUE)));

				DelayCommand(15.0, SetDialogPlaceableCamera(12));

				DelayCommand(22.0, AssignCommand(oSion, ActionPlayAnimation(ANIMATION_FIREFORGET_SCREAM)));

				DelayCommand(26.0, AssignCommand(oSion, ActionMoveToLocation(GetLocation(GetObjectByTag("wp_pfc_sion_1", 0)), FALSE)));

				SetGlobalFadeOut(28.0, 2.0);


			break;


		}



}