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

; Collect Treasury

Local $x = $xStart + 230, $y = $yStart - 80

$grpTreasury = GUICtrlCreateGroup("Collect Treasury", $x - 226, $y + 110, 440, 100) ;70
$chkCollectTresory = GUICtrlCreateCheckbox("Enable", $x - 210, $y + 135, -1, -1)
$txtTip = "Enable auto collect of treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresory")
GUICtrlSetState(-1, $GUI_UNCHECKED)
$leurequisertarienTresor = GUICtrlCreateLabel("", $x - 180, $y + 135, -1, -1, $SS_RIGHT)
GUICtrlCreateIcon($pIconLib, $eIcnGold, $x - 120, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$chkTRFull = GUICtrlCreateCheckbox("When Full", $x - 210, $y + 165, -1, -1)
$txtTip = "Check to the bot collect the treasury when full"
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_HIDE)
$txtTreasuryGold = GUICtrlCreateInput("0", $x - 100, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Gold amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_HIDE)

$chkCollectTresoryGold = GUICtrlCreateCheckbox("Gold", $x - 90, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Gold amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryGold")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x - 15, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetOR = GUICtrlCreateButton("Reset", $x - 92, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetOr")
GUICtrlSetState(-1, $GUI_HIDE)

$txtTreasuryElixir = GUICtrlCreateInput("0", $x + 5, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Elixir amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_HIDE)
$chkCollectTresoryElixir = GUICtrlCreateCheckbox("Elixir", $x + 10, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Elixir amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryElixir")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 90, $y + 150, 16, 16)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetEL = GUICtrlCreateButton("Reset", $x + 13, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetEL")
GUICtrlSetState(-1, $GUI_HIDE)

$txtTreasuryDark = GUICtrlCreateInput("0", $x + 110, $y + 150, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = "Minimum Dark Elixir amount below which the bot will collect the treasury."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
GUICtrlSetState(-1, $GUI_HIDE)
$chkCollectTresoryDark = GUICtrlCreateCheckbox("Dark Elixir", $x + 115, $y + 125, -1, -1)
$txtTip = "Enable automatic collect of treasury according to Dark Elixir amount."
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCollectTresoryDark")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetState(-1, $GUI_HIDE)
$btnResetDE = GUICtrlCreateButton("Reset", $x + 118, $y + 180, 45, 18)
GUICtrlSetOnEvent(-1, "ResetDE")
GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateGroup("", -99, -99, 1, 1)

;GUI modification by rulesss
  Local $x = 24, $y = 135
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

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------
