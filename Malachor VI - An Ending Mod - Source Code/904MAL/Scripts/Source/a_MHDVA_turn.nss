void main(){
	object oObject;
	int i1 = GetScriptParameter(1);
	int i2 = GetScriptParameter(2);
	int i3 = GetScriptParameter(3);
	int i4 = GetScriptParameter(4);
	int i5 = GetScriptParameter(5);
	string sTag = GetScriptStringParameter();

	if(i1){
		AssignCommand(GetObjectByTag("Mira"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
	}
	if(i2){
		AssignCommand(GetObjectByTag("Hanharr"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
		AssignCommand(GetObjectByTag("Hanharr2"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
	}
	if(i3){
		AssignCommand(GetObjectByTag("Handmaiden"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
		AssignCommand(GetObjectByTag("Disciple"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
	}
	if(i4){
		AssignCommand(GetObjectByTag("VisasMarr"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
	}
	if(i5){
		AssignCommand(GetObjectByTag("Atton"), SetFacingPoint(GetPosition(GetObjectByTag(sTag))));
	}
}