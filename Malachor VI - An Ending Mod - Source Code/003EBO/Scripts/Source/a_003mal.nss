// Prototypes
void sub1(object objectParam1);

void sub1(object objectParam1) {
	CreateObject(1, "g_sithass002", GetLocation(objectParam1), 0);
}

void main() {
	int nParam1 = GetScriptParameter(1);
	object oKreiaEvil = GetObjectByTag("KreiaEvil", 0);
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	switch (nParam1) {
		case 0:
			SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0);

			break;
		case 1:
			{
			PlayMovie("MalMov08");
			}
			break;
		case 2:
			DelayCommand(3.0, SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0));
			break;
		case 3:
			{
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC());
				DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC()));
				DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC()));
				DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC()));
				DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC()));
				DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE), GetFirstPC()));
				//PlaySound(string sSoundName);
				location wp900pc2 = GetLocation(GetFirstPC());
				object Boomshaker = CreateObject(OBJECT_TYPE_PLACEABLE, "boomshaker", wp900pc2);			}
			break;
		case 4:
			//location wp900pc = Location(Vector(53.35632, 77.23396, 0.04610), 90.00);
			location wp900pc = Location(Vector(49.93120, 70.11452, 1.8000), 90.00);
			AssignCommand(GetFirstPC(), ActionForceMoveToLocation(wp900pc, FALSE, 5.50));
			//SetCommandable(FALSE, GetObjectByTag("Atton"));
			SetGlobalFadeOut(1.0, 2.0);

			break;
		case 5:
			{
				object oSp_kreia = GetObjectByTag("sp_kreia", 0);
				AssignCommand(oKreiaEvil, ClearAllActions());
				AssignCommand(oKreiaEvil, ActionJumpToLocation(GetLocation(oSp_kreia)));
				AssignCommand(oKreiaEvil, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_kreia_start")), 0));
			}
			break;
		case 6:
			SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0);
			location wp900pc1 = Location(Vector(53.35632, 77.03396, 0.04610), 90.00);
			AssignCommand(GetFirstPC(), ActionForceMoveToLocation(wp900pc1, FALSE, 9.00));

			break;
		case 7:
			SetGlobalFadeOut(1.0, 2.0, 0.0, 0.0, 0.0);
			DelayCommand(3.0, ExecuteScript("a_cleanup", OBJECT_SELF, 0xFFFFFFFF));
			DelayCommand(3.0, StartNewModule("003EBO", "", "", "", "", "", "", ""));
			break;
		case 8:
			ActionPauseConversation();
			AssignCommand(oDarthSion, ClearAllActions());
			AssignCommand(oKreiaEvil, PlayAnimation(10459, 1.0, 0.0));
			AssignCommand(oDarthSion, ActionPlayAnimation(10460, 1.0, (-1.0)));
			DelayCommand(1.0, AssignCommand(oDarthSion, ActionPlayAnimation(116, 1.0, (-1.0))));
			DelayCommand(3.5, ActionResumeConversation());
			break;
		case 9:
			ApplyEffectToObject(1, EffectParalyze(), oDarthSion, 15.0);
			break;
		case 10:

			SetGlobalNumber("907MAL_CUTSCENE", 3);
			DelayCommand(0.3, SetGlobalFadeOut());
			PlayMovie("MalMov08");
			StartNewModule("907MAL", "", "", "", "", "", "", "");
			break;
	}
}




















