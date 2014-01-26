void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 1:
			//AssignCommand(GetFirstPC(), ActionPlayAnimation(10052, 1.0, 1.0));
			SetGlobalFadeOut(0.0, 0.0);
			AssignCommand(GetFirstPC(), ActionForceMoveToObject(GetObjectByTag("wp_landho"), FALSE, 0.5, 15.00));
			SetGlobalFadeIn(1.5, 3.0);
		case 2:

		case 3:

			break;
		case 4:

			break;
	}
}




