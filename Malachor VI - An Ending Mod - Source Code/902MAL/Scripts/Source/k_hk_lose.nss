#include "k_inc_generic";

void CheckFightEnd(){

	if(GetCurrentHitPoints(GetObjectByTag("HK47")) <= 1){


		
		SetGlobalNumber("902MassShadow_End", 2);
		SetGlobalFadeOut(0.0,1.0);
		SetFadeUntilScript();
		GN_ResetDroidDeactivationState(GetObjectByTag("HK47"));
		CancelCombat(GetFirstPC());
		//NoClicksFor(1.0);
              ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);		

		DelayCommand(1.0, AssignCommand(GetObjectByTag("Remote"), ActionStartConversation(GetObjectByTag("HK47"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		DestroyObject(OBJECT_SELF);

	}
	if(GetIsObjectValid(GetObjectByTag("G0T0")) && GetCurrentHitPoints(GetObjectByTag("G0T0")) <= 2){


		SetGlobalNumber("902MassShadow_End", 1);
		SetGlobalFadeOut(0.0,1.0);
		SetFadeUntilScript();
		CancelCombat(GetFirstPC());
		//NoClicksFor(1.0);
              ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);

		DelayCommand(1.0, AssignCommand(GetObjectByTag("Remote"), ActionStartConversation(GetObjectByTag("HK47"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		DestroyObject(OBJECT_SELF);

	}

}

void main(){


CheckFightEnd();
DelayCommand(1.0, CheckFightEnd());
DelayCommand(1.5, CheckFightEnd());
DelayCommand(2.0, CheckFightEnd());
DelayCommand(2.5, CheckFightEnd());


}