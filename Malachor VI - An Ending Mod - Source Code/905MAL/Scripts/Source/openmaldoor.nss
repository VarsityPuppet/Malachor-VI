void main(){
	string i = GetScriptStringParameter();
	object oDoor = GetObjectByTag(i, 0);
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
}