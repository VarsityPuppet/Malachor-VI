int StartingConditional(){

	int iMira = GetScriptParameter(1);
	int iHanharr = GetScriptParameter(2);
	int iBrianna = GetScriptParameter(3);
	int iDisciple = GetScriptParameter(4);
	int iVisas = GetScriptParameter(5);

	int i1 = 1;
	int i2 = 1;
	int i3 = 1;
	int i4 = 1;
	int i5 = 1;

	if(iMira == 1){
		if(!GetIsObjectValid(GetObjectByTag("Mira"))){
			i1 = 0;
		}
	}
	if(iHanharr == 1){
		if(!GetIsObjectValid(GetObjectByTag("Hanharr"))){
			i2 = 0;
		}
	}
	if(iBrianna == 1){
		if(!GetIsObjectValid(GetObjectByTag("Handmaiden"))){
			i3 = 0;
		}
	}
	if(iDisciple == 1){
		if(!GetIsObjectValid(GetObjectByTag("Disciple"))){
			i4 = 0;
		}
	}
	if(iVisas == 1){
		if(!GetIsObjectValid(GetObjectByTag("VisasMarr"))){
			i5 = 0;
		}
	}

	if(i1 && i2 && i3 && i4 && i5){
		return TRUE;
	}
	else{
		return FALSE;
	}
}