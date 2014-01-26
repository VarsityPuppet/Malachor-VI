void main(){
	SetLockOrientationInDialog(OBJECT_SELF, TRUE);
	SetLockOrientationInDialog(GetFirstPC(), TRUE);
	SetLockOrientationInDialog(GetPartyLeader(), TRUE);
	AssignCommand(OBJECT_SELF, ActionStartConversation(OBJECT_SELF, "workband"));
}