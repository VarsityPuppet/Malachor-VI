void CreateSith(object oNPC, object wSith){
	object oItem = GetItemInSlot(4, oNPC);
	object oItem2 = GetItemInSlot(18, oNPC);
	int a = GetBaseItemType(oItem);
	int b = GetBaseItemType(oItem2);
	if(GetWeaponRanged(oItem)){
		CreateObject(OBJECT_TYPE_CREATURE, "sith_shooter", GetLocation(wSith));
	}
	else if(a == 256){
		if(b == 256){
			CreateObject(OBJECT_TYPE_CREATURE, "sith_unarmed", GetLocation(wSith));
		}
		else{
			if(GetWeaponRanged(oItem2)){
				AssignCommand(oNPC, ActionSwitchWeapons());
				CreateObject(OBJECT_TYPE_CREATURE, "sith_shooter", GetLocation(wSith));
			}
			else{
				AssignCommand(oNPC, ActionSwitchWeapons());
				CreateObject(OBJECT_TYPE_CREATURE, "sith_melee", GetLocation(wSith));

			}
		}
	}
	else{
		CreateObject(OBJECT_TYPE_CREATURE, "sith_melee", GetLocation(wSith));
	}
}


void main(){
	object wSith1 = GetWaypointByTag("sp_css_sith1");
	object wSith2 = GetWaypointByTag("sp_css_sith2");
	object wSith3 = GetWaypointByTag("sp_css_sith3");
	object wSith4 = GetWaypointByTag("sp_css_sith4");
	object wAtton = GetWaypointByTag("sp_css_atton");
	object wMira = GetWaypointByTag("sp_css_mira");
	object wHand = GetWaypointByTag("sp_css_hand");
	object wHanharr = GetWaypointByTag("sp_css_hanharr");

	object oAtton = SpawnAvailableNPC(0, GetLocation(wAtton));
	object oMira = SpawnAvailableNPC(7, GetLocation(wMira));
	object oHand = SpawnAvailableNPC(4, GetLocation(wHand));
	object oHanharr = CreateObject(1, "p_hanharr003", GetLocation(wHanharr));
	CreateSith(oAtton, wSith1);
	CreateSith(oMira, wSith3);
	CreateSith(oHand, wSith2);
	CreateSith(oHanharr, wSith4);

	ChangeToStandardFaction(oHanharr, 4);
	ChangeToStandardFaction(oMira, 4);
	ChangeToStandardFaction(oAtton, 4);
	ChangeToStandardFaction(oHand, 4);

	SetMinOneHP(oAtton, 1);
	SetMinOneHP(oMira, 1);
	SetMinOneHP(oHand, 1);
	SetMinOneHP(oHanharr, 1);

	object oSith1 = GetNearestObject(1, wSith1);
	object oSith2 = GetNearestObject(1, wSith2);
	object oSith3 = GetNearestObject(1, wSith3);
	object oSith4 = GetNearestObject(1, wSith4);

	DelayCommand(0.9, ChangeToStandardFaction(oSith1, 3));
	DelayCommand(0.9, ChangeToStandardFaction(oSith2, 3));
	DelayCommand(0.9, ChangeToStandardFaction(oSith3, 3));
	DelayCommand(0.9, ChangeToStandardFaction(oSith4, 3));

	DelayCommand(0.9, AssignCommand(oAtton, ActionAttack(oSith1, 1)));
	DelayCommand(0.9, AssignCommand(oMira, ClearAllActions()));
	DelayCommand(1.0, AssignCommand(oMira, ActionAttack(oSith3, 0)));
	DelayCommand(1.2, AssignCommand(oHand, ActionAttack(oSith2, 1)));
	DelayCommand(1.3, AssignCommand(oHanharr, ActionAttack(oSith4, 1)));
}