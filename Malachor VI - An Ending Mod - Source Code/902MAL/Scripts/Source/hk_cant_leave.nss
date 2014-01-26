void main() {
	object oTalk;

	if(!GetLocalBoolean(OBJECT_SELF, 31)){
		SetLocalBoolean(OBJECT_SELF, 31, TRUE);
		oTalk = CreateObject(OBJECT_TYPE_PLACEABLE, "hk_talk", GetLocation(OBJECT_SELF));
	}
	else{
		oTalk = GetNearestObjectByTag("HK_talker");
	}

	object oPC = GetPartyLeader();
	if (GetEnteringObject() == oPC && GetTag(oPC) == "HK47"){
		AssignCommand(GetFirstPC(), ClearAllActions());
		SetGlobalFadeIn(0.5,1.0);
		AssignCommand(oTalk, ActionStartConversation(GetFirstPC(), "hkblock", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
		DelayCommand(0.5, AssignCommand(GetFirstPC(), ActionJumpToObject(GetNearestObjectByTag("wp_hk_leave", OBJECT_SELF), FALSE)));
	}
}

