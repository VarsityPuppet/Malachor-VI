void main(){

int param1 = GetScriptParameter(1);


		SetGlobalNumber("907MAL_CUTSCENE", 0);
		SetGlobalFadeOut(0.8, 1.7);
		SetFadeUntilScript();
		DelayCommand(2.9, StartNewModule("907MAL"));
}