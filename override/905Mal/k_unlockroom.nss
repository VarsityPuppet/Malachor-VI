//:: k_def_death01
/*
    Default On Death Script
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_switch"
#include "k_inc_debug"

void main()
{
	object oMD0205 = GetObjectByTag("MD02-05");
	object oMD0206 = GetObjectByTag("MD02-06");


	AssignCommand(oMD0205, ActionOpenDoor(oMD0205));
	AssignCommand(oMD0206, ActionOpenDoor(oMD0206));

ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);
}
