void main(){

	object oPC = GetFirstPC();
	object oBoss = GetObjectByTag("PBoss");
	object oMD0205 = GetObjectByTag("MD02-05");
	object oMD0206 = GetObjectByTag("MD02-06");


	int param1 = GetScriptParameter(1);

	switch(param1){
		case 0:
			AssignCommand(oMD0205, ActionOpenDoor(oMD0205));
			AssignCommand(oMD0206, ActionOpenDoor(oMD0206));
			AssignCommand(oBoss, ActionMoveToObject(GetObjectByTag("wp_sithfight_boss_1"), FALSE, 0.1));
		break;
		case 1:
			ChangeToStandardFaction(oBoss, 1);
			AssignCommand(oMD0205, ActionCloseDoor(oMD0205));
			AssignCommand(oMD0206, ActionCloseDoor(oMD0206));
		break;
		case 2:
			AssignCommand(oPC, ActionMoveToObject(GetObjectByTag("wp_sithfight_pc_1"), FALSE, 0.1));
		break;
		case 3:

		break;
	}
}