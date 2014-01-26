void main(){

int param1 = GetScriptParameter(1);


	switch(param1){
		case 0:
			SetGlobalNumber("299TEL_Mission_Over",0);
		break;
		case 1:
			SetGlobalNumber("299TEL_Mission_Over",1);
			SetGlobalNumber("299TEL_HK51_Core", 1);
		break;
		case 2:
			SetGlobalNumber("299TEL_Mission_Over",1);
			SetGlobalNumber("299TEL_HK51_Core", 0);
		break;
		case 3:
			RemoveAvailableNPC(5);
			SetGlobalNumber("299TEL_Mission_Over",0);
		break;
		case 4:
		SetGlobalNumber("903MAL_Cutscene",1);
			StartNewModule("903mal");
		break;
		case 5:

			AssignCommand(GetObjectByTag("MD02-05"), ActionCloseDoor(GetObjectByTag("MD02-05")));
		break;
	}

		SetGlobalNumber("902MAL_Cutscene", 3);
		SetGlobalFadeOut(0.8, 1.7);
		SetFadeUntilScript();
		DelayCommand(2.9, StartNewModule("902MAL", "sp_hk47"));
}