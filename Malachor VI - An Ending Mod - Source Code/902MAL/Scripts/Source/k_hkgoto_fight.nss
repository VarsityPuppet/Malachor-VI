#include "k_inc_generic"

void Check(){


		if(GetGlobalNumber("902MassShadow_End") == 0){
			if(GetCurrentHitPoints(GetFirstPC()) <= 1){
				//SendMessageToPC(GetFirstPC(),  "Check registered, variable 2");
				RemoveHeartbeat(OBJECT_SELF);
				SetGlobalNumber("902MassShadow_End", 2);
				SetGlobalFadeOut(0.5,2.5);
				SetFadeUntilScript();
				AssignCommand(GetObjectByTag("HK47"), ClearAllActions());
				AssignCommand(GetObjectByTag("G0t0"), ClearAllActions());
				CancelCombat(GetObjectByTag("HK47"));
				DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), GetFirstPC() ));

				ChangeToStandardFaction(GetObjectByTag("HK51_1",0) , 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 0), 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 1), 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 2), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50_1",0) , 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 0), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 1), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 2), 5);

				ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);

				DelayCommand(2.0, AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetObjectByTag("sensorcs"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
			}
			if(GetCurrentHitPoints(GetObjectByTag("G0t0")) <= 10 &&
			GetIsObjectValid(GetObjectByTag("G0t0")) ){
				//SendMessageToPC(GetFirstPC(),  "Check registered, variable 1");
				RemoveHeartbeat(OBJECT_SELF);
				SetGlobalNumber("902MassShadow_End", 1);
				SetGlobalFadeOut(0.0,2.0);
				SetFadeUntilScript();

				ChangeToStandardFaction(GetObjectByTag("HK51_1",0) , 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 0), 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 1), 5);
				ChangeToStandardFaction(GetObjectByTag("HK51", 2), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50_1",0) , 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 0), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 1), 5);
				ChangeToStandardFaction(GetObjectByTag("HK50", 2), 5);
				ChangeToStandardFaction(GetObjectByTag("G0t0"), 2);

				AssignCommand(GetObjectByTag("HK47"), ClearAllActions());
				AssignCommand(GetObjectByTag("G0t0"), ClearAllActions());
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), GetObjectByTag("G0t0"));

				//SetCommandable(FALSE, GetObjectByTag("G0t0"));
				DelayCommand(2.0, AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetObjectByTag("sensorcs"), "sensorfi", 1, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
			}
//SendMessageToPC(GetFirstPC(), "Check is running because variable is 0");
		}


//DelayCommand(0.5, ForceHeartbeat(GetFirstPC()));

}

void main(){


Check();
DelayCommand(0.5, Check());
DelayCommand(1.0, Check());
DelayCommand(1.5, Check());
DelayCommand(2.0, Check());
DelayCommand(2.5, Check());
}
