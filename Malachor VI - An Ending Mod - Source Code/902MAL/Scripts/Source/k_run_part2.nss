
void main() {
	
	SetGlobalNumber("902MassShadow_End", 1);

	object newG0t0 = CreateObject(OBJECT_TYPE_PLACEABLE, "p_g0t0_02", GetLocation(OBJECT_SELF));


		///GN_ResetDroidDeactivationState(GetObjectByTag("G0t0"));

		//ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), GetObjectByTag("G0T0"));
		CancelCombat(GetFirstPC());
		NoClicksFor(1.0);
		SetGlobalFadeOut(0.0,1.0);
		SetFadeUntilScript();	


	AssignCommand(GetObjectByTag("sensorcs"), ActionStartConversation(GetFirstPC() , "sensorfi", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));


}