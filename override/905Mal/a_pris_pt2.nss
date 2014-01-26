void main(){

if(GetLocalNumber(GetObjectByTag("Mainterm"),30) == 1){
AssignCommand(GetObjectByTag("905IntroCs"), ActionStartConversation(GetFirstPC(), "905intro", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));

SetLocalNumber(GetObjectByTag("Mainterm"),30,2);
}

}