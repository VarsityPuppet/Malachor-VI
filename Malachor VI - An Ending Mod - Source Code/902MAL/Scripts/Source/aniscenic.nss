void main(){
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	if((GetIsObjectValid(GetObjectByTag("hanharr2"))) && (!GetLocalBoolean(GetModule(), 38)) && GetIsPC(oEntering)){
		SetLockOrientationInDialog(oPC, 1);
		SetLocalBoolean(GetModule(), 38, TRUE);
		AssignCommand(oPC, ClearAllActions());
		DelayCommand(0.1, AssignCommand(GetObjectByTag("902boss", 0), ActionStartConversation(GetPartyLeader(), "aniscenic", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}
	if(GetScriptParameter(1) == 1){
		AssignCommand(oPC, ActionMoveToLocation(Location(Vector(40.23140, -98.26077, 39.95603), 1.77262)));
		DelayCommand(4.8, AssignCommand(oPC, SetFacing(120.0)));
	}
}