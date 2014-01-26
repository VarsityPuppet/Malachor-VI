void main(){
	object oPC = GetFirstPC();
	object oDLG = GetObjectByTag("905dlghost");
	if(GetEnteringObject()==oPC && !GetIsDead(oDLG)){

		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, ClearAllEffects());
		AssignCommand(oDLG, ActionStartConversation(oDLG, "905sleep"));
		DelayCommand(1.25, DestroyObject(OBJECT_SELF));
	}
}