int StartingConditional() {

	int int1 = GetClassByPosition(1, GetPartyLeader());
	int int2 = GetClassByPosition(2, GetPartyLeader());

	if ( (int1 == 5) || (int1 == 4) || (int1 == 3) || (int2 == 5) || (int2 == 4) || (int2 == 3) ) {
		return TRUE;
	}
	else{
		return FALSE;
	}
}

