#include "k_inc_bead-v"
void main(){
     object oVisas = GetObjectByTag("VisasMarr");
     int iParam = GetScriptParameter(1);
     object oPC = GetFirstPC();
     location wPC1 = Location(Vector(-102.84643, -36.97878, 3.0), Deg(1.73579));
     location wFake = Location(Vector(-103.54953, -35.84430, 3.15), 0.0);


     switch(iParam){
     case 0:
          AssignCommand(oPC, ClearAllActions());
          AssignCommand(oPC, JumpToLocation(wPC1));
          SetGlobalFadeIn(0.0, 1.0);
          //CreateObject(OBJECT_TYPE_PLACEABLE, "plc_fakehand", wFake);
     break;
     case 1:
     break;
     case 2:
     break;
     case 3:
     break;
     }
}