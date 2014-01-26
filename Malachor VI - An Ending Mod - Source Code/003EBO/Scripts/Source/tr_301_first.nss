void main() {
	object oEntering = GetEnteringObject();
	if ((oEntering != GetFirstPC())) {
		return;
	}
object oAtton = GetObjectByTag("Atton");
object oCand = GetObjectByTag("Mand");
object oBrianna = GetObjectByTag("Handmaiden");
object oMira = GetObjectByTag("Mira");
object oVisas = GetObjectByTag("VisasMarr");
object oHanharr = GetObjectByTag("Hanharr");
object oMical = GetObjectByTag("Disciple");

	if ((GetGlobalNumber("301_INTRO_SCENE") == 1)) {
		ExecuteScript("a_holoworld", GetFirstPC(), 0xFFFFFFFF);
		SetGlobalNumber("301_INTRO_SCENE", 2);
		object oAtton = GetObjectByTag("Atton", 0);
		object oPC = GetFirstPC();
		AssignCommand(oAtton, ClearAllActions());
		AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton", 0))));
		AssignCommand(oPC, ClearAllActions());
		DelayCommand(0.2, AssignCommand(oAtton, ActionStartConversation(oPC, "attontmp", 0, 0, 1, "", "", "", "", "", "", 0, (-1), (-1), 1)));
	}
	else if ((GetGlobalNumber("701_INTRO_SCENE") == 1)) {
			ExecuteScript("a_holoworld", GetFirstPC(), 0xFFFFFFFF);
			SetGlobalNumber("701_INTRO_SCENE", 2);
			object object10 = GetObjectByTag("Atton", 0);
			object object12 = GetFirstPC();
			AssignCommand(object10, ClearAllActions());
			AssignCommand(object10, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton", 0))));
			AssignCommand(object12, ClearAllActions());
			DelayCommand(0.2, AssignCommand(object10, ActionStartConversation(object12, "kor_int", 0, 0, 1, "", "", "", "", "", "", 0, (-1), (-1), 1)));

	}
	else if ((GetGlobalNumber("900MAL_Open") == 2)) {
	ExecuteScript("a_holoworld", GetFirstPC(), 0xFFFFFFFF);


	SetGlobalNumber("900MAL_Open", 3);

	SetGlobalFadeIn(1.0);

	vector vMalholo = GetPosition(GetObjectByTag("hologram"));
	vMalholo.z = vMalholo.z - 1.0;
	location lfakeholo = Location(vMalholo, GetFacing(GetFirstPC()));
	vector vPC = GetPosition(GetObjectByTag("hologram"));
	location lfakecam = Location(vPC + AngleToVector(GetFacing(GetFirstPC()) - 180.00)*0.8, GetFacing(GetFirstPC()));
	location lfakewindow = Location(Vector(52.82499, 80.89308, 3.00), 90.00);

	object oFakeHolo = CreateObject(OBJECT_TYPE_PLACEABLE, "fake_holo", lfakeholo, FALSE);
	object oFakeWindow = CreateObject(OBJECT_TYPE_PLACEABLE, "fake_wind", lfakewindow, FALSE);
	object fakecam1 = CreateObject(OBJECT_TYPE_PLACEABLE, "fake_cam1", lfakecam, FALSE);

	AssignCommand(oMira, SetFacing(90.00));
	AssignCommand(oCand, SetFacing(90.00));
	AssignCommand(oVisas, SetFacing(90.00));
	AssignCommand(oHanharr, SetFacing(90.00));
	AssignCommand(oBrianna, SetFacing(90.00));
	AssignCommand(oMical, SetFacing(90.00));

	SetLockOrientationInDialog(oAtton, TRUE);
	SetLockOrientationInDialog(oMira, TRUE);
	SetLockOrientationInDialog(oCand, TRUE);
	SetLockOrientationInDialog(oVisas, TRUE);
	SetLockOrientationInDialog(oHanharr, TRUE);
	SetLockOrientationInDialog(oBrianna, TRUE);
	SetLockOrientationInDialog(oMical, TRUE);

	AssignCommand(GetFirstPC(), ClearAllActions());
	DelayCommand(0.5, AssignCommand(GetFirstPC(), ActionStartConversation(oFakeHolo, "003mal", 0, 0, 1, "", "", "", "", "", "", 0, (-1), (-1), 1)));

	}

}






