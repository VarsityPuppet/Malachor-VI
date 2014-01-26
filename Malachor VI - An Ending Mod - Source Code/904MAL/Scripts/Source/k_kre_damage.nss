//:: k_def_damage01
/*
    Default On Damaged Script
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_switch"
#include "k_inc_debug"

int DISC_ALIVE = 20;
int HAND_ALIVE = 21;
int VISAS_ALIVE = 22;
int HANHARR_ALIVE = 23;
int MIRA_ALIVE = 24;





int GetHP(object oPerson){

int ratio = (GetCurrentHitPoints(oPerson)*100)/GetMaxHitPoints(oPerson);

	return ratio;

}


void BecomeAtton(){

	if(GetIsObjectValid(GetObjectByTag("Atton"))){

		SwitchPlayerCharacter(0);
	}

	else{

		SwitchPlayerCharacter(-1);

	}
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

void CutsceneLocals(){

	if(GetCurrentHitPoints(GetObjectByTag("Disciple")) > 0){
		SetLocalNumber(GetObjectByTag("904plancs"), DISC_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Handmaiden")) > 0){
		SetLocalNumber(GetObjectByTag("904plancs"), HAND_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("VisasMarr")) > 0){
		SetLocalNumber(GetObjectByTag("904plancs"), VISAS_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Mira")) > 0){
		SetLocalNumber(GetObjectByTag("904plancs"), MIRA_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Hanharr")) > 0){
		SetLocalNumber(GetObjectByTag("904plancs"), HANHARR_ALIVE, 1);
	}
}

void main(){

	ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DAMAGE);

	if(!GetLocalNumber(GetObjectByTag("904plancs"), 12) > 0){

		if(GetHP(GetObjectByTag("Kreia")) <= 75){

			SetLocalNumber(GetObjectByTag("904plancs"), 12, 1);

			SetGlobalFadeOut(0.0,0.0);

			//ChangeToStandardFaction(GetObjectByTag("Kreia"), 5);


			AssignCommand(GetObjectByTag("Atton"), SetIsDestroyable(FALSE, TRUE, TRUE));
			DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(50), GetObjectByTag("Atton")));
			DelayCommand(0.4, BecomeAtton());

			SendMessageToPC(GetPartyLeader(), " Kreia down to 75");

			DelayCommand(1.0, AssignCommand(GetObjectByTag("904Plancs"), ActionStartConversation(GetObjectByTag("904Plancs"), "904defeat", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		}
			CutsceneLocals();
	}

}