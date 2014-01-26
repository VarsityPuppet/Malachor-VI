void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	PlayMovie("TelMov02", 0);
	SetGlobalNumber("907MAL_CUTSCENE", 2);
	SetGlobalNumber("003EBO_BACKGROUND" , 8);
	SetGlobalNumber("900MAL_Open",1);
	SetGlobalNumber("003EBO_RETURN_DEST", 8);
	StartNewModule("907MAL", "", "", "", "", "", "", "");

}








