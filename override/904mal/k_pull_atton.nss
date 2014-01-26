void main(){



	object oEntering = GetEnteringObject();
	object oAtton = GetObjectByTag("Atton");
	object oSion = GetObjectByTag("DarthSion");
	effect efPush = EffectForcePushTargeted(GetLocation(GetObjectByTag("wp_kreia_start")), 0);
	efPush = EffectLinkEffects(efPush, EffectVisualEffect(10014));
	int FightMode = GetLocalNumber(GetObjectByTag("Atton_Fake"), 20);

		if(oEntering == oAtton && FightMode == 1){

			AssignCommand(oSion, ClearAllActions());
			AssignCommand(oSion, ActionPlayAnimation(10065, 1.0, 1.0));
			DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, efPush, oAtton));

		}

}