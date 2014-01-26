//  c_is_valid
/*
    Checks to see if the object with the specified tag is valid
*/
//  Tony Evans 10/13/04

int StartingConditional()
{
    object oHand = GetObjectByTag("Handmaiden");
    object oDisc = GetObjectByTag("Disciple");
    object oVisas = GetObjectByTag("VisasMarr");

    int param1 = GetScriptParameter(1);

if(param1 == 0){//Runs a check to see if Kreia knows more than one party member is present (minus Atton)
        if ( GetIsObjectValid(oHand) ||
             GetIsObjectValid(oDisc) ||
             GetIsObjectValid(oVisas)  ){
            return TRUE;
        }
        else{
        return FALSE;
        }
}
else if(param1 == 1){
        if ( GetIsObjectValid(oHand) ||
             GetIsObjectValid(oVisas)  ){
            return TRUE;
        }
        else{
        return FALSE;
        }
}
else{
    return FALSE;
}

}

