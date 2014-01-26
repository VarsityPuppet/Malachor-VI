void main(){
	object oPC = GetFirstPC();
	object oDLG = GetObjectByTag("905dlghost");
	if(GetEnteringObject()==oPC){

		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, ClearAllEffects());
		SetCommandable(FALSE, oPC);
		AssignCommand(oPC, ActionMoveToLocation(GetLocation(GetObjectByTag("t_assbush"))));
		SetGlobalFadeOut(0.2, 1.0);
		NoClicksFor(1.2);
		DelayCommand(1.2, AssignCommand(oDLG, ActionStartConversation(oDLG, "905assbush")));
		DelayCommand(2.0, DestroyObject(OBJECT_SELF));
	}
}