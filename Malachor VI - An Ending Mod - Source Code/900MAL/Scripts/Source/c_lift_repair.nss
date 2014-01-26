int StartingConditional()
{

	if(GetLocalBoolean(GetObjectByTag("lift_to_901"), 35) &&
	GetSkillRank( SKILL_REPAIR, GetPCSpeaker() ) > 0 &&
	GetLocalBoolean(GetObjectByTag("lift_to_901"), 38) ){

		return TRUE;
	}
	else{
		return FALSE;
	}

}
