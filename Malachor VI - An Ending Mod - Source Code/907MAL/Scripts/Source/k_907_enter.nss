void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	object oEntering = GetEnteringObject();
	if ((oEntering != GetFirstPC())) {
		return;
	}
	int nGlobal = GetGlobalNumber("907MAL_CUTSCENE");
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	SetFadeUntilScript();
	switch (nGlobal) {
              //Kreia's fall. Unused.
		case 0:
			CreateObject(1, "p_kreia_evil001", GetLocation(GetObjectByTag("sp_kreia", 0)), 0);
			CreateObject(1, "n_darthnihilu001", GetLocation(GetObjectByTag("sp_nihilus", 0)), 0);
			CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("sp_sion1", 0)), 0);
			AssignCommand(GetObjectByTag("Kreia", 0), ActionStartConversation(oEntering, "kreiaend", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			break;

              //Sion travelling to Smoogler's moon. Unused.
		case 1:
			{
				object oN_darthsion = CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);
				object oC_hologrampc = CreateObject(1, "c_hologrampc", GetLocation(GetObjectByTag("wp_hologram", 0)), 0);
				CreateObject(1, "g_sithass002", GetLocation(GetObjectByTag("sp_sith1", 0)), 0);
				CreateObject(1, "g_sithass003", GetLocation(GetObjectByTag("sp_sith2", 0)), 0);
				int int4 = GetAppearanceType(GetEnteringObject());
				effect effect1 = EffectDisguise(int4);
				ApplyEffectToObject(2, effect1, oC_hologrampc, 0.0);
				AssignCommand(oN_darthsion, ActionStartConversation(oEntering, "sioncut1", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
			break;

              //Kreia's Arrival to Malachor.
		case 2:
			{
				object oP_kreia_evil001 = CreateObject(1, "p_kreia_evil001", GetLocation(GetObjectByTag("sp_kreia2", 0)), 0);
				//CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);
				AssignCommand(oP_kreia_evil001, ClearAllActions());
				AssignCommand(GetFirstPC(), ClearAllActions());
				AssignCommand(oP_kreia_evil001, ActionStartConversation(oEntering, "krecut1", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
			break;

              //Exile's arrival.
              case 4:
		    //GetObjectByTag("sp_sith2", 0);
                    object oSion = CreateObject(1, "n_darthsion", Location(Vector(-47.08652, 47.12223, 0.47460), -45.365652));
                    object oKreia = CreateObject(OBJECT_TYPE_CREATURE, "p_kreia_evil001", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);
                    AssignCommand(oSion, ClearAllActions());
                    AssignCommand(oSion, ActionStartConversation(GetFirstPC(), "904sion", CONVERSATION_TYPE_CINEMATIC));
                    break;

              //Exile's arrival.
              case 3:
                    //object oSionSpawn2 = GetObjectByTag("sp_sith2", 0);
                    //CreateObject(1, "n_darthsion", GetLocation(oSionSpawn2));
                    //CreateObject(OBJECT_TYPE_CREATURE, "p_kreia_evil001", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);
                    //AssignCommand(oSion2, ClearAllActions());
                    //AssignCommand(oSion2, ActionStartConversation(GetFirstPC(), "904sion", CONVERSATION_TYPE_CINEMATIC));
		    //GetObjectByTag("sp_sith2", 0);
                    object oSion3 = CreateObject(1, "n_darthsion", Location(Vector(-47.08652, 47.12223, 0.47460), -45.365652));
                    object oKreia3 = CreateObject(OBJECT_TYPE_CREATURE, "p_kreia_evil001", GetLocation(GetObjectByTag("wp_kreia_start", 0)), 0);
                    AssignCommand(oSion3, ClearAllActions());
                    AssignCommand(oSion3, ActionStartConversation(GetFirstPC(), "904sion", CONVERSATION_TYPE_CINEMATIC));
                    break;
	
            //Party plans attack on Kreia.
            case 5:
                   SpawnAvailableNPC(NPC_MIRA, Location(Vector(-0.06657,-74.77476,0.79600),271.58978));
                   SpawnAvailableNPC(NPC_VISAS, Location(Vector(0.00243,-82.52699,0.79600),87.42225));
                        if(GetGender(GetFirstPC()) == GENDER_MALE) { 
                   SpawnAvailableNPC(NPC_HANDMAIDEN, Location(Vector(-3.72112,-80.42070,0.79600),17.35345));
                       } else {
                   SpawnAvailableNPC(NPC_DISCIPLE, Location(Vector(-3.72112,-80.42070,0.79600),17.35345));
                      }
                        if(GetGlobalNumber("903_Atton_Sion") != 2) {
                   SpawnAvailableNPC(NPC_ATTON, Location(Vector(3.27248,-76.51482,0.79600),198.57971));
                      }
                   object oKreiaParty = CreateObject(OBJECT_TYPE_CREATURE, "krei_party", GetLocation(GetObjectByTag("wp_kreia_start")));
                   AssignCommand(oKreiaParty, ActionStartConversation(GetFirstPC(), "907krepart", CONVERSATION_TYPE_CINEMATIC));
           break;

           //Party ATTACK Kreia.
           case 6:
                 AssignCommand(GetObjectByTag("krei_party"), ActionStartConversation(GetFirstPC(), "907krepart", CONVERSATION_TYPE_CINEMATIC));
                 break;

           //Party ATTACK Kreia without Mira.
           case 7:
                   SpawnAvailableNPC(NPC_VISAS, Location(Vector(0.00243,-82.52699,0.79600),87.42225));
                        if(GetGender(GetFirstPC()) == GENDER_MALE) { 
                   SpawnAvailableNPC(NPC_HANDMAIDEN, Location(Vector(-3.72112,-80.42070,0.79600),17.35345));
                       } else {
                   SpawnAvailableNPC(NPC_DISCIPLE, Location(Vector(-3.72112,-80.42070,0.79600),17.35345));
                      }
                        if(GetGlobalNumber("903_Atton_Sion") != 2) {
                   SpawnAvailableNPC(NPC_ATTON, Location(Vector(3.27248,-76.51482,0.79600),198.57971));
                      }
                   object oKreiaParty2 = CreateObject(OBJECT_TYPE_CREATURE, "krei_party", GetLocation(GetObjectByTag("wp_kreia_start")));
                   AssignCommand(oKreiaParty2, ActionStartConversation(GetFirstPC(), "907krepart", CONVERSATION_TYPE_CINEMATIC));
    }


}