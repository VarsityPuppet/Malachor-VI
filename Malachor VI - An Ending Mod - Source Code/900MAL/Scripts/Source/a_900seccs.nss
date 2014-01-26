void Talk(object Facing, object Listener);

void main() {

 int param1 = GetScriptParameter(1);

object oAtton = GetObjectByTag("Atton");
object oCand = GetObjectByTag("Mand");
object oBrianna = GetObjectByTag("Handmaiden");
object oMira = GetObjectByTag("Mira");
object oVisas = GetObjectByTag("VisasMarr");
object oHanharr = GetObjectByTag("Hanharr");
object oMical = GetObjectByTag("Disciple");

object oCenter = GetObjectByTag("wp_center");

object oHK47 = GetObjectByTag("HK47");
object oG0T0 = GetObjectByTag("G0T0");
object oT3M4 = GetObjectByTag("T3M4");
object oRemote = GetObjectByTag("Remote");

	switch (param1){
		case 0:
			SpawnAvailableNPC( 0, GetLocation(GetObjectByTag("wp_atton") ));
			SpawnAvailableNPC( 2, GetLocation(GetObjectByTag("wp_mand") ));
			SpawnAvailableNPC( 4, GetLocation(GetObjectByTag("wp_hand") ));
			SpawnAvailableNPC( 7, GetLocation(GetObjectByTag("wp_mira") ));
			SpawnAvailableNPC( 9, GetLocation(GetObjectByTag("wp_visas") ));
			SpawnAvailableNPC( 10, GetLocation(GetObjectByTag("wp_hanh") ));
			SpawnAvailableNPC( 11, GetLocation(GetObjectByTag("wp_disc") ));

			/*SetCommandable(TRUE, oAtton);
			SetCommandable(TRUE, oMira);
			SetCommandable(TRUE, oCand);
			SetCommandable(TRUE, oVisas);
			SetCommandable(TRUE, oBrianna);
			SetCommandable(TRUE, oHanharr);
			SetCommandable(TRUE, oMical);

			SetLockOrientationInDialog(oAtton, TRUE);
			SetLockOrientationInDialog(oCand, TRUE);
			SetLockOrientationInDialog(oBrianna, TRUE);
			SetLockOrientationInDialog(oMira, TRUE);
			SetLockOrientationInDialog(oVisas, TRUE);
			SetLockOrientationInDialog(oHanharr, TRUE);
			SetLockOrientationInDialog(oMical, TRUE);*/
			
			Talk(oCenter, oAtton);
			Talk(oCenter, oMira);
			Talk(oCenter, oBrianna);
			Talk(oCenter, oCand);
			Talk(oCenter, oVisas);
			Talk(oCenter, oMical);

		break;
		case 1:



			AssignCommand(oAtton, SetFacingPoint(GetPosition(oCenter)));
			AssignCommand(oMira, SetFacingPoint(GetPosition(oCenter)));
			AssignCommand(oCand, SetFacingPoint(GetPosition(oCenter)));
			AssignCommand(oVisas, SetFacingPoint(GetPosition(oMira)));
			AssignCommand(oHanharr, SetFacingPoint(GetPosition(oCenter)));
			AssignCommand(oBrianna, SetFacingPoint(GetPosition(oMira)));
			AssignCommand(oMical, SetFacingPoint(GetPosition(oCenter)));

		break;
		case 2:
			ActionPauseConversation();
			EnableVideoEffect(1);
			AssignCommand(oMira, ActionPlayAnimation(5, 1.0, -1.0));
			//DelayCommand(8.00, AssignCommand(oVisas, SetFacingPoint(GetPosition(oAtton))));
			//DelayCommand(8.00, AssignCommand(oBrianna, SetFacingPoint(GetPosition(oAtton))));
			//DelayCommand(8.00, AssignCommand(oMical, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(8.0, AssignCommand(oAtton, ActionPlayAnimation(5, 1.0, -1.0)));

			DelayCommand(9.00, AssignCommand(oMira, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(10.50, AssignCommand(oVisas, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(10.00, AssignCommand(oBrianna, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(10.2, AssignCommand(oMical, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(10.30, AssignCommand(oCand, SetFacingPoint(GetPosition(oAtton))));

			DelayCommand(15.00, AssignCommand(oCand, ActionPlayAnimation(7, 1.0, -1.0)));
			DelayCommand(16.0, AssignCommand(oVisas, SetFacingPoint(GetPosition(oCand))));
			DelayCommand(16.50, AssignCommand(oBrianna, SetFacingPoint(GetPosition(oCand))));
			DelayCommand(16.35, AssignCommand(oMical, SetFacingPoint(GetPosition(oCand))));
			DelayCommand(16.2, AssignCommand(oMira, SetFacingPoint(GetPosition(oCand))));

			DelayCommand(25.00, AssignCommand(oCand, ActionForceMoveToObject(GetObjectByTag("wp_offscreen"), FALSE, 0.5, 30.00)));

			DelayCommand(27.00, AssignCommand(oAtton, SetFacingPoint(GetPosition(GetObjectByTag("wp_offscreen")))));
			DelayCommand(26.00, AssignCommand(oMira, ClearAllActions()));
			DelayCommand(27.00, AssignCommand(oMira, SetFacingPoint(GetPosition(GetObjectByTag("wp_offscreen"))))); 
			DelayCommand(27.5, AssignCommand(oBrianna, SetFacingPoint(GetPosition(GetObjectByTag("wp_offscreen")))));
			DelayCommand(27.75, AssignCommand(oVisas, SetFacingPoint(GetPosition(GetObjectByTag("wp_offscreen")))));
			DelayCommand(28.00, AssignCommand(oMical, SetFacingPoint(GetPosition(GetObjectByTag("wp_offscreen")))));
			DelayCommand(28.00, AssignCommand(oAtton, ActionPlayAnimation(104, 1.0)));

			DelayCommand(30.00, AssignCommand(oMira, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(30.00, AssignCommand(oBrianna, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(30.00, AssignCommand(oMical, SetFacingPoint(GetPosition(oAtton))));
			DelayCommand(31.00, AssignCommand(oVisas, ActionForceMoveToObject(GetObjectByTag("wp_offscreen"), FALSE, 0.5, 30.00)));

			DelayCommand(32.00, AssignCommand(oAtton, SetFacingPoint(GetPosition(oMira))));

			DelayCommand(34.3, AssignCommand(oAtton, ActionPlayAnimation(10472, 1.0)));	

			DelayCommand(35.6, AssignCommand(oMira, ActionPlayAnimation(7, 1.0, -1.0)));				DelayCommand(35.6, AssignCommand(oBrianna, ActionPlayAnimation(7, 1.0, -1.0)));		
			//DelayCommand(26.00, AssignCommand(oMira, ActionPlayAnimation(7, 1.0, -1.0)));
			//DelayCommand(27.00, AssignCommand(oAtton, ActionPlayAnimation(7, 1.0, -1.0)));


			
			//DelayCommand(
			DelayCommand(42.0, ActionResumeConversation());
		break;
		case 3:
			AssignCommand(oMira, ActionJumpToObject(GetObjectByTag("sp_miraramp")));
		break;
		case 4:
			ActionPauseConversation();
			EnableVideoEffect(1);
			AssignCommand(oMira, ActionForceMoveToObject(GetObjectByTag("wp_miraramp"), FALSE, 0.5, 8.00));
			DelayCommand(5.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), oMira));
			DelayCommand(5.0, AssignCommand(oMira, ActionPlayAnimation(10079, 1.0, 5.0)));
			DelayCommand(6.0, SetGlobalFadeOut(0.0, 0.0));
			DelayCommand(10.0, SetGlobalFadeIn(0.0, 0.0));
			DelayCommand(10.0, ActionResumeConversation());
		break;
		case 5: //Clearing out the stage
			DisableVideoEffect();
			AssignCommand(oMira, ActionJumpToObject(GetObjectByTag("wp_mira")));
			AssignCommand(oVisas, ActionJumpToObject(GetObjectByTag("wp_visas")));
			AssignCommand(oCand, ActionJumpToObject(GetObjectByTag("wp_mand")));
			AssignCommand(GetObjectByTag("sec_system"), ActionStartConversation(GetFirstPC()));
		break;
		case 6:
				int int2 = 0;
				while ((int2 <= 12)) {
	
					//DestroyObject(GetPartyMemberByIndex(int2));
					RemoveNPCFromPartyToBase(int2);
					//SetNPCSelectability(int2, 0);

				(int2++);
				}
		break;
	}
}

void Talk(object Facing, object Listener){

	SetCommandable(TRUE, Listener);
	SetLockOrientationInDialog(Listener, TRUE);
	SetLockHeadFollowInDialog(Listener, FALSE);

}