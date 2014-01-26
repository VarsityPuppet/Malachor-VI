#include "k_inc_bead-v.nss"

void RemoveStealth(object oObject){
	DelayCommand(0.0, ApplyEffectToObject(1, EffectVisualEffect(8001), oObject));
	DelayCommand(0.7, RemoveEffectByID(oObject, 8000));
}

void main(){
	int iSwitch = GetScriptParameter(1);
	int iCam1 = GetScriptParameter(2);
	int iCam2 = GetScriptParameter(3);
	int iCam3 = GetScriptParameter(4);
	object oPC = GetFirstPC();

	location wPC1 = Location(Vector(-110.779113769531, 22.049919128418, 3.0), 55.1207574284883);
	location wEliteAss = Location(Vector(-108.14030, 26.34786, 3.0), -120.90462);
	location wEliteAss2 = Location(Vector(-109.00507, 24.70858, 3.0), -118.00195);
	location wAss1 = Location(Vector(-106.33911, 25.21544, 3.0), -144.78650);
	location wAss2 = Location(Vector(-110.08302, 27.61456, 3.0), -96.75552);
	location wAss3 = Location(Vector(-116.20212, 23.65207, 3.0), -16.46980);
	location wAss4 = Location(Vector(-107.38910, 18.15092, 3.0), 130.38409);
	location wAss5 = Location(Vector(-105.94904, 21.69859, 3.0), 175.47772);
	location wAss6 = Location(Vector(-113.39588, 26.10321, 3.0), -57.30325);

	switch(iSwitch){
		case 0:	//Assasins spawn, get into positions
			ActionPauseConversation();

			SetGlobalFadeIn(0.2, 1.5);
			AssignCommand(oPC, ActionMoveToLocation(wPC1));
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushea", wEliteAss);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss1);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss2);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss3);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss4);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss5);
			SpawnObject(OBJECT_TYPE_CREATURE, "c_assbushsa", wAss6);
			DelayCommand(3.5, AssignCommand(oPC, SetFacingPoint(GetPosition(GetObjectByTag("assbushea")))));
			DelayCommand(3.0, RemoveStealth(GetObjectByTag("assbushea")));
			DelayCommand(3.5, RemoveStealth(GetObjectByTag("assbushsa", 0)));
			DelayCommand(3.8, RemoveStealth(GetObjectByTag("assbushsa", 1)));
			DelayCommand(4.3, RemoveStealth(GetObjectByTag("assbushsa", 2)));
			DelayCommand(2.8, RemoveStealth(GetObjectByTag("assbushsa", 3)));
			DelayCommand(4.0, RemoveStealth(GetObjectByTag("assbushsa", 4)));
			DelayCommand(3.2, RemoveStealth(GetObjectByTag("assbushsa", 5)));
			DelayCommand(6.0, SetDialogPlaceableCamera(iCam1));
			DelayCommand(6.5, AssignCommand(GetObjectByTag("assbushea"), ActionMoveToLocation(wEliteAss2)));
			DelayCommand(8.9, CreatureFlourishWeapon(GetObjectByTag("assbushea")));

			DelayCommand(9.0, ActionResumeConversation());
		break;
		case 1:	//Ready animation 2
			ActionPauseConversation();

			DelayCommand(0.9, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 0)));
			DelayCommand(0.7, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 1)));
			DelayCommand(0.8, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 2)));
			DelayCommand(0.6, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 3)));
			DelayCommand(0.5, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 4)));
			DelayCommand(1.0, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 5)));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushea"), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 0), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 1), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 2), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 3), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 4), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 5), 1));

			DelayCommand(1.5, ActionResumeConversation());
		break;
	}
}