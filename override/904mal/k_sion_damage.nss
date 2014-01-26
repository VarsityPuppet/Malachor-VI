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



int GetAlivePartyMemberCount(){

	int nCount = 0;
	int Alive = 0;

	object oParty = GetPartyMemberByIndex(nCount);
	
	while(nCount <= GetPartyMemberCount()){

		if (GetCurrentHitPoints(oParty) > 0){
			Alive++;
			SendMessageToPC(GetPartyLeader(), GetTag(oParty) + " " + IntToString(GetHP(oParty)) + "percent");
		}

		nCount++;
		oParty = GetPartyMemberByIndex(nCount);
	}
	SendMessageToPC(GetPartyLeader(), IntToString(Alive) + " are Alive");
	return Alive;
}

void main(){
        ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DAMAGE);
	int PMLive = GetAlivePartyMemberCount();

	if(!GetLocalNumber(GetObjectByTag("Atton_fake"), 13) > 0){
		if(GetLocalNumber(GetObjectByTag("Atton_fake"), 13) == 0 && GetIsObjectValid(GetObjectByTag("DarthSion")) && GetHP(GetObjectByTag("DarthSion")) <= 5){
			SetLocalNumber(GetObjectByTag("Atton_Fake"), 13, 2);
			SetGlobalFadeOut(0.0);
			NoClicksFor(1.5);
			AssignCommand(GetObjectByTag("Atton"), ClearAllActions());
			AssignCommand(GetObjectByTag("DarthSion"), ClearAllActions());
			AssignCommand(GetObjectByTag("Atton"), ClearAllEffects());
			AssignCommand(GetObjectByTag("DarthSion"), ClearAllEffects());
			CancelCombat(GetObjectByTag("Atton"));
			CancelCombat(GetObjectByTag("DarthSion"));
			AssignCommand(GetObjectByTag("Atton"), ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_atton_2", 0))));
			AssignCommand(GetObjectByTag("DarthSion"), ActionJumpToLocation(GetLocation(GetObjectByTag("wp_avs_sion_1", 0))));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("Atton_fake"), ActionStartConversation(GetObjectByTag("Atton_fake"), "904postfight", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		}
	}
}





