//:: k_mal_t3ud
/*
    User Define Script For T3M4 in 900MAL module
*/
//:: Created By: VarsityPuppet

void main()
{
    int nUser = GetUserDefinedEventNumber();

	switch (nUser){
		case 110:
			AssignCommand(OBJECT_SELF, SetFacing(0.0));
            		AssignCommand(OBJECT_SELF, ActionPlayAnimation(25, 1.0, -1.0));
		break;
	}
}





