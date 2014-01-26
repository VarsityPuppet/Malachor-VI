// Holowan Cloakworks 2 Start
// Credits: eiz, Lil' Jawa, Fred Tetra, tk102, General Kenobi

void main() {
	int nAppearance = GetScriptParameter(1);
	int nDisguise = EFFECT_TYPE_DISGUISE;
    object oPC = OBJECT_SELF;
    effect eEffect;
    
	if (nAppearance == 0) {
		eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect)) {
            if(GetEffectType(eEffect) == nDisguise) {
                RemoveEffect(oPC,eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }		
	} else {
		eEffect = EffectDisguise(nAppearance);
		//if (GetIsEffectValid(eEffect)) {
			//ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oPC);
		//}
ChangeObjectAppearance(oPC, nAppearance);
	}

}