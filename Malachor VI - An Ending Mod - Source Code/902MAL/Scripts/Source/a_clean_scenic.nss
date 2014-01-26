void main() {


DestroyObject(GetObjectByTag("Hanharr2"));
DestroyObject(GetObjectByTag("Atton"));
DestroyObject(GetObjectByTag("Handmaiden"));
DestroyObject(GetObjectByTag("Mira"));


//SendMessageToPC(GetFirstPC(), "a_scenic.nss fired");


int int3 = 0;
while(int3 <=10){
DestroyObject(GetObjectByTag("SithU",int3));
DestroyObject(GetObjectByTag("SithS",int3));
DestroyObject(GetObjectByTag("SithM",int3));
(int3++);
}
}

