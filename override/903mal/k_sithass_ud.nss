void main(){

	int int1 = GetUserDefinedEventNumber();

	switch(int1){

		case 100:

			effect efVisual = EffectVisualEffect(8000, 0);
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, efVisual, OBJECT_SELF);

		break;
		case 200:
			RemoveEffectByID( OBJECT_SELF, 8000 );
			effect efVisual1 = EffectVisualEffect(8001, 0);
			ApplyEffectToObject(DURATION_TYPE_TEMPORARY, efVisual1, OBJECT_SELF, 5.0);

		break;
	}
}

