;MODded by DocOc++ Team AIO

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

$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem("Mod Options")

Local $xStart = 0, $yStart = 0

;GUI modification by rulesss
Local $x = 24, $y = 25
$grpCoCStats = GUICtrlCreateGroup("", $x - 20, $y, 440, 35)
$y += 10
$x += -10
$chkCoCStats = GUICtrlCreateCheckbox(GetTranslated(110, 1, "CoCStats Activate"), $x, $y, -1, -1)
$txtTip = GetTranslated(110, 2, "Activate sending raid results to CoCStats.com")
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkCoCStats")
$x += 135
$lblAPIKey = GUICtrlCreateLabel(GetTranslated(110, 3, "API Key:"), $x - 18, $y + 4, -1, 21, $SS_LEFT)
$txtAPIKey = GUICtrlCreateInput("", $x + 30, $y, 250, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = GetTranslated(110, 4, "Join in CoCStats.com and input API Key here")
GUICtrlSetTip(-1, $txtTip)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem("Switch Account")
Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

Local $x = 25, $y = 45
$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Switch Profiles"), $x - 20, $y - 20, 440, 360)
$x -= 5
$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(637,2, "Use this to switch to a different profile")& @CRLF & GetTranslated(637,3, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
_GUICtrlSetTip(-1, $txtTip)
setupProfileComboBox()
PopulatePresetComboBox()
GUICtrlSetState(-1, $GUI_SHOW)
GUICtrlSetOnEvent(-1, "cmbProfile")
$txtVillageName = GUICtrlCreateInput(GetTranslated(637,4, "MyVillage"), $x - 3, $y, 130, 22, $ES_AUTOHSCROLL)
GUICtrlSetLimit (-1, 100, 0)
GUICtrlSetFont(-1, 9, 400, 1)
_GUICtrlSetTip(-1, GetTranslated(637,5, "Your village/profile's name"))
GUICtrlSetState(-1, $GUI_HIDE)
; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed

$bIconAdd = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
$bIconConfirm = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
$bIconDelete = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
$bIconCancel = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
$bIconEdit = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
; IceCube (Misc v1.0)
$bIconRecycle = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_4.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
; IceCube (Misc v1.0)

$btnAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
GUICtrlSetOnEvent(-1, "btnAddConfirm")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(637,6, "Add New Profile"))
$btnConfirmAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
GUICtrlSetOnEvent(-1, "btnAddConfirm")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,7, "Confirm"))
$btnConfirmRename = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
GUICtrlSetOnEvent(-1, "btnRenameConfirm")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,7, -1))
$btnDelete = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
GUICtrlSetOnEvent(-1, "btnDeleteCancel")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(637,8, "Delete Profile"))
$btnCancel = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
GUICtrlSetOnEvent(-1, "btnDeleteCancel")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,9, "Cancel"))
$btnRename = GUICtrlCreateButton("", $x + 194, $y, 24, 24)
_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
GUICtrlSetOnEvent(-1, "btnRenameConfirm")
_GUICtrlSetTip(-1, GetTranslated(637,10, "Rename Profile"))
; IceCube (Misc v1.0)
$btnRecycle = GUICtrlCreateButton("", $x + 223, $y + 2, 22, 22)
_GUICtrlButton_SetImageList($btnRecycle, $bIconRecycle, 4)
GUICtrlSetOnEvent(-1, "btnRecycle")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(655,12, "Recycle Profile by removing all settings no longer suported that could lead to bad behaviour"))
If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
GUICtrlSetState(-1, $GUI_DISABLE)
Else
GUICtrlSetState(-1, $GUI_ENABLE)
EndIf
; IceCube (Misc v1.0)

GUICtrlCreateGroup("", -99, -99, 1, 1)

#include "..\functions\RoroTiti MODs\Misc\MBR GUI Design - SmartSwitchAccount.au3"
GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem(GetTranslated(655, 13, "Switch Profiles"))

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

$hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem(GetTranslated(106, 1, "Chat"))

ChatbotReadSettings()

Local $x = 22, $y = 47

GUICtrlCreateGroup(GetTranslated(106, 2, "Global Chat"), $x - 20, $y - 20, 215, 360)
$y -= 5
$chkGlobalChat = GUICtrlCreateCheckbox(GetTranslated(106, 3, "Advertise in global"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkGlobalChat, GetTranslated(106, 4, "Use global chat to send messages"))
GUICtrlSetState($chkGlobalChat, $ChatbotChatGlobal)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkGlobalScramble = GUICtrlCreateCheckbox(GetTranslated(106, 5, "Scramble global chats"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkGlobalScramble, GetTranslated(106, 6, "Scramble the message pieces defined in the textboxes below to be in a random order"))
GUICtrlSetState($chkGlobalScramble, $ChatbotScrambleGlobal)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkSwitchLang = GUICtrlCreateCheckbox(GetTranslated(106, 7, "Switch languages"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkSwitchLang, GetTranslated(106, 8, "Switch languages after spamming for a new global chatroom"))
GUICtrlSetState($chkSwitchLang, $ChatbotSwitchLang)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
;======kychera===========
$cmbLang = GUICtrlCreateCombo("", $x + 120, $y, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "FR|DE|ES|IT|NL|NO|PR|TR|RU", "RU")
;==========================
$y += 25
$ChatbotChatDelayLabel = GUICtrlCreateLabel(GetTranslated(106, 9, "Chat Delay"), $x - 10, $y)
GUICtrlSetTip($ChatbotChatDelayLabel, GetTranslated(106, 10, "Delay chat between number of bot cycles"))
$chkchatdelay = GUICtrlCreateInput("0", $x + 50, $y - 2, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$y += 22
$editGlobalMessages1 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages1, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages1, GetTranslated(106, 11, "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages2 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages2, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages2, GetTranslated(106, 12, "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages3 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages3, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages3, GetTranslated(106, 13, "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages4 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages4, @CRLF), $x - 15, $y, 202, 55)
GUICtrlSetTip($editGlobalMessages4, GetTranslated(106, 14, "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 240, $y = 47

GUICtrlCreateGroup(GetTranslated(106, 15, "Clan Chat"), $x - 20, $y - 20, 218, 360)
$y -= 5
$chkClanChat = GUICtrlCreateCheckbox(GetTranslated(106, 16, "Chat in clan chat:"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkClanChat, GetTranslated(106, 17, "Use clan chat to send messages"))
GUICtrlSetState($chkClanChat, $ChatbotChatClan)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$chkRusLang = GUICtrlCreateCheckbox(GetTranslated(106, 52, "Russian"), $x + 130, $y)
GUICtrlSetState(-1, $GUI_UNCHECKED)
_GUICtrlSetTip(-1, GetTranslated(106, 51, "On. Russian send text. Note: The input language in the Android emulator must be RUSSIAN."))
;GUICtrlSetOnEvent(-1, "chkRusLang")
$y += 22
$chkUseResponses = GUICtrlCreateCheckbox(GetTranslated(106, 18, "Use custom responses"), $x - 10, $y, -1, -1) ;GUICtrlCreateCheckbox(GetTranslated(106,18,"Use custom responses"), $x - 10, $y)
GUICtrlSetTip($chkUseResponses, GetTranslated(106, 19, "Use the keywords and responses defined below"))
GUICtrlSetState($chkUseResponses, $ChatbotClanUseResponses)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkUseGeneric = GUICtrlCreateCheckbox(GetTranslated(106, 20, "Use generic chats"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkUseGeneric, GetTranslated(106, 25, "Use generic chats if reading the latest chat failed or there are no new chats"))
GUICtrlSetState($chkUseGeneric, $ChatbotClanAlwaysMsg)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkChatPushbullet = GUICtrlCreateCheckbox(GetTranslated(106, 26, "Use remote for chatting"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkChatPushbullet, GetTranslated(106, 27, "Send and recieve chats via pushbullet or telegram. Use BOT <myvillage> GETCHATS <interval|NOW|STOP> to get the latest clan chat as an image, and BOT <myvillage> SENDCHAT <chat message> to send a chat to your clan"))
GUICtrlSetState($chkChatPushbullet, $ChatbotUsePushbullet)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkPbSendNewChats = GUICtrlCreateCheckbox(GetTranslated(106, 28, "Notify me new clan chat"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkPbSendNewChats, GetTranslated(106, 29, "Will send an image of your clan chat via pushbullet & telegram when a new chat is detected. Not guaranteed to be 100% accurate."))
GUICtrlSetState($chkPbSendNewChats, $ChatbotPbSendNew)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 25

$editResponses = GUICtrlCreateEdit(_ArrayToString($ClanResponses, ":", -1, -1, @CRLF), $x - 15, $y, 206, 80)
GUICtrlSetTip($editResponses, GetTranslated(106, 30, "Look for the specified keywords in clan messages and respond with the responses. One item per line, in the format keyword:response"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 92
$editGeneric = GUICtrlCreateEdit(_ArrayToString($ClanMessages, @CRLF), $x - 15, $y, 206, 80)
GUICtrlSetTip($editGeneric, GetTranslated(106, 31, "Generic messages to send, one per line"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")

ChatGuicheckboxUpdateAT()
GUICtrlCreateTabItem("")

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------

$hGUI_MOD_TAB_ITEM5 = GUICtrlCreateTabItem(GetTranslated(107, 1, "Forecast"))

Global $grpForecast
Global $ieForecast

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 25
$ieForecast = GUICtrlCreateObj($oIE, $x, $y, 430, 310)
$y += +318
$chkForecastBoost = GUICtrlCreateCheckbox(GetTranslated(107, 2, "Boost When >"), $x, $y, -1, -1)
$txtTip = GetTranslated(107, 3, "Boost Barracks,Heroes, when the loot index.")
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastBoost")
$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 90, $y + 2, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = GetTranslated(107, 4, "Minimum loot index for boosting.")
GUICtrlSetLimit(-1, 3)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlSetState(-1, $GUI_DISABLE)

$y += -27
$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x + 158, $y + 27, -1, -1)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 225, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMax = GUICtrlCreateLabel(GetTranslated(107, 17, "When Index <"), $x + 325, $y + 28, -1, -1)
$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 400, $y + 26, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox(GetTranslated(19, 8, "Switch To"), $x + 158, $y + 55, -1, -1)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 225, $y + 53, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMin = GUICtrlCreateLabel(GetTranslated(107, 19, "When Index >"), $x + 325, $y + 58, -1, -1)
$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 400, $y + 54, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
setupProfileComboBox()
$cmbSwLang = GUICtrlCreateCombo("", $x, $y + 50, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "EN|RU|FR|DE|ES|IT|PT|IN", "EN")
GUICtrlSetOnEvent(-1, "cmbSwLang")
GUICtrlCreateTabItem("")
