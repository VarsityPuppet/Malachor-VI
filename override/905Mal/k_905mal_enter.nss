#include "k_inc_bead-v"
#include "k_arm_debug"





void StealthedSith(){
	object oAss1;
	object oAss2;
	object oAss3;
	object oAss4;

	if(GetPosition(GetFirstPC()).y > (-6.2)){
		oAss1 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-69.49178, -3.97544, 3.0), Deg(0.48950)));
		oAss2 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-71.84470, -2.07434, 3.0), Deg(0.30227)));
		oAss3 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-71.84398, 0.61880, 3.0), Deg(0.11435)));
		oAss4 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-74.32719, -3.69842, 3.0), Deg(0.36092)));
		DelayCommand(0.5, AssignCommand(oAss1, ActionAttack(GetFirstPC())));
		DelayCommand(0.6, AssignCommand(oAss2, ActionAttack(GetFirstPC())));
		DelayCommand(0.7, AssignCommand(oAss3, ActionAttack(GetFirstPC())));
		DelayCommand(0.8, AssignCommand(oAss4, ActionAttack(GetFirstPC())));
	}
	else{
		oAss1 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-62.70734, -11.22673, 3.0), Deg(-1.02280)));
		oAss2 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-62.23328, -10.15845, 3.0), Deg(-1.02280)));
		oAss3 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-63.41080, -9.43327, 3.0), Deg(-1.02280)));
		oAss4 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithass002", Location(Vector(-63.26902, -8.08737, 3.0), Deg(-1.02280)));
		DelayCommand(1.0, AssignCommand(GetObjectByTag("md02-14"), ActionOpenDoor(GetObjectByTag("md02-14"))));
		DelayCommand(2.4, AssignCommand(oAss1, ActionAttack(GetFirstPC())));
		DelayCommand(2.9, AssignCommand(oAss2, ActionAttack(GetFirstPC())));
		DelayCommand(3.4, AssignCommand(oAss3, ActionAttack(GetFirstPC())));
		DelayCommand(3.9, AssignCommand(oAss4, ActionAttack(GetFirstPC())));
		//DelayCommand(9.0, AssignCommand(GetObjectByTag("md02-14"), ActionCloseDoor(GetObjectByTag("md02-14"))));

	}
}

void FireEntryCutscene(){
	SetGlobalFadeOut(0.0,0.0);
HoldWorldFadeInForDialog();
	object oBoss = CreateObject(OBJECT_TYPE_CREATURE, "g_intro_sl", GetLocation(GetObjectByTag("sp_intro_sl")));
	object o905Intro = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_905intro", GetLocation(GetObjectByTag("sp_intro_sl")));
	object oPassedOut = GetObjectByTag("sleepguy");


	if(GetGlobalNumber("000_JoinKreia") == 1){
		//SpawnAvailableNPC(4, GetLocation(GetObjectByTag("wp_vsa_1")));
		CreateObject(1, "c_vshandmaiden", GetLocation(GetObjectByTag("wp_vsa_1")));
		SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_cage_cell")));
	}
	else if(GetGlobalNumber("000_JoinKreia") == 2){
		//SpawnAvailableNPC(0, GetLocation(GetObjectByTag("wp_vsa_1")));
		CreateObject(1, "c_vsatton", GetLocation(GetObjectByTag("wp_vsa_2")));
		SpawnAvailableNPC(11, GetLocation(GetObjectByTag("sp_cage_cell")) );
	}
	if(!GetIsObjectValid(GetObjectByTag("Handmaiden")))
		object oHand = SpawnAvailableNPC(4, GetLocation(GetObjectByTag("sp_cage_hand")) );

	if(!GetIsObjectValid(GetObjectByTag("Mira")))
		object oMira = SpawnAvailableNPC(7, GetLocation(GetObjectByTag("sp_cage_mira")) );

	if(!GetIsObjectValid(GetObjectByTag("VisasMarr")))
		object oVisas = SpawnAvailableNPC(9, GetLocation(GetObjectByTag("sp_cage_visas")) );

	if(!GetIsObjectValid(GetObjectByTag("Hanharr")))
		object oHanh = SpawnAvailableNPC(10, GetLocation(GetObjectByTag("sp_cage_mira")) );

	if(!GetIsObjectValid(GetObjectByTag("Disciple")))
		object oDisc = SpawnAvailableNPC(11, GetLocation(GetObjectByTag("sp_cage_hand")) );

	AssignCommand(oPassedOut, ActionPlayAnimation(10079, 1.0, -1.0));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oPassedOut);

	if(GetIsObjectValid(oBoss)){
		DelayCommand(0.5, AssignCommand(oBoss, ActionStartConversation(GetFirstPC(), "905intro", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}

}

void BarracksSith(){

	object oDancerM = GetObjectByTag("barrackscom", 1);
	object oDancerF = GetObjectByTag("barrackscom");
	object oLockerSith1 = GetObjectByTag("locker1");
	object oLockerSith2 = GetObjectByTag("locker2");
	object oLockerSith3 = GetObjectByTag("locker3");
	object oPassedOut = GetObjectByTag("sleepguy");
	object oSoberSith = GetObjectByTag("guard");
	object oPlayerDoor = GetObjectByTag("pazaak1");
	object oPlayerPrison = GetObjectByTag("pazaak2");
	object oCrowd1 = GetObjectByTag("crowd");
	object oCrowd2 = GetObjectByTag("crowd", 1);
	object oCrowd3 = GetObjectByTag("crowd", 2);
	object oCrowd4 = GetObjectByTag("crowd", 3);
	object oInvis = GetObjectByTag("Invisible");


	AssignCommand(oDancerM, ActionPlayAnimation(ANIMATION_LOOPING_DANCE, 1.0, -1.0));
	AssignCommand(oPlayerDoor, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, -1.0));
	AssignCommand(oPlayerPrison, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE_STAND, 1.0, -1.0));
	AssignCommand(oCrowd1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, -1.0));
	AssignCommand(oCrowd2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, -1.0));
	AssignCommand(oCrowd3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, -1.0));
	AssignCommand(oCrowd4, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, -1.0));
	AssignCommand(oLockerSith1, ActionPlayAnimation(ANIMATION_LOOPING_TREAT_INJURED, 1.0, -1.0));
	AssignCommand(oLockerSith2, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));
	AssignCommand(oLockerSith3, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));


}


void main(){
	if(GetEnteringObject() == GetFirstPC()){

	BarracksSith();
	if(GetLoadFromSaveGame())
		return;

		if(CheckRunDeBug() == 1)
			return;

		int iFirst = GetLocalBoolean(GetModule(), 20);
		if(!iFirst){
			SetLocalBoolean(GetModule(), 20, TRUE);
			FireEntryCutscene();
		}

	}

}