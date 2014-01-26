


void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 0:
			break;
		case 1:
			break;
		case 2:	
			AssignCommand(GetObjectByTag("BaoDur"), SetIsDestroyable(TRUE, FALSE, FALSE));
			DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur"), ActionJumpToObject(GetWaypointByTag("sp_baodur")) ));
			DelayCommand(2.0, DestroyObject(GetObjectByTag("BaoDur"), 0.0));
		case 3:
			break;
		case 4:
			break;
	}
}

