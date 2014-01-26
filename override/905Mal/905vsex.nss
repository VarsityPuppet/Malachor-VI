#include "k_inc_bead-v"

void main(){
	int iParam = GetScriptParameter(1);
	int iCam2 = GetScriptParameter(2);
	int iCam3 = GetScriptParameter(3);
	int iCam4 = GetScriptParameter(4);
	int iCam5 = GetScriptParameter(5);

        float c =0.9;
	location wDoor = Location(Vector(-103.25230, -25.73640, 3.0), -90.0);
	location wPC1 = Location(Vector(-96.00520, -20.89521, 3.0), Deg(-3.13057));
	location wPC2 = Location(Vector(-99.76870, -20.98027, 3.0), Deg(-3.112));
	location wHand1 = Location(Vector(-103.29852, -34.47501, 3.0), -90.0);
	location wHand2 = Location(Vector(-103.29852, -32.02671, 3.0), 90.0);
	location wVisas = Location(Vector(-103.69852, -36.37501, 3.0), 90.0);
	location wVillain = Location(Vector(-130.62126, -53.78899, 3.0), Deg(2.99151));
	object oDoor = GetObjectByTag("md02-07");
	object oPC = GetFirstPC();
	object oHand;
	object oVisas;
	object oRealVisas;
	object oHead;
	object oBody;
	object oVillain;
        if(GetIsObjectValid(GetObjectByTag("VSHandmaiden", 0))){
		oHand = GetObjectByTag("VSHandmaiden", 0);
	}
        else if(GetIsObjectValid(GetObjectByTag("VSAtton", 0))){
		oHand = GetObjectByTag("VSAtton", 0);
	}
	if(GetIsObjectValid(GetObjectByTag("VSVisas", 0))){
		oVisas = GetObjectByTag("VSVisas", 0);
	}
	else if(GetIsObjectValid(GetObjectByTag("VSDisciple", 0))){
		oVisas = GetObjectByTag("VSDisciple", 0);
	}

	switch(iParam){
		case 0: //Exile walks in, stops, looks at the door
			//SetLockOrientationInDialog(oPC, 1);

			AssignCommand(oHand, ClearAllActions());
			AssignCommand(oHand, JumpToLocation(wHand1));

			if(GetTag(oHand)=="VSHandmaiden"){
				//oHand = CreateObject(OBJECT_TYPE_CREATURE, "c_vshandmaiden", wHand1);
   				oVisas = CreateObject(OBJECT_TYPE_CREATURE, "c_vsvisas", wVisas);
				oRealVisas = SpawnAvailableNPC(NPC_VISAS, wVisas);
			}
			else{
				//oHand = CreateObject(OBJECT_TYPE_CREATURE, "c_vsatton", wHand1);
   				oVisas = CreateObject(OBJECT_TYPE_CREATURE, "c_vsdisciple", wVisas);
				oRealVisas = SpawnAvailableNPC(NPC_DISCIPLE, wVisas);
			}

			oBody = GetItemInSlot(INVENTORY_SLOT_BODY, oRealVisas);
			oHead = GetItemInSlot(INVENTORY_SLOT_HEAD, oRealVisas);
			AssignCommand(oRealVisas, ActionUnequipItem(oBody, TRUE));
			AssignCommand(oRealVisas, ActionUnequipItem(oHead, TRUE));
			AssignCommand(oVisas, ActionTakeItem(oBody, oRealVisas));
			AssignCommand(oVisas, ActionTakeItem(oHead, oRealVisas));
			AssignCommand(oVisas, ActionEquipItem(oBody, INVENTORY_SLOT_BODY, TRUE));
			AssignCommand(oVisas, ActionEquipItem(oHead, INVENTORY_SLOT_HEAD, TRUE));
			SetGoodEvilValue(oVisas, GetGoodEvilValue(oRealVisas));

			/*if(GetTag(oHand)=="VSHandmaiden"){
				oVillain = CreateObject(OBJECT_TYPE_CREATURE, "c_copyhand", wVillain);
			}
			else{
				oVillain = CreateObject(OBJECT_TYPE_CREATURE, "c_copyatton", wVillain);
			}*/

                        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_fakehand", wVisas);
			AssignCommand(oDoor, ActionCloseDoor(oDoor));
			SetGlobalFadeIn(0.5, 2.0);
			AssignCommand(oPC, JumpToLocation(wPC1));
			DelayCommand(1.2, AssignCommand(oPC, ActionMoveToLocation(wPC2)));
			//DelayCommand(3.8, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT)));
			//DelayCommand(5.8, AssignCommand(oPC, SetFacingPoint(GetPosition(oDoor))));
		break;
		case 1: //looking at the door, the exile walks to it, and opens it
			ActionPauseConversation();
			AssignCommand(oVisas, SetFacing(DIRECTION_NORTH));

			if(GetTag(oHand)=="VSHandmaiden"){
				DestroyObject(GetObjectByTag("VisasMarr"));
				DestroyObject(GetObjectByTag("CopyHandmaiden"));
			}
			else{
				DestroyObject(GetObjectByTag("Disciple"));
				DestroyObject(GetObjectByTag("CopyAtton"));
			}

			SetLightsaberPowered(oHand, 1, 1, 0);
			SetLockOrientationInDialog(oHand, 1);
			SetLockOrientationInDialog(oVisas, 1);
                        AssignCommand(oPC, ClearAllActions());
			AssignCommand(oPC, ActionForceMoveToLocation(wDoor));
			DelayCommand(4.06, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
			DelayCommand(4.1, AssignCommand(oPC, SetFacing(-90.0)));
			//DelayCommand(2.8, SpawnObject(OBJECT_TYPE_PLACEABLE, "plc_dead_walk", GetLocation(oVisas)));
			DelayCommand(2.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE, TRUE), oVisas, -1.0));
			DelayCommand(2.8, AssignCommand(oVisas, ActionPlayAnimation(ANIMATION_LOOPING_DEAD, 1.0, -1.0)));
			DelayCommand(2.8, SetCommandable(FALSE, oVisas));
			DelayCommand(4.1, ActionResumeConversation());
		break;
		case 2: //Visas/Disciple falls over
			SetLockOrientationInDialog(oPC, 1);
			AssignCommand(oPC, SetFacing(-90.0));
			//AssignCommand(oVisas, ActionPlayAnimation(ANIMATION_LOOPING_DEAD, 1.0, -1.0));
		break;
		case 3: //Shocked exile
			AssignCommand(oPC, SetFacing(-90.0));
			DelayCommand(0.7, SetDialogPlaceableCamera(iCam2));
		break;
		case 4: //villain turns around and comes a bit closer to the exile.
                        ActionPauseConversation();
			AssignCommand(oPC, SetFacing(-90.0));
			DelayCommand(1.9, AssignCommand(oHand, SetFacingPoint(GetPosition(oPC))));
			//DelayCommand(3.5, SetDialogPlaceableCamera(iCam2));
			//DelayCommand(3.9, AssignCommand(oHand, ActionMoveToLocation(wHand2)));
			//DelayCommand(7.5, SetDialogPlaceableCamera(iCam3));
			//DelayCommand(7.5, CreatureFlourishWeapon(oHand));
                        DelayCommand(3.5, ActionResumeConversation());
		break;
                case 5:
                        ActionPauseConversation();
			AssignCommand(oPC, SetFacing(-90.0));
			DelayCommand(0.4, AssignCommand(oHand, ActionMoveToLocation(wHand2)));
			//DelayCommand(4.0, SetDialogPlaceableCamera(iCam3));
                        DelayCommand(4.5, ActionResumeConversation());
                break;
		case 6: //Flourish Weapon
			AssignCommand(oPC, SetFacing(-90.0));
                        CreatureFlourishWeapon(oHand);
                        //SetCommandable(0, oVisas);
                        //ChangeToStandardFaction(oVisas, 5);
		break;
		case 7: //LastNode
                        DestroyObject(GetObjectByTag("FakeHand"));
                        ChangeToStandardFaction(oHand, 1);
                        AssignCommand(oHand, ActionAttack(oPC));
			AssignCommand(oPC, SetFacing(-90.0));
			AssignCommand(oHand, SetIsDestroyable(FALSE, FALSE, FALSE));
		break;
	}
}