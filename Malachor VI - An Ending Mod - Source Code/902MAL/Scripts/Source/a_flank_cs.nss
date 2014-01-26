void SithFlanker(int i) {
	object oFlanker = CreateObject(OBJECT_TYPE_CREATURE, "sith_flanker" + IntToString(i + 1), GetLocation(GetObjectByTag("SP_SithAssassin" + IntToString(i + 1))));
	DelayCommand(2.0, AssignCommand(oFlanker, ActionMoveToLocation(GetLocation(GetWaypointByTag("WP_SithAssassin" + IntToString(i + 1))))));
}



void main() {

	int nCutsceneStage = GetScriptParameter(1);
	switch (nCutsceneStage) {
		case 1:
		{
			object oPC = GetFirstPC();
			object oWPAss = GetObjectByTag("WP_ASSASSIN_FLANK");
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oPC, ActionMoveToObject(oWPAss));
			if (GetGlobalBoolean("MAL_TURNINTO_REMOTE")){ //If player is playing as Remote's solo mision
				object oPortcullis1 = GetObjectByTag("Portcullis2", 0);
				DelayCommand(0.5, AssignCommand(oPortcullis1, ActionCloseDoor(oPortcullis1)));
				DelayCommand(2.0, SetLocked(oPortcullis1, 1));
			}
		}
		break;

		case 2:
		{
			int i = 0;
			float f = 0.0;
			while(i < 10) {
				DelayCommand(f, SithFlanker(i));
				if(i % 2) {
					f = f + 2.0;
				}
				i++;
			}
		}
		break;
		case 3:
		{
		}
		break;
		case 4:
		{
			object oPC = GetFirstPC();
			object oInvis = GetObjectByTag("InvisFlank");
			AssignCommand(oPC, ClearAllActions());

			int i = 0;
			while(i < 10) {
				AssignCommand(GetObjectByTag("SithFlanker" + IntToString(i + 1)), ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, (-1.0)));
				i++;
			}
			DelayCommand(3.0, DestroyObject(oInvis));//AssignCommand(oPC, ActionMoveToObject(oInvis));
		}
		break;
		/*case 5:

		//Case 5 is not used in the cutscene anymore, but I decided to leave this code here should I need it somewhere else.

			int i = 0;
			while(i < 10) {
				DelayCommand(2.0, AssignCommand(GetObjectByTag("SithFlanker" + IntToString(i + 1)), ActionPlayAnimation(105, 0.75, -1.0) ));
				i++;
			}
			if(GetGlobalNumber("901MAL_REMOTE") ==1){
                                //SetGlobalNumber("907MAL_CUTSCENE", 5);
				SetGlobalFadeOut(2.0, 2.0);
				SetFadeUntilScript();
				RemoteG0t0HK();
			DelayCommand(1.0, AssignCommand(GetObjectByTag("Remote"), ActionStartConversation(GetFirstPC(), "", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
				DelayCommand(1.5, StartNewModule("907MAL"));
                      	   }
                           else{
			if(GetGlobalNumber("901MAL_REMOTE") ==0){
                                		SetGlobalBoolean("MAL_TURNINTO_REMOTE", 1);
                                		SetGlobalFadeOut(2.0, 2.0);
				SetFadeUntilScript();
		                StartNewModule("901MAL", "wp_remote_start", "", "", "", "", "", "");
		break;*/
		case 6:
			int i = 0;
			while(i < 10) {
				DelayCommand(2.0, AssignCommand(GetObjectByTag("SithFlanker" + IntToString(i + 1)), ActionPlayAnimation(10457, 1.0, 999.0) ));
				i++;
			}
		break;
	}
}









