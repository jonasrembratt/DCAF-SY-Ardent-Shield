local menuCommands = {}
local menuGMHariri = "Hariri assassination"
local menuGM_Civ_FR_A380_START = "START B747 Sydney > Paris"
menuGM_Civ_FR_A380_DIVERT = "DIVERT French B747 Sydney > Paris"
local menuGM_Civ_IS_Cessna_START = "START Isreaeli Cessna"
menuGM_Civ_IS_Cessna_DIVERT = "DIVERT Isreaeli Cessna"
local menuGM_Mil_SY_AN26_TPT_START = "START SY AN26 TPT Abu-al-Duhur > Mezzeh"
menuGM_Mil_SY_AN26_TPT_DIVERT = "DIVERT SY AN26 TPT Abu-al-Duhur > Mezzeh"
local menuGM_Tankers_Shell_1_RTB = "Shell 1 - RTB"
local menuGM_Tankers_Texaco_1_1_RTB = "Texaco 1 - RTB"


function SetFlag( Name, Value, MenuKey )
  trigger.action.setUserFlag(Name, Value)
  BASE:E("Set flag '"..Name.."' = "..tostring(Value))
  RemoveMenuItem( MenuKey )
end

function RemoveMenuItem( key )
  local menuItem = menuCommands[key]
  if menuItem then
    BASE:E("Removes menu item '"..key.."'")
    menuItem.Remove(menuItem, 1, nil)
  else 
    BASE:E("(no menu item specified)")
  end
end

function RunHariri()
  SetFlag("hariri", true, menuGMHariri)
end



local MenuGM = MENU_COALITION:New(coalition.side.BLUE, "Game Master")
  menuCommands[menuGMHariri] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGMHariri, MenuGM, RunHariri)
  local MenuGMAir = MENU_COALITION:New(coalition.side.BLUE, "Air Traffic", MenuGM)
    menuCommands[menuGM_Civ_FR_A380_START] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Civ_FR_A380_START, MenuGMAir, SetFlag, "civ_fr_b747_start", true, menuGM_Civ_FR_A380_START)
    menuCommands[menuGM_Civ_FR_A380_DIVERT] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Civ_FR_A380_DIVERT, MenuGMAir, SetFlag, "civ_fr_b747_divert", true, menuGM_Civ_FR_A380_DIVERT)
    menuCommands[menuGM_Civ_IS_Cessna_START] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Civ_IS_Cessna_START, MenuGMAir, SetFlag, "civ_is_cessna_start", true, menuGM_Civ_IS_Cessna_START)
    menuCommands[menuGM_Civ_IS_Cessna_DIVERT] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Civ_IS_Cessna_DIVERT, MenuGMAir, SetFlag, "civ_is_cessna_divert", true, menuGM_Civ_IS_Cessna_DIVERT)
    menuCommands[menuGM_Mil_SY_AN26_TPT_START] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Mil_SY_AN26_TPT_START, MenuGMAir, SetFlag, "mil_sy_an26_start", true, menuGM_Mil_SY_AN26_TPT_START)
    menuCommands[menuGM_Mil_SY_AN26_TPT_DIVERT] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Mil_SY_AN26_TPT_DIVERT, MenuGMAir, SetFlag, "mil_sy_an26_divert", true, menuGM_Mil_SY_AN26_TPT_DIVERT)
  local MenuGMTankers = MENU_COALITION:New(coalition.side.BLUE, "Tankers", MenuGM)
    menuCommands[menuGM_Tankers_Shell_1_RTB] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Tankers_Shell_1_RTB, MenuGMTankers, SetFlag, "shell_1_rtb", true, menuGM_Tankers_Shell_1_RTB)
    menuCommands[menuGM_Tankers_Texaco_1_1_RTB] = MENU_COALITION_COMMAND:New(coalition.side.BLUE, menuGM_Tankers_Texaco_1_1_RTB, MenuGMTankers, SetFlag, "texaco_1_rtb", true, menuGM_Tankers_Texaco_1_1_RTB)