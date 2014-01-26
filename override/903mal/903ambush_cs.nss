// Prototypes
void sub2();
void sub1();
void SithAmbush( int param1){
	string sI = IntToString(param1);

	object SithAss = CreateObject(OBJECT_TYPE_CREATURE, "sith_ambush1", GetLocation(GetObjectByTag("sp_sitham_" + sI )));

	SignalEvent(SithAss, EventUserDefined(200));
	SetFakeCombatState(SithAss, 1);
}

void StartAmbush(){
	object oAtton = SpawnAvailableNPC(0, GetLocation(GetObjectByTag("sp_atton_am")));
	object oHand = SpawnAvailableNPC(4, GetLocation(GetObjectByTag("sp_hand_am")));
	object oMira = SpawnAvailableNPC(7, GetLocation(GetObjectByTag("sp_mira_am")));

		DelayCommand(0.5, AssignCommand(oMira, ActionStartConversation(oAtton , "903ambush", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}

void ExileArrive() {
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	AssignCommand(oDarthSion, ClearAllActions());
	AssignCommand(oDarthSion, ActionStartConversation(GetFirstPC(), "903kreia", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
}

void BecomePC() {
	SwitchPlayerCharacter((-1));
}

void main() {


	object oAtton = GetObjectByTag("Atton", 0);
	object oMira = GetObjectByTag("Mira", 0);
	object oHand = GetObjectByTag("Handmaiden",0);
	object oMand = GetObjectByTag("Mand",0);
	object oVisas = GetObjectByTag("VisasMarr",0);

	int Param1 = GetScriptParameter(1);

	switch(Param1){


		case 0:
			AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("wp_party_am")));
			SetGlobalFadeIn(0.0, 4.0);
			SetLockOrientationInDialog(oAtton, TRUE);
			SetLockOrientationInDialog(oMira, TRUE);
			SetLockOrientationInDialog(oHand, TRUE);
			AssignCommand(oAtton, ActionMoveToObject(GetObjectByTag("wp_atton_am"), FALSE, 0.1));
			AssignCommand(oMira, ActionMoveToObject(GetObjectByTag("wp_mira_am"), FALSE, 0.1));
			AssignCommand(oHand, ActionMoveToObject(GetObjectByTag("wp_hand_am"), FALSE, 0.1));
		break;
		case 1:
			object oSneak = CreateObject(OBJECT_TYPE_CREATURE, "sith_ambush1", GetLocation(GetObjectByTag("sp_sithass_cs")));
			DelayCommand(0.5, SignalEvent(oSneak, EventUserDefined(100)));
			DelayCommand(2.0, AssignCommand(oSneak, ActionMoveToObject(GetObjectByTag("wp_sithass_cs"), FALSE, 0.1)));
		break;
		case 2:
			DelayCommand(0.7, AssignCommand(GetObjectByTag("SithAmbush"), ClearAllActions()));
			DelayCommand(0.9, DestroyObject(GetObjectByTag("SithAmbush")));
			DelayCommand(1.7, AssignCommand(GetObjectByTag("Atton"), ClearAllActions()));

			DelayCommand(2.5, AssignCommand(GetObjectByTag("Atton"), SetFacingPoint(GetPosition(GetObjectByTag("sp_atton_am")))));
			DelayCommand(3.2, AssignCommand(GetObjectByTag("Mira"), SetFacingPoint(GetPosition(GetObjectByTag("Atton")))));
			DelayCommand(3.5, AssignCommand(GetObjectByTag("Handmaiden"),  SetFacingPoint(GetPosition(GetObjectByTag("Atton")))));

		break;
		case 3:

			DelayCommand(3.5, AssignCommand(GetObjectByTag("Atton"), SetFacingPoint(GetPosition(GetObjectByTag("sp_sitham_1")))));
			DelayCommand(3.0, AssignCommand(GetObjectByTag("Mira"), SetFacingPoint(GetPosition(GetObjectByTag("sp_sitham_1")))));
			DelayCommand(3.2, AssignCommand(GetObjectByTag("Handmaiden"),  SetFacingPoint(GetPosition(GetObjectByTag("sp_sitham_1")))));
		break;
		case 4:

			int i = 1;
			while (i <= 2){//Can go up to 8
				float fadd = 0.3;//IntToFloat(4/Ran);
				

				if(i == 1){
					DelayCommand(i*fadd, SithAmbush(1));
					DelayCommand(i*fadd+4.7, CreatureFlourishWeapon(GetObjectByTag("SithAmbush")));
					DelayCommand(i*fadd+5.0, CreatureFlourishWeapon(GetObjectByTag("Atton")));
				}
				else{
					DelayCommand(i*fadd, SithAmbush(18 - i));
					DelayCommand(i*fadd, SithAmbush(i));
					DelayCommand(i*fadd+4.7, CreatureFlourishWeapon(GetObjectByTag("SithAmbush", i)));
					DelayCommand(i*fadd+5.0, CreatureFlourishWeapon(GetObjectByTag("Handmaiden")));
					DelayCommand(i*fadd+4.9, CreatureFlourishWeapon(GetObjectByTag("SithAmbush", i-1)));
					DelayCommand(i*fadd+5.2, CreatureFlourishWeapon(GetObjectByTag("Mira")));
				}


				
			i += 1;
			}
		break;
		case 5:
			object oSplash = GetObjectByTag("SithAmbush", 0);
			object oSplash1 = GetObjectByTag("SithAmbush", 1);
			object oSplash2 = GetObjectByTag("SithAmbush", 2);
			location lOrigin = GetLocation(oSplash);
			effect Explode = EffectVisualEffect(3003, FALSE);
			effect Death = EffectDeath(FALSE, TRUE, TRUE);
			ApplyEffectAtLocation(DURATION_TYPE_INSTANT, Explode, lOrigin);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, Death, oSplash);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, Death, oSplash1);
			ApplyEffectToObject(DURATION_TYPE_INSTANT, Death, oSplash2);
		break;
		case 6:
			AssignCommand(GetObjectByTag("Mand",0), ActionMoveToObject(GetObjectByTag("wp_mand_am"), FALSE, 0.1));
			AssignCommand(GetObjectByTag("VisasMarr",0), ActionMoveToObject(GetObjectByTag("wp_visas_am"), FALSE, 0.1));
		break;

		case 7:
			SetLockOrientationInDialog(GetObjectByTag("Mand", 0), TRUE);
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight1", GetLocation(GetObjectByTag("wp_fight1_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight2", GetLocation(GetObjectByTag("wp_fight2_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight3", GetLocation(GetObjectByTag("wp_fight3_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight4", GetLocation(GetObjectByTag("wp_fight4_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight5", GetLocation(GetObjectByTag("wp_fight5_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight6", GetLocation(GetObjectByTag("wp_fight6_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight7", GetLocation(GetObjectByTag("wp_fight7_am")));
			CreateObject(OBJECT_TYPE_CREATURE, "sith_fight8", GetLocation(GetObjectByTag("wp_fight8_am")));
			DelayCommand(0.5, AssignCommand(GetObjectByTag("Atton"), SetFacingPoint(GetPosition(GetObjectByTag("sp_atton_am")))));
			DelayCommand(0.3, AssignCommand(GetObjectByTag("Mira"), SetFacingPoint(GetPosition(GetObjectByTag("Atton")))));
			DelayCommand(0.7, AssignCommand(GetObjectByTag("Handmaiden"),  SetFacingPoint(GetPosition(GetObjectByTag("Atton")))));
		break;
		case 8:
			AssignCommand(GetObjectByTag("Mira",0), ActionMoveToObject(GetObjectByTag("wp_party_am"), TRUE, 0.1));
			DelayCommand(0.5, AssignCommand(GetObjectByTag("Handmaiden",0), ActionMoveToObject(GetObjectByTag("wp_party_am"), TRUE, 0.1)));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("Atton",0), ActionMoveToObject(GetObjectByTag("wp_party_am"), TRUE, 0.1)));
			AssignCommand(GetObjectByTag("VisasMarr",0), ActionMoveToObject(GetObjectByTag("wp_party_am"), TRUE, 0.1));

		break;
		case 9:
			SetLockOrientationInDialog(GetObjectByTag("Mand", 0), TRUE);
			AssignCommand(GetObjectByTag("Mand", 0), ActionMoveToObject(GetObjectByTag("wp_mandf_am"), FALSE, 0.1));
			int iI = 1;
			float fDel;
			DelayCommand(2.0, CreatureFlourishWeapon(GetObjectByTag("Mand")));
			while(iI <= 8){
				string sI = IntToString(iI);
				DelayCommand(2.5, AssignCommand(GetObjectByTag("SithFight" + sI, 0), SetFacingPoint(GetPosition(GetObjectByTag("Mand", 0)))));
				switch(iI){
					case 1:
						fDel = 0.6;
					break;
					case 2:
						fDel = 0.7;
					break;
					case 3:
						fDel = 0.2;
					break;
					case 4:
						fDel = 1.1;
					break;
					case 5:
						fDel = 0.9;
					break;
					case 6:
						fDel = 1.0;
					break;
					case 7:
						fDel = 0.4;
					break;
					case 8:
						fDel = 0.5;
					break;
				}
				DelayCommand(2.2 + fDel, CreatureFlourishWeapon(GetObjectByTag("SithFight" + sI)));
				iI++;
			}
		break;
		case 10:
			
			if(GetGlobalNumber("901MAL_REMOTE") ==1){
                        	SetGlobalNumber("902MAL_Cutscene", 3);
				SetGlobalFadeOut(0.8, 1.7);
				SetFadeUntilScript();
				DelayCommand(2.9, StartNewModule("902MAL", "sp_hk3"));
			}
			else if(GetGlobalNumber("901MAL_REMOTE") ==0){
                                SetGlobalBoolean("MAL_TURNINTO_REMOTE", 1);
				SetGlobalNumber("901MAL_REMOTE", 1);
				SetGlobalFadeOut(0.8, 1.7);
				SetFadeUntilScript();
				DelayCommand(2.9, StartNewModule("901MAL", "sp_remote_alt", "", "", "", "", "", ""));
			}
		break;
		case 11:
			SetLockOrientationInDialog(GetObjectByTag("Atton", 0), FALSE);
			DelayCommand(1.3, AssignCommand(GetObjectByTag("Mira",0), ActionMoveToObject(GetObjectByTag("wp_miral_am"), FALSE, 0.1)));
			DelayCommand(1.7, AssignCommand(GetObjectByTag("Handmaiden",0), ActionMoveToObject(GetObjectByTag("wp_handl_am"), FALSE, 0.1)));
			AssignCommand(GetObjectByTag("Atton",0), ClearAllActions());
			DelayCommand(2.3, AssignCommand(GetObjectByTag("Atton",0), ActionMoveToObject(GetObjectByTag("wp_attonl_am"), FALSE, 0.1)));
			DelayCommand(2.0, AssignCommand(GetObjectByTag("Mand",0), ActionMoveToObject(GetObjectByTag("wp_mandl_am"), FALSE, 0.1)));
		break;
	}
}


























