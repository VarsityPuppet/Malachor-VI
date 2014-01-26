void main(){
	int Param1 = GetScriptParameter(1);
	int Param2 = GetScriptParameter(2);
	int Param3 = GetScriptParameter(3);
	int Param4 = GetScriptParameter(4);
	int Param5 = GetScriptParameter(5);


	string ParamString = GetScriptStringParameter();
	object oDLG = GetObjectByTag(GetStringLeft(GetModuleFileName(), 3)+"dlghost");

	switch(Param1){
		case 0:{ //Run module pre dialog
			string sDLG = "pre"+GetModuleFileName();
			object oDLG = GetObjectByTag(GetStringLeft(GetModuleFileName(), 3)+"dlghost");
			DelayCommand(0.1, AssignCommand(oDLG, ActionStartConversation(oDLG, sDLG)));
		break;}
		case 1:{ //Load new module (warp)
			StartNewModule(ParamString);
		break;}
		case 2:{ //Fire camtest.dlg
			DelayCommand(0.1, AssignCommand(OBJECT_SELF, ActionStartConversation(OBJECT_SELF, "camtest")));
		break;}
		case 3:{
			AssignCommand(GetNearestObject(OBJECT_TYPE_DOOR), ActionCloseDoor(GetNearestObject(OBJECT_TYPE_DOOR)));
		break;}
		case 4:
CreateObject(OBJECT_TYPE_CREATURE, "g_sithtroop_04", GetLocation(GetFirstPC()));
			//DelayCommand(0.5, AssignCommand(GetFirstPC(), ActionStartConversation(GetFirstPC(), "905sleep")));
		break;
	}
}