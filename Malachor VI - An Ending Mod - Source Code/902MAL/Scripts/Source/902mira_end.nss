void main() {
	//Fires when 902Mira ends. Added conditional for AFTER Hanharr is killed
	if ((GetGlobalNumber("101PER_Kreia_Res1") == 5)) {
		SetGlobalNumber("902MAL_Cutscene", 4);
		DestroyObject(GetObjectByTag("Hanharr2", 0), 0.0, 0, 0.0, 0);
		StartNewModule("902mal", "from_901mal");

	}
}



