//#include "k_inc_generic";

int DISC_ALIVE = 20;
int HAND_ALIVE = 21;
int VISAS_ALIVE = 22;
int HANHARR_ALIVE = 23;
int MIRA_ALIVE = 24;





int GetHP(object oPerson){

int ratio = (GetCurrentHitPoints(oPerson)*100)/GetMaxHitPoints(oPerson);

	return ratio;

}

void SetMinOneHPParty(int param){

	SetMinOneHP(GetObjectByTag("VisasMarr"), param);

	SetMinOneHP(GetObjectByTag("Mira"), param);
	SetMinOneHP(GetObjectByTag("Hanharr"), param);

	SetMinOneHP(GetObjectByTag("Handmaiden"), param);
	SetMinOneHP(GetObjectByTag("Disciple"), param);

	//SendMessageToPC(GetPartyLeader(), "SetMinOneHP at " + IntToString(param));

}



void BecomeAtton(){

	//if(IsAvailableCreature(0) ){

	//	SwitchPlayerCharacter(0);
	//}

	//else{

		SwitchPlayerCharacter(-1);

	//}
}

int GetAlivePartyMemberCount(){

	int nCount = 0;
	int Alive = 0;

	object oParty = GetPartyMemberByIndex(nCount);

	if(GetCurrentHitPoints(GetPartyMemberByIndex(0)) > 0)
		Alive++;

	if(GetCurrentHitPoints(GetPartyMemberByIndex(1)) > 0)
		Alive++;

	if(GetCurrentHitPoints(GetPartyMemberByIndex(2)) > 0)
		Alive++;

	//SendMessageToPC(GetPartyLeader(), IntToString(Alive) + " are Alive");

	return Alive;
}

void CutsceneLocals(){

	if(GetCurrentHitPoints(GetObjectByTag("Disciple")) > 0){
		SetLocalNumber(OBJECT_SELF, DISC_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Handmaiden")) > 0){
		SetLocalNumber(OBJECT_SELF, HAND_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("VisasMarr")) > 0){
		SetLocalNumber(OBJECT_SELF, VISAS_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Mira")) > 0){
		SetLocalNumber(OBJECT_SELF, MIRA_ALIVE, 1);
	}
	if(GetCurrentHitPoints(GetObjectByTag("Hanharr")) > 0){
		SetLocalNumber(OBJECT_SELF, HANHARR_ALIVE, 1);
	}
}


void Check(){

int PMLive = GetAlivePartyMemberCount();

	if(GetLocalNumber(OBJECT_SELF, 12) <= 0){

		if(GetHP(GetObjectByTag("Kreia")) <= 75){

			SetLocalNumber(OBJECT_SELF, 12, 1);
			CancelCombat(GetFirstPC());
			SetGlobalFadeOut(0.0,0.0);

			ChangeToStandardFaction(GetObjectByTag("Kreia"), 5);
			CutsceneLocals();

			AssignCommand(GetObjectByTag("Atton"), SetIsDestroyable(FALSE, TRUE, TRUE));
			DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(50), GetObjectByTag("Atton")));
			DelayCommand(0.4, BecomeAtton());
			DelayCommand(0.6, AssignCommand(GetFirstPC(), ClearAllActions()));
			DelayCommand(0.8, CancelCombat(GetFirstPC()));
			//SendMessageToPC(GetPartyLeader(), " Kreia down to 75");
			AssignCommand(GetObjectByTag("Kreia"), JumpToLocation(GetLocation(GetObjectByTag("sp_kreia"))));

			DelayCommand(1.0, AssignCommand(GetObjectByTag("904Plancs"), ActionStartConversation(GetObjectByTag("904Plancs"), "904defeat", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));

		}

		else if(PMLive == 1  && GetHP(GetPartyLeader()) <= 5 && GetTag(GetPartyLeader()) != "Atton"){

			SetLocalNumber(OBJECT_SELF, 12, 2);
			SetGlobalFadeOut(0.0,0.0);
			CancelCombat(GetFirstPC());
			ChangeToStandardFaction(GetObjectByTag("Kreia"), 5);
			CutsceneLocals();

			AssignCommand(GetObjectByTag("Atton"), SetIsDestroyable(FALSE, TRUE, TRUE));
			DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(50), GetObjectByTag("Atton")));
			DelayCommand(0.4, BecomeAtton());
			DelayCommand(0.6, AssignCommand(GetFirstPC(), ClearAllActions()));
			DelayCommand(0.8, CancelCombat(GetFirstPC()));
			//SendMessageToPC(GetPartyLeader(), " You lost");
			AssignCommand(GetObjectByTag("Kreia"), JumpToLocation(GetLocation(GetObjectByTag("sp_kreia"))));

			DelayCommand(1.0, AssignCommand(GetObjectByTag("904Plancs"), ActionStartConversation(GetObjectByTag("904Plancs"), "904defeat", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));


		}


		if( PMLive == 1 && !GetMinOneHP(GetPartyLeader())){

			SetMinOneHPParty(TRUE);

		}

		else if( PMLive > 1 && GetMinOneHP(GetPartyLeader())){

			SetMinOneHPParty(FALSE);
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
	if(GetLocalNumber(OBJECT_SELF, 12) == 0){
		DelayCommand(0.25, ExecuteScript("k_c_krefight", GetObjectByTag("904plancs")));
	}
	else{
		RemoveHeartbeat(OBJECT_SELF);
	}


}
