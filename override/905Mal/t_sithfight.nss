void main(){

	object oBoss = GetObjectByTag("PBoss");

	AssignCommand(GetFirstPC(), ActionStartConversation(oBoss, "sithfight"));



}