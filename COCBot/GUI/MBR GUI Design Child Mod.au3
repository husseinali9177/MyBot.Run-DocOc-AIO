; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
$hGUI_MOD = GUICreate("", $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $frmBotEx)
;GUISetBkColor($COLOR_WHITE, $hGUI_BOT)

GUISwitch($hGUI_MOD)

$hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

Global $FirstControlToHideMOD = GUICtrlCreateDummy()

$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem("Miscellaneous")

Local $xStart = 0, $yStart = 0

;GUI modification by rulesss
  Local $x = 24, $y = 25
	  $grpCoCStats = GUICtrlCreateGroup("", $x - 20, $y, 440, 35)
   $y += 10
   $x+= -10
	   $chkCoCStats = GUICtrlCreateCheckbox(GetTranslated(110, 1,"CoCStats Activate"), $x , $y , -1, -1)
		   $txtTip = GetTranslated(110,2,"Activate sending raid results to CoCStats.com")
		   GUICtrlSetTip(-1, $txtTip)
		   GUICtrlSetOnEvent(-1, "chkCoCStats")
   $x += 135
	   $lblAPIKey = GUICtrlCreateLabel(GetTranslated(110, 3,"API Key:"), $x - 18, $y + 4 , -1, 21, $SS_LEFT)
		   $txtAPIKey = GUICtrlCreateInput("", $x + 30, $y , 250, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		   $txtTip = GetTranslated(110,4,"Join in CoCStats.com and input API Key here")
		   GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	 GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(655,13, "Switch Profiles"))

Local $x = 25, $y = 45

$grpGoldSwitch = GUICtrlCreateGroup(GetTranslated(19, 7, "Gold Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;Gold Switch
$chkGoldSwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 9, "Enable this to switch profiles when gold is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMax = GUICtrlCreateLabel(GetTranslated(19, 11, "When Gold is Above"), $x + 145, $y, -1, -1)
$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 12, "Set the amount of Gold to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)

$y += 30
$chkGoldSwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 13, "Enable this to switch profiles when gold is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMin = GUICtrlCreateLabel(GetTranslated(19, 14, "When Gold is Below"), $x + 145, $y, -1, -1)
$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 12, "Set the amount of Gold to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileGold = GUICtrlCreatePic(@ScriptDir & "\Images\GoldStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpElixirSwitch = GUICtrlCreateGroup(GetTranslated(19, 15, "Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Elixir Switch
$chkElixirSwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 16, "Enable this to switch profiles when Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)

$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMax = GUICtrlCreateLabel(GetTranslated(19, 17, "When Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 18, "Set the amount of Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$y += 30
$chkElixirSwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 19, "Enable this to switch profiles when Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMin = GUICtrlCreateLabel(GetTranslated(19, 20, "When Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 18, "Set the amount of Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileElixir = GUICtrlCreatePic(@ScriptDir & "\Images\ElixirStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpDESwitch = GUICtrlCreateGroup(GetTranslated(19, 21, "Dark Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;DE Switch
$chkDESwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 22, "Enable this to switch profiles when Dark Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblDEMax = GUICtrlCreateLabel(GetTranslated(19, 23, "When Dark Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 24, "Set the amount of Dark Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$y += 30
$chkDESwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 25, "Enable this to switch profiles when Dark Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblDEMin = GUICtrlCreateLabel(GetTranslated(19, 26, "When  Dark Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 24, "Set the amount of Dark Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$picProfileDE = GUICtrlCreatePic(@ScriptDir & "\Images\DEStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpTrophySwitch = GUICtrlCreateGroup(GetTranslated(19, 27, "Trophy Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Trophy Switch
$chkTrophySwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 28, "Enable this to switch profiles when Trophies are above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMax = GUICtrlCreateLabel(GetTranslated(19, 29, "When Trophies are Above"), $x + 145, $y, -1, -1)
$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 30, "Set the amount of Trophies to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$y += 30
$chkTrophySwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(19, 31, "Enable this to switch profiles when Trophies are below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(19, 10, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMin = GUICtrlCreateLabel(GetTranslated(19, 32, "When Trophies are Below"), $x + 145, $y, -1, -1)
$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(19, 30, "Set the amount of Trophies to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$picProfileTrophy = GUICtrlCreatePic(@ScriptDir & "\Images\TrophyLeague.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBoxswitch()

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem(GetTranslated(107,1,"Forecast"))

Global $grpForecast
Global $ieForecast

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 25
	$ieForecast = GUICtrlCreateObj($oIE, $x , $y , 430, 310)

GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += + 318
	$chkForecastBoost = GUICtrlCreateCheckbox("Boost When >", $x, $y, -1, -1)
		$txtTip = "Boost Barracks,Heroes, when the loot index."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkForecastBoost")
	$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 90, $y + 2, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		$txtTip = "Minimum loot index for boosting."
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetTip(-1, $txtTip)
		_GUICtrlEdit_SetReadOnly(-1, True)
		GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += - 27
	$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox("", $x + 158, $y + 27, 13, 13)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
			GUICtrlCreateLabel(GetTranslated(107,16,"Switch to"), $x + 177, $y + 27, -1, -1)
	$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 225, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMax = GUICtrlCreateLabel(GetTranslated(107,17,"When Index <"), $x + 325, $y + 28, -1, -1)
	$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 400, $y + 26, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
	$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox("", $x + 158, $y + 55, 13, 13)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
			GUICtrlCreateLabel(GetTranslated(107,18,"Switch to"), $x + 177, $y + 55, -1, -1)
	$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 225, $y + 53, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMin = GUICtrlCreateLabel(GetTranslated(107,19,"When Index >"), $x + 325, $y + 58, -1, -1)
	$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 400, $y + 54, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBox()
GUICtrlCreateGroup("", -99, -99, 1, 1)
	$cmbSwLang = GUICtrlCreateCombo("", $x, $y + 50, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
             GUICtrlSetData(-1, "EN|RU|FR|DE|ES|IT|PT|IN", "EN")
GUICtrlCreateTabItem("")

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------
