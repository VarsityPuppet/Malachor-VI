// Prototypes
void main() {
	object oP_remote = GetObjectByTag("remote", 0);
	object oP_baodur001 = GetObjectByTag("BaoDur", 0);
	SetLockOrientationInDialog(oP_baodur001, 1);
	AssignCommand(oP_baodur001, ClearAllActions());
	SetMinOneHP(oP_baodur001, 0);
	DelayCommand(0.1, AssignCommand(oP_remote, ActionStartConversation(GetPartyLeader(), "901bao", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}


















