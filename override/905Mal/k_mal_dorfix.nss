void main(){


	CreateObject(OBJECT_TYPE_DOOR, "door_mal04", GetLocation(OBJECT_SELF));




	if(GetIsOpen(OBJECT_SELF)){

		ActionOpenDoor(GetNearestObjectByTag(GetTag(OBJECT_SELF)));
	}
	RemoveHeartbeat(OBJECT_SELF);

}