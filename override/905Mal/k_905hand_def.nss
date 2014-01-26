//:: k_def_damage01
/*
    Default On Damaged Script
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_switch"
#include "k_inc_debug"
#include "k_inc_bead-v"

void main()
{
    ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);
    /*
    if(GetCommandable() && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
    {
        if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            if(GetIsObjectValid(GetLastDamager()))
            {
                //MODIFIED by Preston Watamaniuk on May 9
                //Put this check in to make sure that people who turn neutral do not get the Determine Combat Round fired
                if(GetIsEnemy(GetLastDamager()))
                {
                    GN_DetermineCombatRound();
                    if(!GN_GetIsFighting(OBJECT_SELF))
                    {
                        object oTarget = GetLastDamager();
                        if(!GetObjectSeen(oTarget) && GetArea(OBJECT_SELF) == GetArea(oTarget))
                        {
                            ActionMoveToLocation(GetLocation(oTarget), TRUE);
                            GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Damaged");
                            ActionDoCommand(GN_DetermineCombatRound());
                        }
                    }
                }
            }
        }
        else if (!GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            object oTarget = GetAttackTarget();
            if(!GetIsObjectValid(oTarget))
            {
                oTarget = GetAttemptedAttackTarget();
            }
            object oAttacker = GetLastHostileActor();
            if (GetIsObjectValid(oAttacker) && oTarget != oAttacker && GetIsEnemy(oAttacker) &&
               (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                (GetHitDice(oAttacker) - 2) > GetHitDice(oTarget) ) )
            {
                GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Attacked 2");
                GN_DetermineCombatRound(oAttacker);
            }
        }
    }
    if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1006));
    }
    */
         object oDLG = GetObjectByTag("905dlghost");
         location wPC1 = Location(Vector(-102.84643, -36.97878, 3.0), Deg(1.73579));
         SetLocalBoolean(oDLG, 51, TRUE);

	 AssignCommand(GetFirstPC(), ClearAllActions());
	 CancelCombat(GetFirstPC());
	 SetLightsaberPowered(GetFirstPC(), FALSE, FALSE, TRUE);

         if(GetLocalBoolean(oDLG, 50)&&GetIsObjectValid(GetObjectByTag("VSVisas"))){
              //Fire visas dlg
              SetGlobalFadeOut(0.0, 1.0);
              AssignCommand(GetFirstPC(), ClearAllActions());
              AssignCommand(GetFirstPC(), ActionMoveToLocation(wPC1));
              SetLockOrientationInDialog(GetFirstPC(), 0);
              DelayCommand(1.0, AssignCommand(GetFirstPC(), ActionStartConversation(oDLG, "905vsex")));
         }
}
