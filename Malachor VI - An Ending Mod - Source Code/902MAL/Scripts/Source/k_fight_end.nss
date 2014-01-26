#include "k_inc_generic";

void newGoto(){


	object onewG0t0 = CreateObject(1, "p_g0t002", GetLocation(GetWaypointByTag("sp_goto")), 0);
	AssignCommand(GetObjectByTag("G0t0F"), SetFacing(180.00));
	DelayCommand(1.0, AssignCommand(GetObjectByTag("G0t0F"), ActionPlayAnimation(26, 1.0, -1.0)));
}

void CheckFightEnd(){

	if(GetGlobalNumber("902MassShadow_End") == 0){
		if(GetCurrentHitPoints(GetFirstPC()) <= 1){

			SetGlobalNumber("902MassShadow_End", 2);

			SetGlobalFadeOut(0.5,1.0);

			SetFadeUntilScript();

			//GN_ResetDroidDeactivationState(GetObjectByTag("HK47"));

                     ChangeToStandardFaction(GetObjectByTag("HK51_1",0) , 5);

                     ChangeToStandardFaction(GetObjectByTag("HK51", 0), 5);

                     ChangeToStandardFaction(GetObjectByTag("HK51", 1), 5);

                     ChangeToStandardFaction(GetObjectByTag("HK51", 2), 5);

                     ChangeToStandardFaction(GetObjectByTag("HK50_1",0) , 5);

                     ChangeToStandardFaction(GetObjectByTag("HK50", 0), 5);

                     ChangeToStandardFaction(GetObjectByTag("HK50", 1), 5);

                     ChangeToStandardFaction(GetObjectByTag("HK50", 2), 5);

			ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);
			DelayCommand(3.0, AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetObjectByTag("HK47"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));


		}

		if(!GetIsObjectValid(GetObjectByTag("G0T0")) ){


			SetGlobalNumber("902MassShadow_End", 1);

			SetGlobalFadeOut(0.5,1.0);
			SetIsDestroyable(TRUE, TRUE, TRUE);
			SetFadeUntilScript();
			//ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(FALSE, FALSE, FALSE), GetObjectByTag("G0T0"));


			//NoClicksFor(3.0);
			ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);
			DelayCommand(3.0, AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetObjectByTag("HK47"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
			DelayCommand(2.0, newGoto());

		}


	}
}




void main(){



	CheckFightEnd();

	DelayCommand(1.0, CheckFightEnd());

	DelayCommand(1.5, CheckFightEnd());

	DelayCommand(2.0, CheckFightEnd());

	DelayCommand(2.5, CheckFightEnd());
	DelayCommand(3.0, CheckFightEnd());

	DelayCommand(3.5, CheckFightEnd());

	DelayCommand(4.0, CheckFightEnd());

	DelayCommand(4.5, CheckFightEnd());



}
