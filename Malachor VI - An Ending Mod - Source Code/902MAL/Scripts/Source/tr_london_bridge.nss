void main() {
	object oInvis = GetObjectByTag("InvisFlank");
	if(!GetLocalBoolean(oInvis, 39)){
		SetLocalBoolean(oInvis, 39, TRUE);
		AssignCommand(oInvis, ActionStartConversation(GetFirstPC(), "flank", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	}
}










