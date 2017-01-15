; #FUNCTION# ====================================================================================================================
; Name ..........: saveConfig.au3
; Description ...: Saves all of the GUI values to the config.ini and building.ini files
; Syntax ........: saveConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

If GUICtrlRead($chkCoCStats) = $GUI_CHECKED Then
	IniWrite($config, "Stats", "chkCoCStats", "1")
Else
	IniWrite($config, "Stats", "chkCoCStats", "0")
EndIf
IniWrite($config, "Stats", "txtAPIKey", GUICtrlRead($txtAPIKey))

IniWrite($config, "DeploymentSpeed", "LB", _GUICtrlComboBox_GetCurSel($cmbCSVSpeed[$LB]))
IniWrite($config, "DeploymentSpeed", "DB", _GUICtrlComboBox_GetCurSel($cmbCSVSpeed[$DB]))

If GUICtrlRead($chkAutoHide) = $GUI_CHECKED Then
	$ichkAutoHide = 1
Else
	$ichkAutoHide = 0
EndIf
$ichkAutoHideDelay = GUICtrlRead($txtAutoHideDelay)

IniWriteS($config, "general", "AutoHide", $ichkAutoHide)
IniWriteS($config, "general", "AutoHideDelay", $ichkAutoHideDelay)

; Profile Switch Settings
If GUICtrlRead($chkGoldSwitchMax) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkGoldSwitchMax", 1)
Else
	IniWrite($config, "profiles", "chkGoldSwitchMax", 0)
EndIf
IniWrite($config, "profiles", "cmbGoldMaxProfile", _GUICtrlComboBox_GetCurSel($cmbGoldMaxProfile))
IniWrite($config, "profiles", "txtMaxGoldAmount", GUICtrlRead($txtMaxGoldAmount))

If GUICtrlRead($chkGoldSwitchMin) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkGoldSwitchMin", 1)
Else
	IniWrite($config, "profiles", "chkGoldSwitchMin", 0)
EndIf
IniWrite($config, "profiles", "cmbGoldMinProfile", _GUICtrlComboBox_GetCurSel($cmbGoldMinProfile))
IniWrite($config, "profiles", "txtMinGoldAmount", GUICtrlRead($txtMinGoldAmount))

If GUICtrlRead($chkElixirSwitchMax) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkElixirSwitchMax", 1)
Else
	IniWrite($config, "profiles", "chkElixirSwitchMax", 0)
EndIf
IniWrite($config, "profiles", "cmbElixirMaxProfile", _GUICtrlComboBox_GetCurSel($cmbElixirMaxProfile))
IniWrite($config, "profiles", "txtMaxElixirAmount", GUICtrlRead($txtMaxElixirAmount))

If GUICtrlRead($chkElixirSwitchMin) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkElixirSwitchMin", 1)
Else
	IniWrite($config, "profiles", "chkElixirSwitchMin", 0)
EndIf
IniWrite($config, "profiles", "cmbElixirMinProfile", _GUICtrlComboBox_GetCurSel($cmbElixirMinProfile))
IniWrite($config, "profiles", "txtMinElixirAmount", GUICtrlRead($txtMinElixirAmount))

If GUICtrlRead($chkDESwitchMax) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkDESwitchMax", 1)
Else
	IniWrite($config, "profiles", "chkDESwitchMax", 0)
EndIf
IniWrite($config, "profiles", "cmbDEMaxProfile", _GUICtrlComboBox_GetCurSel($cmbDEMaxProfile))
IniWrite($config, "profiles", "txtMaxDEAmount", GUICtrlRead($txtMaxDEAmount))

If GUICtrlRead($chkDESwitchMin) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkDESwitchMin", 1)
Else
	IniWrite($config, "profiles", "chkDESwitchMin", 0)
EndIf
IniWrite($config, "profiles", "cmbDEMinProfile", _GUICtrlComboBox_GetCurSel($cmbDEMinProfile))
IniWrite($config, "profiles", "txtMinDEAmount", GUICtrlRead($txtMinDEAmount))

If GUICtrlRead($chkTrophySwitchMax) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkTrophySwitchMax", 1)
Else
	IniWrite($config, "profiles", "chkTrophySwitchMax", 0)
EndIf
IniWrite($config, "profiles", "cmbTrophyMaxProfile", _GUICtrlComboBox_GetCurSel($cmbTrophyMaxProfile))
IniWrite($config, "profiles", "txtMaxTrophyAmount", GUICtrlRead($txtMaxTrophyAmount))

If GUICtrlRead($chkTrophySwitchMin) = $GUI_CHECKED Then
	IniWrite($config, "profiles", "chkTrophySwitchMin", 1)
Else
	IniWrite($config, "profiles", "chkTrophySwitchMin", 0)
EndIf
IniWrite($config, "profiles", "cmbTrophyMinProfile", _GUICtrlComboBox_GetCurSel($cmbTrophyMinProfile))
IniWrite($config, "profiles", "txtMinTrophyAmount", GUICtrlRead($txtMinTrophyAmount))

; SSA

IniWrite($SSAConfig, "SwitchAccount", "chkEnableSwitchAccount", $ichkSwitchAccount)
IniWrite($SSAConfig, "SwitchAccount", "cmbAccountsQuantity", _GUICtrlComboBox_GetCurSel($cmbAccountsQuantity))
For $i = 1 To 5
	IniWrite($SSAConfig, "SwitchAccount", "chkCanUse[" & $i & "]", $ichkCanUse[$i])
	IniWrite($SSAConfig, "SwitchAccount", "chkDonateAccount[" & $i & "]", $ichkDonateAccount[$i])
	IniWrite($SSAConfig, "SwitchAccount", "cmbAccount[" & $i & "]", _GUICtrlComboBox_GetCurSel($cmbAccount[$i]))
Next
