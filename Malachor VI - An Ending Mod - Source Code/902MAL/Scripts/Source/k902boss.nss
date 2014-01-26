void main() {
	object oPC = GetFirstPC();
	if ((GetEnteringObject() == oPC)) {
		oPC = GetFirstPC();
		object o902boss = GetObjectByTag("902boss", 0);
		if (GetIsObjectValid(o902boss)) {
			AssignCommand(o902boss, ActionStartConversation(oPC, "902boss", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
		}
		else {
			AurPostString("k902boss: INVIS BOSS PLACEABLE MISSING!", 5, 5, 5.0);
		}
		DestroyObject(OBJECT_SELF);
	}
}

