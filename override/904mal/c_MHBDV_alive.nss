int StartingConditional(){

	int DISC_ALIVE = 20;
	int HAND_ALIVE = 21;
	int VISAS_ALIVE = 22;
	int HANHARR_ALIVE = 23;
	int MIRA_ALIVE = 24;

	object o904plancs = GetObjectByTag("904plancs");

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
		if(!GetLocalNumber(o904plancs, MIRA_ALIVE)){
			i1 = 0;
		}
	}
	if(iHanharr == 1){
		if(!GetLocalNumber(o904plancs, HANHARR_ALIVE)){
			i2 = 0;
		}
	}
	if(iBrianna == 1){
		if(!GetLocalNumber(o904plancs, HAND_ALIVE)){
			i3 = 0;
		}
	}
	if(iDisciple == 1){
		if(!GetLocalNumber(o904plancs, DISC_ALIVE)){
			i4 = 0;
		}
	}
	if(iVisas == 1){
		if(!GetLocalNumber(o904plancs, VISAS_ALIVE)){
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