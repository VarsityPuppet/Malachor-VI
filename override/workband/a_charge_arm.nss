void main(){




object oItem = GetFirstItemInInventory(GetFirstPC());
string sItem = GetTag(oItem);
object preItem;
object newItem;
object oBench;

if(!GetIsObjectValid(GetObjectByTag("wb_helper")))
oBench = CreateObject(OBJECT_TYPE_CREATURE, "wb_helper", GetLocation(GetFirstPC()));

else{ oBench = GetObjectByTag("wb_helper");}


	while(oItem != OBJECT_INVALID){

		if(GetBaseItemType(oItem) == 46 && GetItemHasItemProperty(oItem, 10)){
			int nStack = GetItemStackSize(oItem);
			CreateItemOnObject(sItem, oBench, nStack);
		}

		oItem = GetNextItemInInventory(GetFirstPC());
		sItem = GetTag(oItem);
	}

oItem = GetFirstItemInInventory(GetFirstPC());
sItem = GetTag(oItem);

	while(oItem != OBJECT_INVALID){

		if(GetBaseItemType(oItem) == 46 && GetItemHasItemProperty(oItem, 10)){

			DestroyObject(oItem);
		}

		oItem = GetNextItemInInventory(GetFirstPC());
		sItem = GetTag(oItem);
	}

oItem = GetFirstItemInInventory(oBench);
sItem = GetTag(oItem);

	while(GetIsObjectValid(oItem)){

		AssignCommand(oBench, ActionGiveItem(oItem, GetFirstPC()));

		oItem = GetNextItemInInventory(oBench);
		//sItem = GetTag(oItem);
	}
SetIsDestroyable(TRUE, FALSE, FALSE);
DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oBench));

}