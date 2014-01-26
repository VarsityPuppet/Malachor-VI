void SpawnSith(string s1, string s2){

CreateObject(OBJECT_TYPE_CREATURE, s1, GetLocation(GetObjectByTag(s2)));

}

void main(){
	
int param1 = GetScriptParameter(1);


	string sTemplate;
	string sWaypoint;
	int Count;
	float fDelay;
	talent tSneak = TalentFeat(28);

	switch(param1){
		case 0:
			for(Count = 1; Count <= 7; Count++){
				fDelay = Count * 0.2;
				sWaypoint = "wp_sa_sleep0" + IntToString(Count);
				sTemplate = "c_assbushsa";

				if(Count == 1)sTemplate = "c_assbushea";

				DelayCommand(fDelay, SpawnSith(sTemplate, sWaypoint));
			}
			ChangeToStandardFaction(GetObjectByTag("assbushea"), 1);
			ChangeToStandardFaction(GetObjectByTag("SleepGuy"), 4);
			SetLockOrientationInDialog(GetObjectByTag("SleepGuy"), TRUE);
		break;
		case 1:
			DelayCommand(1.0, ChangeToStandardFaction(GetObjectByTag("assbushea"), 1));
			//AssignCommand(GetObjectByTag("assbushea"), ActionUseTalentOnObject(tSneak, GetObjectByTag("SleepGuy")));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("SleepGuy"), SetFacingPoint(GetPosition(GetObjectByTag("assbushea")))));
		break;
		case 2:	//Ready animation 2
			ActionPauseConversation();

			DelayCommand(0.9, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 0)));
			DelayCommand(0.7, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 1)));
			DelayCommand(0.8, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 2)));
			DelayCommand(0.6, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 3)));
			DelayCommand(0.5, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 4)));
			DelayCommand(1.0, CreatureFlourishWeapon(GetObjectByTag("assbushsa", 5)));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 0), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 1), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 2), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 3), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 4), 1));
			DelayCommand(1.5, ChangeToStandardFaction(GetObjectByTag("assbushsa", 5), 1));

			DelayCommand(1.5, ActionResumeConversation());
		break;
	}

}