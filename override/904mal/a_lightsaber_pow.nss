void main(){
	int Override	 = GetScriptParameter(1);
	int Powered	 = GetScriptParameter(2);
	int Transition	 = GetScriptParameter(3);
	object oCreature = GetObjectByTag(GetScriptStringParameter(), 0);

	SetLightsaberPowered(oCreature, Override, Powered, Transition);
}