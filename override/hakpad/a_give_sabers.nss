void main(){



	int nItemNum = 1;

	string sDBL = "g_w_dblsbr0";
	string sLGHT = "g_w_lghtsbr";
	string sShort = "g_w_shortsbr";
	string NumRR = IntToString(nItemNum);


	object oPC = GetPartyLeader();

	while(nItemNum <= 18){

		sDBL = "g_w_dblsbr0";
		sLGHT = "g_w_lghtsbr";
		sShort = "g_w_shortsbr";

		if(nItemNum < 10){
			sDBL = sDBL + "0";
			sLGHT = sLGHT + "0";
			sShort = sShort + "0";
		}

		sDBL = sDBL + NumRR;
		sLGHT = sLGHT + NumRR;
		sShort = sShort + NumRR;


		CreateItemOnObject(sDBL,  oPC, 1, 0);
		CreateItemOnObject(sLGHT,  oPC, 1, 0);
		CreateItemOnObject(sShort, oPC, 1, 0);

		nItemNum = nItemNum + 1;
		NumRR = IntToString(nItemNum);

	}


}