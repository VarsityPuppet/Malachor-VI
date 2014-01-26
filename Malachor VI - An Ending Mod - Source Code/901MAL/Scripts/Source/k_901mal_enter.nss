// Prototypes

void sub4() {

	object oP_baodur001 = CreateObject(1, "p_baodur001", Location(Vector(0.0, 0.0, 0.0), 0.0), 0);
	SetLockOrientationInDialog(oP_baodur001, 1);
	AssignCommand(oP_baodur001, ClearAllActions());
	SetMinOneHP(oP_baodur001, 0);
	DelayCommand(1.0, AssignCommand(oP_baodur001, ActionStartConversation(GetPartyLeader(), "", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}

void BecomeRemote(){
	SetNPCSelectability(1,1);
	SwitchPlayerCharacter(1);

}
void RemoteParty() {
	AddAvailableNPCByObject(1, GetObjectByTag("remote", 0) );
	DestroyObject(GetObjectByTag("remote", 0), 0.0, 1, 0.0, 0);
}

void Mira(){
	object object4 = SpawnAvailableNPC(7, GetLocation(GetWaypointByTag("sp_mira")));
	SetCommandable(TRUE, object4);
	AssignCommand(object4, SetFacingPoint(GetPosition(GetObjectByTag("DarthSion"))));
	SetMinOneHP(object4, TRUE);
	SetLockOrientationInDialog(object4, TRUE);

	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), object4);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(90), object4, 30.0);
				//DelayCommand(0.5, AssignCommand(object4, ClearAllActions()));
	DelayCommand(0.5, SetMinOneHP(object4, FALSE));
	DelayCommand(0.5, AssignCommand(object4, ActionStartConversation(GetFirstPC(), "901mira", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	DestroyObject(GetObjectByTag("tr_mira_han"));
}

void RemoteBao() {
	object  oRemote = SpawnAvailablePUP(0, GetLocation(GetObjectByTag("wp_remote_start")));
	//object  oRemote = CreateObject(1, "p_remote", GetLocation(GetObjectByTag("wp_remote_start")), 0);
	SetCommandable(TRUE, oRemote);
	object oP_baodur001 = CreateObject(1, "p_baodur001", Location(Vector(200.0, 0.0, 0.0), 0.0), 0);
	RemoveAvailableNPC(1);
}

void ClearParty() {
	SetPartyLeader(0xFFFFFFFF);
	while(GetPartyMemberCount() != 0){
		int int2 = 0;
		while ((int2 < 12)) {
			if( IsNPCPartyMember(int2) ){
				RemoveNPCFromPartyToBase(int2);
		
			}
			(int2++);
		}
	}
}

void main() {
object oPC = GetFirstPC();
	if (GetLoadFromSaveGame()) {
		return;
	}
	if ((GetEnteringObject() == oPC)) {


		if ((GetGlobalBoolean("MAL_TURNINTO_REMOTE") && (!GetLocalBoolean(GetModule(), 42) ))) {
			SetLocalBoolean(GetModule(),  42, 1);
			RemoteBao();
			DelayCommand(0.2, RemoteParty());
			DelayCommand(0.4, BecomeRemote());
			DelayCommand(0.6, SetGlobalFadeIn(1.1, 2.0, 0.0, 0.0, 0.0));
		}

		if ((!GetLocalBoolean(GetModule(), 63))) {
			SetLocalBoolean(GetModule(), 63, 1);
			ClearParty();
			RemoteBao();

			HoldWorldFadeInForDialog();
			SetLockOrientationInDialog(GetFirstPC(), TRUE);

				if (IsAvailableCreature(7)) {
					Mira();
				}
				else{
					DelayCommand(0.5, AssignCommand(GetObjectByTag("ebo_hatch"),ActionStartConversation(GetFirstPC(), "901start", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));

				}
		}
	}
}
