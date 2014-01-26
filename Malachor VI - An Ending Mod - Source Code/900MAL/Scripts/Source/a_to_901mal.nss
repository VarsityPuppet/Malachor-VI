void main() {


	if(IsAvailableCreature(NPC_VISAS)){
		if(!GetLocalBoolean(GetModule(), 63)){
			SetLocalBoolean(GetModule(), 63, 1);
			SetGlobalNumber("902MAL_Cutscene", 1);
			StartNewModule("902MAL");

			//Loads Visas and Mandalore cutscene

		}
		else{
			StartNewModule("901MAL");
		}
	}

	else{

		SetGlobalNumber("902MAL_Cutscene", 2);

		StartNewModule("901MAL");

		//To make sure the scene only loads once

	}


}
