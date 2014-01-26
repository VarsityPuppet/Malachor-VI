// c_remote_hawk
// Parameter Count: 1
// Param1 - The name of the area.
// Check to see if player is in "Param 1" area.
// CFA: 8-21-04

int StartingConditional()
{

    int param1 = GetScriptParameter(1);

switch(param1){

case 0:
    if ( GetModuleName() == "003EBO" &&
    GetGlobalBoolean("003EBO_REMOTE_MOVE") )
    {
        return TRUE;
    }
    return FALSE;
break;
case 1:
    if ( GetModuleName() == "003EBO" &&
    GetGlobalBoolean("003EBO_REMOTE_MOVE") )
    {
        return FALSE;
    }
    return TRUE;
break;
}

return FALSE;

}
