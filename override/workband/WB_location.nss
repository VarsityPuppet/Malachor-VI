#include "k_inc_bead-v.nss"

void main(){
	int Param1 = GetScriptParameter(1);
	string sPost;
	string sStart = "*Starting output.*"+NEW_LINE;
	string sEnd = "*Ending output.*";

	if(Param1==1){
		float X = GetPosition(OBJECT_SELF).x;
		float Y = GetPosition(OBJECT_SELF).y;
		float Z = GetPosition(OBJECT_SELF).z;
		float F = GetFacing(OBJECT_SELF);
		if(F>180.0) F=F-360.0;
		float R = F*PI/180.0;
		float XO = cos(F);
		float YO = sin(F);
		float COS = cos((F-90.0)/2);
		float SIN = sin((F-90.0)/2);

		sPost = sStart+"- X: "+FloatToString(X, 9, 9)+"- Y: "+FloatToString(Y, 9, 9)+"- Z: "+FloatToString(Z, 9, 9)+"- Degrees: "+FloatToString(F, 9, 9)+"- Radians: "+FloatToString(R, 9, 9)+"- X Orientation: "+FloatToString(XO, 9, 9)+"- Y Orientation: "+FloatToString(YO, 9, 9)+"- Cos: "+FloatToString(COS, 9, 9)+"- Sin: "+FloatToString(SIN, 9, 9)+sEnd;
	}
	else if(Param1==0){
		object oObject = GetNearestObject(OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_TRIGGER | OBJECT_TYPE_WAYPOINT | OBJECT_TYPE_DOOR);
		string nObject = "Nearest Object: ''"+GetTag(GetNearestObject(OBJECT_TYPE_ALL))+"'', a";
		string nCreature = "Nearest Creature: ''"+GetTag(GetNearestObject(OBJECT_TYPE_CREATURE))+"''"+NEW_LINE;
		string nDoor = "Nearest Door: ''"+GetTag(GetNearestObject(OBJECT_TYPE_DOOR))+"''"+NEW_LINE;
		string nPlaceable = "Nearest Placeable: ''"+GetTag(GetNearestObject(OBJECT_TYPE_PLACEABLE))+"''"+NEW_LINE;
		string nTrigger = "Nearest Trigger: ''"+GetTag(GetNearestObject(OBJECT_TYPE_TRIGGER))+"''"+NEW_LINE;
		string nWaypoint = "Nearest Waypoint: ''"+GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT))+"''"+NEW_LINE;

		sPost = sStart+nObject;
		if(oObject == GetNearestObject(OBJECT_TYPE_CREATURE)) sPost = sPost+" creature"+NEW_LINE;
		else if(oObject == GetNearestObject(OBJECT_TYPE_DOOR)) sPost = sPost+" door"+NEW_LINE;
		else if(oObject == GetNearestObject(OBJECT_TYPE_PLACEABLE)) sPost = sPost+" placeable"+NEW_LINE;
		else if(oObject == GetNearestObject(OBJECT_TYPE_TRIGGER)) sPost = sPost+" trigger"+NEW_LINE;
		else if(oObject == GetNearestObject(OBJECT_TYPE_WAYPOINT)) sPost = sPost+" waypoint"+NEW_LINE;
		else sPost = sPost+"n unknown object"+NEW_LINE;
		if(oObject != GetNearestObject(OBJECT_TYPE_CREATURE)) sPost = sPost+nCreature;
		if(oObject != GetNearestObject(OBJECT_TYPE_DOOR)) sPost = sPost+nDoor;
		if(oObject != GetNearestObject(OBJECT_TYPE_PLACEABLE)) sPost = sPost+nPlaceable;
		if(oObject != GetNearestObject(OBJECT_TYPE_TRIGGER)) sPost = sPost+nTrigger;
		if(oObject != GetNearestObject(OBJECT_TYPE_WAYPOINT)) sPost = sPost+nWaypoint;
		sPost = sPost+sEnd;
	}
	SendMessageToPC(GetFirstPC(), sPost);
}