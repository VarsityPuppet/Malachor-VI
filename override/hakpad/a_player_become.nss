void BecomePerson(int num){


SwitchPlayerCharacter(num);

}




void main(){

int param1 = GetScriptParameter(1);

DelayCommand(0.2, BecomePerson(param1));


}