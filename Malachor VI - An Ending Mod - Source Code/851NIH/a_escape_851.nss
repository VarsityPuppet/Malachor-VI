void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	SetSoloMode(0);
	SetPartyLeader(0xFFFFFFFF);
	PlayMovie("MalMov05", 0);
	SetGlobalNumber("907MAL_CUTSCENE", 2);
	SetGlobalNumber("003EBO_BACKGROUND" , 8);
	SetGlobalNumber("003EBO_RETURN_DEST", 8);

	SetGlobalNumber("900MAL_Open",1);

	if ((GetGlobalNumber("101PER_Revan_End") == 1)) {
		PlayMovie("TelMov02");
		StartNewModule("907MAL", "", "", "", "", "", "", "");
	}
	else {
		StartNewModule("205TEL", "", "", "", "", "", "", "");
	}
}






