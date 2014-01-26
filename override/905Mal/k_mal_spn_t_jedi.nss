//:: from k_def_spawn01
/*
    v2.0
    Default On Spawn In with Jedi Treasure
*/
//:: Modified By: Anthony Davis
//:: Added treasure: Kevin Saunders
//:: Added Randomizing: Varsity Puppet

#include "k_inc_generic"
#include "k_inc_debug"
#include "k_inc_treas_k2"


//Gives the character a random appearance, based on the available options for the PC
void ChangeAppearance(object Changee);

//Equips the character with a single saber or a double-bladed saber.
//Equipping for two sabers hasn't worked yet...
void EquipSabers();

//Gives the character a random appearance. Unlike ChangeAppearance(),
//this does not use PC appearance options as bodymodels that are required
//For these specific types of characters. It uses the JediCouncil appearance
//rows instead.
void ChangeAppearancePrestigeClass(object Changee);


//Check the bottom of the script for details on the functions

void main(){

//If the character this script is being executed for is a Sith Marauder.
//change the appearance to reflect so

	if(GetTag(OBJECT_SELF) == "G_DARKJEDI04"){
		ChangeAppearancePrestigeClass(OBJECT_SELF);
	}

		//Or if this script is being executed for an object with the tag
		//"SithhAppren"

	else if(GetTag(OBJECT_SELF) == "SithAppren"){
		ChangeAppearancePrestigeClass(OBJECT_SELF);
	}

//If none of the above is true, choose a random PC appearance

	else if(GetTag(OBJECT_SELF) == "DarkJedi"){
		EquipSabers();
		ChangeAppearance(OBJECT_SELF);
	}


//The following is all default onspawn stuff

    //BEGIN WALK WAYPOINT BEHAVIORS (Comment In or Out to Activate )
    //****** WAYPOINT PATH STYLE ******
    // Object will follow waypoints in order, and then start over at beginning.
    // Example: WP_01, WP_02, WP_03, then return to WP_01 and continue...
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_CIRCULAR);
    // Object will follow waypoints in order, and then follow the waypoints backwards.
    // Example: WP_01, WP_02, WP_03, then WP_02, WP_01,
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_PATH);
    // Object will follow waypoints in a RANDOM order
    // Example: WP_02, WP_03, WP_01
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM);
    // Object will follow waypoints starting with NEAREST waypoint.
    // THIS WILL EFFECT THE ORDER THE WAYPOINTS ARE FOLLOWED!
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST);

    //****** WAYPOINT FREQUENCY ******
    // Object will follow waypoints ONLY ONCE.
    // Leave commented out to have waypoints repeated forever.
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_ONCE);

    //****** WAYPOINT SPEED ******
    // Object will RUN to waypoints.
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RUN);

    //****** WAYPOINT PAUSING ******
    // Object will PAUSE at each waypoints based on each option.
    // CObjects will ONLY turn to face in the waypoint direction if
    // the are pausing at the waypoint.
    // The pause times are:
    // Causes the Object to pause for 1 - 3 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_SHORT);
    // Causes the Object to pause for 4 - 6 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_LONG);
    // Causes the Object to pause for 1 - 10 seconds at a waypoint
    //GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_RANDOM);

    //****** WAYPOINT ANIMATIONS ******
    // Object will play an animation that has been specified with
    // SetLocalNumber(OBJECT_SELF, 29, <SOME ANIMATION NUMBER> )
    // Local number 29 is reserved for animations.
    // This may conflict with ambient animations (further down)
    //GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION);
    // If using an animation at a waypoint, uncomment and set the following lin:
    //SetLocalNumber(OBJECT_SELF, 29, <SOME ANIMATION NUMBER> );


    //****** WAYPOINT SERIES ******
    // If this function is uncommented a number from 1 to 99 must be passed.
    // This number represents a waypoint series that uses the string "01" through "99"
    // instead of the creature's tag.
    // eg. WP_22_01 through WP_22_05.  22 is the series number set with this function.
    //GN_SetWalkWayPointsSeries( 1 );

    //END WALK WAYPOINT BEHAVIORS

    //****** AMBIENT ANIMATIONS ******
    // This will play Ambient Animations until the NPC sees an enemy or is cleared.
    // NOTE: that these animations will play automatically for Encounter Creatures.
    //GN_SetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR);
    //GN_SetSpawnInCondition(SW_FLAG_FAST_BUFF);
    //GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS);
    //GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE);

    //****** COMPUTER DIALOG ******
    //When a creature with this flag is talked to a computer dialogue will come up instead of the usual screens.
    //GN_SetSpawnInCondition(SW_FLAG_ON_DIALOGUE_COMPUTER);

    //****** CUSTOM USER DEFINED EVENTS ******
    // The following settings will allow the user to fire one of the blank
    // user defined events in the NW_D2_DefaultD.  Like the OnSpawnIn script,
    // this script is meant to be customized by the end user to allow for unique
    // behaviors.  The user defined events user 1000 - 1010
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1001
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION);       //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_ATTACKED);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DISTURBED);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_COMBAT_ROUND_END); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH);            //OPTIONAL BEHAVIOR - Fire User Defined Event 1007
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DISTURBED);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_BLOCKED);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1009
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_FORCE_AFFECTED);   //OPTIONAL BEHAVIOR - Fire User Defined Event 1010
    //GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END);     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011

    //****** BEGIN DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ******
    GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
    // This function although poorly named sets up the listening patterns and other
    // important data for the creature it should never be removed.
    GN_SetListeningPatterns();
    SetLocalNumber(OBJECT_SELF, 11, 6);// FAK - OEI default turret cooldown
    //****** END DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ******

    //****** TREASURE PLACEMENT
    PlaceTreasureJedi(OBJECT_SELF, Random(4)-2);

    //****** TURN ON WALKPOINTS ******
    // The following line causes the object to follow waypoints
    GN_WalkWayPoints();
}




void ChangeAppearance(object Changee){

	int Appr;


//If the character is male, choose a random appearance
	if (GetGender(OBJECT_SELF) == 0){

//For random numbers 0-16, a specific value is assigned to
//int Appr. The values are appearance rows.

		switch (Random(16)){
			case 0:
				Appr = 136;
			break;
			case 1:
				Appr = 139;
			break;
			case 2:
				Appr = 142;
			break;
			case 3:
				Appr = 145;
			break;
			case 4:
				Appr = 148;
			break;
			case 5:
				Appr = 151;
			break;
			case 6:
				Appr = 154;
			break;
			case 7:
				Appr = 157;
			break;
			case 8:
				Appr = 160;
			break;
			case 9:
				Appr = 163;
			break;
			case 10:
				Appr = 166;
			break;
			case 11:
				Appr = 169;
			break;
			case 12:
				Appr = 172;
			break;
			case 13:
				Appr = 175;
			break;
			case 14:
				Appr = 178;
			break;
			case 15:
				Appr = 543; 
			break;
			case 16:
				Appr = 578; 
			break;
			default:
				Appr = 136;
			break;
		}
	}

	if (GetGender(OBJECT_SELF) == 1){

	//Same as above, but for females.
		switch (Random(17)){

			case 0:
				Appr = 91;
			break;
			case 1:
				Appr = 94;
			break;
			case 2:
				Appr = 97;
			break;
			case 3:
				Appr = 100;
			break;
			case 4:
				Appr = 103;
			break;
			case 5:
				Appr = 106;
			break;
			case 6:
				Appr = 109;
			break;
			case 7:
				Appr = 112;
			break;
			case 8:
				Appr = 115;
			break;
			case 9:
				Appr = 118;
			break;
			case 10:
				Appr = 121;
			break;
			case 11:
				Appr = 124;
			break;
			case 12:
				Appr = 127;
			break;
			case 13:
				Appr = 130;
			break;
			case 14:
				Appr = 133;
			break;
			case 15:
				Appr = 663; 
			break;
			case 16:
				Appr = 666; 
			break;
			case 17:
				Appr = 546; 
			break;
			default:
				Appr = 91;
			break;
		}
	}



	ChangeObjectAppearance(Changee, Appr);


	int PCAppr = GetAppearanceType(GetFirstPC());


	if( Appr == PCAppr || Appr+1 == PCAppr || Appr+2 == PCAppr ){

		ChangeAppearance(OBJECT_SELF);

	}

}


void EquipSabers(){

string sBlue = "g_w_lghtsbr01";
string sRed = "g_w_lghtsbr02";
string sGreen = "g_w_lghtsbr03";
string sYel = "g_w_lghtsbr04";
string sViol = "g_w_lghtsbr05";
string sOran = "g_w_lghtsbr07";
string sSilver = "g_w_lghtsbr09";
string sVirid = "g_w_lghtsbr11";
string sBlueD = "g_w_dblsbr001";
string sRedD = "g_w_dblsbr002";
string sGreenD = "g_w_dblsbr003";
string sYelD = "g_w_dblsbr004";
string sViolD = "g_w_dblsbr005";
string sOranD = "g_w_dblsbr007";
string sSilverD = "g_w_dblsbr009";
string sViridD = "g_w_dblsbr011";
string sBlueS = "g_w_shortsbr01";
string sRedS = "g_w_shortsbr02";
string sGreenS = "g_w_shortsbr03";
string sYelS = "g_w_shortsbr04";
string sViolS = "g_w_shortsbr05";
string sOranS = "g_w_shortsbr07";
string sSilverS = "g_w_shortsbr09";
string sViridS = "g_w_shortsbr11";

//Randomly determining if the character is single or double

int nDual = Random(10);
int nStaff = Random(4);

string sEquipR;
string sEquipL;

	if(GetTag(OBJECT_SELF) == "G_DARKJEDI04"){
		nDual = Random(6) + 4;
	}

	switch (Random(7)){
		case 0:
			sEquipR = sBlue;
		break;
		case 1:
			sEquipR = sRed;
		break;
		case 2:
			sEquipR = sGreen;
		break;
		case 3:
			sEquipR = sYel;
		break;
		case 4:
			sEquipR = sViol;
		break;
		case 5:
			sEquipR = sOran;
		break;
		case 6:
			sEquipR = sSilver;
		break;
		case 7:
			sEquipR = sVirid;
		break;
	}
	//if(GetTag(OBJECT_SELF) == "G_DARKJEDI04"){
		sEquipR = sRed;
	//}

    if(nDual >= 7){

	if( nStaff >= 3){

		switch (Random(7)){
			case 0:
				sEquipL = sBlueS;
			break;
			case 1:
				sEquipL = sRedS;
			break;
			case 2:
				sEquipL = sGreenS;
			break;
			case 3:
				sEquipL = sYelS;
			break;
			case 4:
				sEquipL = sViolS;
			break;
			case 5:
				sEquipL = sOranS;
			break;
			case 6:
				sEquipL = sSilverS;
			break;
			case 7:
				sEquipL = sViridS;
			break;
		}
		//if(GetTag(OBJECT_SELF) == "G_DARKJEDI04"){
			sEquipL = sRedS;
		//}
	}
	else if(nStaff < 3){
		switch (Random(7)){
			case 0:
				sEquipR = sBlueD;
			break;
			case 1:
				sEquipR = sRedD;
			break;
			case 2:
				sEquipR = sGreenD;
			break;
			case 3:
				sEquipR = sYelD;
			break;
			case 4:
				sEquipR = sViolD;
			break;
			case 5:
				sEquipR = sOranD;
			break;
			case 6:
				sEquipR = sSilverD;
			break;
			case 7:
				sEquipR = sViridD;
			break;
		}
		//if(GetTag(OBJECT_SELF) == "G_DARKJEDI04"){
				sEquipR = sRedD;
		//}
	}


    }

CancelCombat(OBJECT_SELF);

object oSaberR = CreateItemOnObject(sEquipR, OBJECT_SELF, 1, 1);
DelayCommand(0.3, ActionEquipItem( oSaberR,4));

object oSaberL = CreateItemOnObject(sEquipL, OBJECT_SELF, 1, 1);
DelayCommand(0.6, ActionEquipItem( oSaberL,5));

}
void ChangeAppearancePrestigeClass(object Changee){

	int Appr;

//Now here's a really long list of conditionals which will tell when the script needs to choose a different appearance
//when the appearance has the same head as the PC.
	
	int PCAppr = GetAppearanceType(GetFirstPC());

	if (GetGender(OBJECT_SELF) == 0){
		switch (Random(14)){
			case 0:
				Appr = 31;
				if(PCAppr >= 166 && PCAppr <= 168){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 1:
				Appr = 214;
				if(PCAppr >= 169 && PCAppr <= 171){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 2:
				Appr = 215;
				if(PCAppr >= 172 && PCAppr <= 174){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}

			break;
			case 3:
				Appr = 216;
				if(PCAppr >= 175 && PCAppr <= 177){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 4:
				Appr = 217;
			break;
			case 5:
				Appr = 218;
				if(PCAppr >= 136 && PCAppr <= 138){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 6:
				Appr = 219;
				if(PCAppr >= 139 && PCAppr <= 141){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 7:
				Appr = 220;
				if(PCAppr >= 142 && PCAppr <= 144){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}

			break;
			case 8:
				Appr = 221;
				if(PCAppr >= 145 && PCAppr <= 147){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}


			break;
			case 9:
				Appr = 222;
				if(PCAppr >= 148 && PCAppr <= 150){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 10:
				Appr = 223;
				if(PCAppr >= 151 && PCAppr <= 153){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 11:
				Appr = 224;
				if(PCAppr >= 154 && PCAppr <= 156){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			case 12:
				Appr = 225;
				if(PCAppr >= 157 && PCAppr <= 159){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 13:
				Appr = 226;
				if(PCAppr >= 160 && PCAppr <= 162){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}

			break;
			case 14:
				Appr = 227;

				if(PCAppr >= 163 && PCAppr <= 165){
					ChangeAppearancePrestigeClass(OBJECT_SELF);

				}
			break;
			default:
				Appr = 214;
			break;
		}
	}

	if (GetGender(OBJECT_SELF) == 1){
		switch (Random(14)){
			case 0:
				Appr = 30;
				if(PCAppr >= 121 && PCAppr <= 123){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 1:
				Appr = 200;
				if(PCAppr >= 124 && PCAppr <= 126){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 2:
				Appr = 201;
			break;
			case 3:
				Appr = 202;
				if(PCAppr >= 130 && PCAppr <= 132){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 4:
				Appr = 203;
				if(PCAppr >= 133 && PCAppr <= 135){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 5:
				Appr = 204;
				if(PCAppr >= 91 && PCAppr <= 93){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 6:
				Appr = 205;
				if(PCAppr >= 94 && PCAppr <= 96){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 7:
				Appr = 206;
				if(PCAppr >= 97 && PCAppr <= 99){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 8:

				Appr = 207;
				if(PCAppr >= 100 && PCAppr <= 102){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 9:

				Appr = 208;
				if(PCAppr >= 103 && PCAppr <= 105){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 10:

				Appr = 209;
				if(PCAppr >= 106 && PCAppr <= 108){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 11:
				Appr = 210;
				if(PCAppr >= 109 && PCAppr <= 111){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 12:
				Appr = 211;
				if(PCAppr >= 112 && PCAppr <= 114){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 13:
				Appr = 212;
				if(PCAppr >= 115 && PCAppr <= 117){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			case 14:
				Appr = 213;
				if(PCAppr >= 118 && PCAppr <= 120){
					ChangeAppearancePrestigeClass(OBJECT_SELF);
				}
			break;
			default:
				Appr = 200;

			break;
		}
	}


	ChangeObjectAppearance(Changee, Appr);

	if(PCAppr >= 136 && PCAppr <= 138){
		if(Appr == 218){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 139 && PCAppr <= 141){
		if(Appr == 219){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 142 && PCAppr <= 144){
		if(Appr == 220){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 148 && PCAppr <= 150){
		if(Appr == 222){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 154 && PCAppr <= 156){
		if(Appr == 224){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 157 && PCAppr <= 159){
		if(Appr == 225){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 160 && PCAppr <= 162){
		if(Appr == 226){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 163 && PCAppr <= 165){
		if(Appr == 227){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 166 && PCAppr <= 168){
		if(Appr == 31){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 172 && PCAppr <= 174){
		if(Appr == 215){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 175 && PCAppr <= 177){
		if(Appr == 216){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}

	if(PCAppr >= 151 && PCAppr <= 153){
		if(Appr == 223){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}
	if(PCAppr >= 145 && PCAppr <= 147){
		if(Appr == 221){
			ChangeAppearancePrestigeClass(OBJECT_SELF);
		}
	}


}




