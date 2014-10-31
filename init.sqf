//Check HC by wolfenswan

ws_isHC = [] call ws_fnc_checkHC;

if (isNil "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};
isAIcontroller = ((isServer and !isDedicated) || (ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_isHC));

// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSentences false;

// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_briefing = [] execVM "f\briefing\briefing.sqf";

// ====================================================================================

// F3 - F3 Folk ARPS Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================

// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setTeamColours = [] execVM "f\setTeamColours\f_setTeamColours.sqf";

// ====================================================================================

// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] spawn f_fnc_SetLocalFTMemberMarkers;

// ====================================================================================

// F3 - F3 Folk ARPS Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupMarkers = [] execVM "f\groupMarkers\f_setLocalGroupMarkers.sqf";

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";


// ====================================================================================

// F3 - Dynamic View Distance
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_var_viewDistance_default = 2500;
[] execVM "f\dynamicViewDistance\f_setViewDistanceLoop.sqf";


// ====================================================================================

// F3 - Name Tags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

//f_showGroup_Nametags = true;			// Display unit's group (uses GroupID)
//f_showDistance_Nametags = true;			// Show distance to player
//f_showVehicle_Nametags = true;			// Show vehicle player is in
[10] execVM "f\nametag\f_nametags.sqf";

// ====================================================================================

// F3 - ORBAT Notes
// Credits: PabstMirror

[] execVM "f\briefing\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Join Group Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[false] execVM "f\groupJoin\f_groupJoinAction.sqf";

// ====================================================================================

// BWMF - Mission Timer/Safe Start

if (!isNil "PABST_fnc_safeStart") then {[] spawn PABST_fnc_safeStart;};

// ====================================================================================
// F3 - AI Unit Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
f_var_debugMode = 0;
[30] spawn f_fnc_cInit;

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:
// 1 - cache only non-leaders and non-drivers
// 2 - cache all non-moving units, always exclude vehicle drivers
// 3 - cache all units, incl. group leaders and vehicle drivers
f_var_cachingAggressiveness = 2;
// ====================================================================================

// F3 - Radio Framework
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
[] execVM "f\radios\radio_init.sqf";


//PABST: setup custom freqs automatically for people
[] execVM "pabst\pabst_setupRadioChannels.sqf";

// PABST: Disables thermals for all weapons/vehicles.
[] execVM "pabst\pabst_disableThermals.sqf";

// BWMF: DAC Debug Params

[] execVM "DAC\bwmf_dacParams.sqf";



//PABST: Uncomment to assign gear to all AI, even DAC spawned!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// [] execVM "pabst\pabst_setupGearForSpawned.sqf";