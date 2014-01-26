void SithTorture(object oSource, float fTime){

	object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oSource), FALSE, OBJECT_TYPE_CREATURE);
	int i = 0;
	AssignCommand(oSource, ActionPlayAnimation(10067, 1.0, fTime));
	while(i <= 3){
		if(!GetIsPC(oTarget)){
			i++;
			if(GetTag(oTarget) != "PBoss"){
				AssignCommand(oTarget, ActionPlayAnimation(21,1.0,fTime));
				ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(2029, oSource, 2, 0), oTarget, fTime);}

			oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oSource), FALSE, OBJECT_TYPE_CREATURE);

		}
	}

}

void ClearForce(object oSource) {

	object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oSource), FALSE, OBJECT_TYPE_CREATURE);
	int i = 0;
	while(oTarget != OBJECT_INVALID){
		if(!GetIsPC(oTarget)){
			i++;
			AssignCommand(oTarget, ClearAllEffects());

			oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oSource), FALSE, OBJECT_TYPE_CREATURE);

		}
	}

}


void SleepyState(){
	AssignCommand(GetObjectByTag("VisasMarr"), ClearAllActions());
	AssignCommand(GetObjectByTag("Handmaiden"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Mira"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Hanharr"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Disciple"),  ClearAllActions());
	DelayCommand(0.5, AssignCommand(GetObjectByTag("VisasMarr"), ActionPlayAnimation(22,1.0,-1.0)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("Handmaiden"),  ActionPlayAnimation(22,1.0,-1.0)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("Mira"),  ActionPlayAnimation(22,1.0,-1.0)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("Hanharr"),  ActionPlayAnimation(22,1.0,-1.0)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("Disciple"),  ActionPlayAnimation(22,1.0,-1.0)));

}


void Die(){
	AssignCommand(GetObjectByTag("VisasMarr"), ClearAllActions());
	AssignCommand(GetObjectByTag("Handmaiden"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Mira"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Hanharr"),  ClearAllActions());
	AssignCommand(GetObjectByTag("Disciple"),  ClearAllActions());
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("VisasMarr"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("Handmaiden"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("Mira"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("Hanharr"));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), GetObjectByTag("Disciple"));

}


void main(){

	location wAppr2 = Location(Vector(-128.609878540, -24.930049896, 3.0), -90.0);
	location wBoss2 = Location(Vector(-88.164962769, -21.81876564, 3.0), -50.776);
	location wHand2 = Location(Vector(-115.577056885, -30.091312408, 3.0), -6.020111084);
	location wMira2 = Location(Vector(-130.289489746, -37.723171234, 3.0), -3.65332);
	location wVisas2 = Location(Vector(-129.038314819, -46.667716980, 3.0), 110.029129028);
	location wSold12 = Location(Vector(-120.225265503, -24.721307755, 3.0), 90.0);
	//location wSold22 = Location(Vector(, , 3.0), );

	int param1 = GetScriptParameter(1);
	object oBoss = GetObjectByTag("PBoss");
	object oAppr = GetObjectByTag("PAppr");
	object Door1 = GetObjectByTag("md02-09");
	object Door2 = GetObjectByTag("md01-10");
	object Door3 = GetObjectByTag("md02-07");
	object Door4 = GetObjectByTag("Jedicelldoor");

	object oAttacker;
	object oVictim;

	if(GetGlobalNumber("000_JoinKreia") == 2){

		oAttacker = GetObjectByTag("VSAtton");
		oVictim = GetObjectByTag("Disciple");
	}
	if(GetGlobalNumber("000_JoinKreia") == 1){

		oAttacker = GetObjectByTag("VSHandmaiden");
		oVictim = GetObjectByTag("VisasMarr");
	}

	switch(param1){
		case 0:
			SetGlobalFadeIn(1.0,1.75);

			SetLockOrientationInDialog(oBoss, TRUE);
			DelayCommand(1.5, AssignCommand(Door1, ActionOpenDoor(Door1)));
			DelayCommand(1.5, AssignCommand(oBoss, ActionMoveToObject(GetObjectByTag("wp_intro_sl_1"), FALSE, 0.01)));

			SleepyState();
			AssignCommand(oAttacker, ClearAllActions());
			AssignCommand(oVictim, ClearAllActions());
		break;
		case 1:
			AssignCommand(oBoss, ClearAllActions());
			AssignCommand(oBoss, ActionJumpToObject(GetObjectByTag("wp_intro_sl_1")));
			SetLockOrientationInDialog(oBoss, TRUE);

		break;
		case 2:
			AssignCommand(oBoss, ActionMoveToObject(GetObjectByTag("wp_intro_sl_2"), FALSE, 0.01));
			DelayCommand(0.5, AssignCommand(Door2, ActionOpenDoor(Door2)));

		break;
		case 3:
			AssignCommand(oBoss, ClearAllActions());
			DelayCommand(0.5,SithTorture(oBoss,10.00));

		break;
		case 4:
			SetGlobalFadeOut(3.0,2.0);
			DelayCommand(2.0, AssignCommand(Door2, ActionCloseDoor(Door2)));
		break;
		case 5:
			if(GetGlobalNumber("000_JoinKreia") != 0 && (GetIsObjectValid(GetObjectByTag("Disciple")) || GetIsObjectValid(GetObjectByTag("VisasMarr")))){
				AssignCommand(GetObjectByTag("905vscs"),ActionStartConversation(GetFirstPC(), "905vs", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
			else{
				SetGlobalFadeIn(0.0, 2.0);
			SleepyState();
			}
		break;
		case 6:
			SetGlobalFadeIn(0.0, 2.0);
			AssignCommand(oVictim, ActionAttack(Door4));
			DelayCommand(1.0, AssignCommand(oVictim, ActionAttack(Door4)));
			DelayCommand(2.0, AssignCommand(oVictim, ActionAttack(Door4)));
			DelayCommand(3.0, AssignCommand(oVictim, ActionAttack(Door4)));
			DelayCommand(4.0, AssignCommand(oVictim, ActionAttack(Door4)));
		break;
		case 7:
			//SetGlobalFadeIn(0.0, 2.0);
			CancelCombat(oVictim );
			AssignCommand(oVictim, ClearAllActions());
			DelayCommand(0.5, AssignCommand(oVictim, ActionPlayAnimation(12, 1.0)));
			DelayCommand(3.5, AssignCommand(oVictim, ActionMoveToObject(GetObjectByTag("wp_cage_cell1"), FALSE, 0.1)));
		break;
		case 8:

			DelayCommand(2.0, AssignCommand(Door4, ActionOpenDoor(Door4)));

		break;
		case 9:

			AssignCommand(oVictim, SetFacingPoint(GetPosition(GetObjectByTag("wp_vsv_1"))));

		break;
		case 10:

			AssignCommand(oVictim, ActionMoveToObject(GetObjectByTag("wp_vsv_1"), FALSE, 0.1));

		break;
		case 11:

			AssignCommand(oVictim, ActionPlayAnimation(100, 1.0));

		break;
		case 12:
			AssignCommand(oVictim, ClearAllActions());
			AssignCommand(oVictim, ActionMoveToObject(GetObjectByTag("wp_vsv_2"), FALSE, 0.1));
		break;
		case 13:
			DelayCommand(1.0, AssignCommand(Door3, ActionOpenDoor(Door3)));
			DelayCommand(1.0, AssignCommand(oAttacker, ActionMoveToObject(GetObjectByTag("wp_vsa_2"), FALSE, 0.1)));

		break;
		case 14:
			CreatureFlourishWeapon(oAttacker);
			SetGlobalFadeOut(2.0, 0.0);
		break;
		case 15:
			SetGlobalFadeIn(1.0, 1.5);
		break;
		case 16:
			SetGlobalFadeIn(1.0, 1.5);
			AssignCommand(oBoss, ClearAllActions());
			DelayCommand(0.5,SithTorture(oBoss,20.0));
			oAppr = CreateObject(OBJECT_TYPE_CREATURE, "g_intro_app", GetLocation(GetObjectByTag("sp_intro_sl")));
			SetLockOrientationInDialog(oAppr, TRUE);
			DelayCommand(0.5, AssignCommand(oAppr, ActionMoveToObject(GetObjectByTag("wp_intro_sl_3"), TRUE, 0.1)));
		break;
		case 17:
			SetLockOrientationInDialog(oAppr, TRUE);
			DelayCommand(1.5, AssignCommand(Door2, ActionOpenDoor(Door2)));
		break;
		case 18:
			AssignCommand(oBoss, ClearAllActions());
			AssignCommand(oBoss, ClearAllEffects());
			SleepyState();
			AssignCommand(oAttacker, ClearAllActions());
			AssignCommand(oVictim, ClearAllActions());


			//DelayCommand(1.0, AssignCommand(oBoss, SetFacingPoint(GetPosition(oAppr))));
		break;
		case 19:
			SetGlobalFadeOut(2.0, 3.0);
		break;
		case 20:
			SetGlobalFadeIn(0.0, 3.0);

			/*AssignCommand(GetObjectByTag("Mira"), ClearAllActions());
			AssignCommand(GetObjectByTag("Hanharr"), ClearAllActions());
			AssignCommand(GetObjectByTag("Handmaiden"), ClearAllActions());

			AssignCommand(GetObjectByTag("Mira"), ClearAllEffects());
			AssignCommand(GetObjectByTag("Hanharr"), ClearAllEffects());
			AssignCommand(GetObjectByTag("Handmaiden"), ClearAllEffects());

			AssignCommand(GetObjectByTag("Mira"), JumpToLocation(wMira2));
			AssignCommand(GetObjectByTag("Hanharr"), JumpToLocation(wMira2));
			AssignCommand(GetObjectByTag("Handmaiden"), JumpToLocation(wHand2));*/

			AssignCommand(oAppr, ClearAllActions());
			AssignCommand(oBoss, ClearAllActions());
			AssignCommand(oAppr, ClearAllEffects());
			AssignCommand(oBoss, ClearAllEffects());
			AssignCommand(oAppr, JumpToLocation(wAppr2));
			AssignCommand(oBoss, JumpToLocation(wBoss2));

			/*if(!(oVictim==GetObjectByTag("VisasMarr"))){
				AssignCommand(GetObjectByTag("VisasMarr"), ClearAllActions());
				AssignCommand(GetObjectByTag("VisasMarr"), ClearAllEffects());
				AssignCommand(GetObjectByTag("VisasMarr"), JumpToLocation(wVisas2));
			}
			if(!(oVictim==GetObjectByTag("Disciple"))){
				AssignCommand(GetObjectByTag("Disciple"), ClearAllActions());
				AssignCommand(GetObjectByTag("Disciple"), ClearAllEffects());
				AssignCommand(GetObjectByTag("Disciple"), JumpToLocation(wMira2));
			}*/

			DelayCommand(3.0, AssignCommand(oAppr, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0)));
			AssignCommand(Door4, ActionCloseDoor(Door4));
			AssignCommand(Door3, ActionCloseDoor(Door3));
		break;
		case 21:
			AssignCommand(oBoss, SetFacingPoint(GetPosition(oAppr)));
		break;
		case 22:
			AssignCommand(oAppr, SetFacingPoint(GetPosition(oBoss)));
		break;
		case 23:
			AssignCommand(oAppr, ActionPlayAnimation(102, 1.0,-1.0));
			AssignCommand(oBoss, ActionMoveToObject(GetObjectByTag("sp_intro_sl"), TRUE, 1.0));
		break;
		case 24:
			Die();
			DelayCommand(0.5, ClearForce(oBoss));
			DelayCommand(2.0, AssignCommand(oBoss, ClearAllActions()));
		break;


	}
}