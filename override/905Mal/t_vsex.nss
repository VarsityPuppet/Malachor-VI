void main(){
	object oPC = GetFirstPC();
	object oDLG = GetObjectByTag("905dlghost");
        if(GetEnteringObject()==oPC && !GetLocalBoolean(oDLG, 49) && !(GetBaseItemType(GetItemInSlot(4, GetFirstPC())) == 256) && ((GetIsObjectValid(GetObjectByTag("VSHandmaiden"))) || (GetIsObjectValid(GetObjectByTag("VSAtton"))))){
                SetLocalBoolean(oDLG, 49, TRUE);
                SetGlobalFadeOut(0.0, 1.0);
	        DelayCommand(1.0, AssignCommand(oPC, ClearAllActions()));
	        DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oDLG, "905vsex")));
         }
}