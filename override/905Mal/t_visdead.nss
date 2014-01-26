#include "k_inc_bead-v"
void main(){
     if(GetEnteringObject()==GetFirstPC()){
          object oDLG = GetObjectByTag("905dlghost");
          SetLocalBoolean(oDLG, 50, TRUE);
          location wPC1 = Location(Vector(-102.84643, -36.97878, 3.0), Deg(1.73579));
          location wFake = Location(Vector(-103.54953, -35.84430, 3.15), 0.0);

          if(GetLocalBoolean(oDLG, 51)){
               //Fire visas dialog
               SetGlobalFadeOut(0.0, 1.0);
               AssignCommand(GetFirstPC(), ClearAllActions());
               AssignCommand(GetFirstPC(), ActionMoveToLocation(wPC1));
               SetLockOrientationInDialog(GetFirstPC(), 0);
               CreateObject(OBJECT_TYPE_PLACEABLE, "plc_fakehand", wFake);
               DelayCommand(1.5, AssignCommand(oDLG, ActionStartConversation(GetFirstPC(), "905vsex")));
          }
     }
}