#include "k_inc_hawk"

void DeleteParty(){

				int int2 = 0;
				while ((int2 <= 12)) {

					RemoveNPCFromPartyToBase(int2);
					SetNPCSelectability(int2, 0);

				(int2++);
				}
				SetNPCSelectability(8, 1);
}


void main() {
	SetGlobalNumber("003EBO_BACKGROUND", 9);
	SetBackground();
	SetHologramWorld();

	if (GetLoadFromSaveGame()) {
		return;

	}


	SignalEvent(GetObjectByTag("T3M4"), EventUserDefined(110));

	if (GetEnteringObject() == GetFirstPC()) {
		object oInvis = GetObjectByTag("900start_temp", 0);
		location location1 = GetLocation(GetObjectByTag("InvisibleLocationMarker", 0));

		if(!GetLocalBoolean(oInvis, 60)){
			SetLocalBoolean(oInvis, 60, TRUE);
			DeleteParty();
			RevealMap();
			AssignCommand(GetFirstPC(), ActionJumpToLocation(location1));

			AssignCommand(oInvis, ActionStartConversation(GetFirstPC(), "900start", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
		}
	}


}