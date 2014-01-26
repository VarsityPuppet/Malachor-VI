//:: k_def_combend01
/*
    On End of Combat Round Script
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_switch"
#include "k_inc_debug"

int GetHP(object oPerson){

int ratio = (GetCurrentHitPoints(oPerson)*100)/GetMaxHitPoints(oPerson);

	return ratio;

}

void BecomePC(){

	SwitchPlayerCharacter(-1);

}

void SpawnAtton(){
	if(GetGlobalNumber("904MAL_Atton_End") == 2){
		SpawnAvailableNPC(NPC_ATTON, GetLocation(GetObjectByTag("wp_avs_atton_4", 0)));
		CreateObject(OBJECT_TYPE_PLACEABLE, "attground", Location(Vector(-0.02730, -74.515167, 1.79600), 90.0));
		AssignCommand(GetObjectByTag("DarthSion"), JumpToLocation(GetLocation(GetObjectByTag("wp_avs_sion_2", 0))));
		AssignCommand(GetObjectByTag("DarthSion"), SetFacing(90.0));
	}
	else{
		SpawnAvailableNPC(NPC_ATTON, GetLocation(GetObjectByTag("wp_avs_atton_2", 0)));
		AssignCommand(GetObjectByTag("DarthSion"), JumpToLocation(GetLocation(GetObjectByTag("wp_avs_sion_1", 0))));
	}
}


void RunPostFight(){


	SetGlobalFadeOut(0.0);
	NoClicksFor(1.5);

//SendMessageToPC(GetFirstPC(), "Firing Postfight with: " + IntToString(GetGlobalNumber("904MAL_Atton_End")));

	AssignCommand(GetObjectByTag("Atton"), ClearAllActions());
	AssignCommand(GetObjectByTag("DarthSion"), ClearAllActions());
	AssignCommand(GetObjectByTag("Atton"), ClearAllEffects());
	AssignCommand(GetObjectByTag("DarthSion"), ClearAllEffects());
	
	CancelCombat(GetObjectByTag("Atton"));
	CancelCombat(GetObjectByTag("DarthSion"));
	ChangeToStandardFaction(GetObjectByTag("DarthSion"), 5);
	ChangeToStandardFaction(GetObjectByTag("Atton"), 2);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(GetObjectByTag("Atton"))), GetObjectByTag("Atton"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(GetObjectByTag("DarthSion"))), GetObjectByTag("DarthSion"));

	DelayCommand(0.2, BecomePC());

	DelayCommand(0.6, SpawnAtton());

	DelayCommand(0.4, AssignCommand(GetFirstPC(), ActionJumpToObject(GetObjectByTag("wp_exile_wait"))));
	DelayCommand(0.8, SetLockOrientationInDialog(GetObjectByTag("DarthSion"), 0));
	DelayCommand(0.8, SetLockOrientationInDialog(GetObjectByTag("Atton"), 0));
	DelayCommand(1.0, AssignCommand(GetObjectByTag("Atton_fake"), ActionStartConversation(GetObjectByTag("Atton_fake"), "904postfight", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));

}

int GetAlivePartyMemberCount(){

	int nCount = 0;
	int Alive = 0;

	object oParty = GetPartyMemberByIndex(nCount);
	
	while(nCount <= GetPartyMemberCount()){

		if (GetCurrentHitPoints(oParty) > 0){
			Alive++;
			//SendMessageToPC(GetPartyLeader(), GetTag(oParty) + " " + IntToString(GetHP(oParty)) + "percent");
		}

		nCount++;
		oParty = GetPartyMemberByIndex(nCount);
	}
	//SendMessageToPC(GetPartyLeader(), IntToString(Alive) + " are Alive");
	return Alive;
}

void Check()
{


int PMLive = GetAlivePartyMemberCount();

//SendMessageToPC(GetFirstPC(), "Atton's fate is: " + IntToString(GetGlobalNumber("904MAL_Atton_End")));

	if(GetGlobalNumber("904MAL_Atton_End") == 0){


		if(GetIsObjectValid(GetObjectByTag("DarthSion")) && GetHP(GetObjectByTag("DarthSion")) <= 5){
			SetGlobalNumber("904MAL_Atton_End", 1);
			RunPostFight();

		}

		if(GetTag(GetPartyLeader()) == "Atton" && GetHP(GetPartyLeader()) <= 5){
			SetGlobalNumber("904MAL_Atton_End", 2);
			RunPostFight();

	
		}



	}



}

void main(){


Check();
/*DelayCommand(0.25, Check());
DelayCommand(0.5, Check());
DelayCommand(0.75, Check());
DelayCommand(1.0, Check());
DelayCommand(1.25, Check());
DelayCommand(1.5, Check());
DelayCommand(1.75, Check());
DelayCommand(2.0, Check());
DelayCommand(2.25, Check());
DelayCommand(2.5, Check());
DelayCommand(2.75, Check());*/
	if(GetGlobalNumber("904MAL_Atton_End") == 0){
		DelayCommand(0.25, ExecuteScript("k_c_attsion", GetObjectByTag("904plancs")));
	}
	else{
		RemoveHeartbeat(OBJECT_SELF);
	}

}



