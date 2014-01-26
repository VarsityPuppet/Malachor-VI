int CheckRunDeBug(){
	int nDebugMode = GetGlobalNumber("000_Debug");
	string nModule = "pre" + GetModuleName();

	if(nDebugMode == 1){
		AssignCommand(GetFirstPC(), ActionStartConversation(GetFirstPC(), nModule, 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

	}

		return nDebugMode;
}