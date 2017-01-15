; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
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

$ichkCoCStats = IniRead($config, "Stats", "chkCoCStats", "0")
$MyApiKey = IniRead($config, "Stats", "txtAPIKey", "")

$icmbCSVSpeed[$LB] = IniRead($config, "DeploymentSpeed", "LB", "2")
$icmbCSVSpeed[$DB] = IniRead($config, "DeploymentSpeed", "DB", "2")

IniReadS($ichkAutoHide, $config, "general", "AutoHide", "0")
IniReadS($ichkAutoHideDelay, $config, "general", "AutoHideDelay", "10")

; Profile Switch
$ichkGoldSwitchMax = IniRead($config, "profiles", "chkGoldSwitchMax", "0")
$icmbGoldMaxProfile = IniRead($config, "profiles", "cmbGoldMaxProfile", "0")
$itxtMaxGoldAmount = IniRead($config, "profiles", "txtMaxGoldAmount", "6000000")
$ichkGoldSwitchMin = IniRead($config, "profiles", "chkGoldSwitchMin", "0")
$icmbGoldMinProfile = IniRead($config, "profiles", "cmbGoldMinProfile", "0")
$itxtMinGoldAmount = IniRead($config, "profiles", "txtMinGoldAmount", "500000")

$ichkElixirSwitchMax = IniRead($config, "profiles", "chkElixirSwitchMax", "0")
$icmbElixirMaxProfile = IniRead($config, "profiles", "cmbElixirMaxProfile", "0")
$itxtMaxElixirAmount = IniRead($config, "profiles", "txtMaxElixirAmount", "6000000")
$ichkElixirSwitchMin = IniRead($config, "profiles", "chkElixirSwitchMin", "0")
$icmbElixirMinProfile = IniRead($config, "profiles", "cmbElixirMinProfile", "0")
$itxtMinElixirAmount = IniRead($config, "profiles", "txtMinElixirAmount", "500000")

$ichkDESwitchMax = IniRead($config, "profiles", "chkDESwitchMax", "0")
$icmbDEMaxProfile = IniRead($config, "profiles", "cmbDEMaxProfile", "0")
$itxtMaxDEAmount = IniRead($config, "profiles", "txtMaxDEAmount", "200000")
$ichkDESwitchMin = IniRead($config, "profiles", "chkDESwitchMin", "0")
$icmbDEMinProfile = IniRead($config, "profiles", "cmbDEMinProfile", "0")
$itxtMinDEAmount = IniRead($config, "profiles", "txtMinDEAmount", "10000")

$ichkTrophySwitchMax = IniRead($config, "profiles", "chkTrophySwitchMax", "0")
$icmbTrophyMaxProfile = IniRead($config, "profiles", "cmbTrophyMaxProfile", "0")
$itxtMaxTrophyAmount = IniRead($config, "profiles", "txtMaxTrophyAmount", "3000")
$ichkTrophySwitchMin = IniRead($config, "profiles", "chkTrophySwitchMin", "0")
$icmbTrophyMinProfile = IniRead($config, "profiles", "cmbTrophyMinProfile", "0")
$itxtMinTrophyAmount = IniRead($config, "profiles", "txtMinTrophyAmount", "1000")

; SSA

IniReadS($ichkSwitchAccount, $SSAConfig, "SwitchAccount", "chkEnableSwitchAccount", "0")
IniReadS($icmbAccountsQuantity, $SSAConfig, "SwitchAccount", "cmbAccountsQuantity", "0")
For $i = 1 To 5
	IniReadS($ichkCanUse[$i], $SSAConfig, "SwitchAccount", "chkCanUse[" & $i & "]", "0")
	IniReadS($ichkDonateAccount[$i], $SSAConfig, "SwitchAccount", "chkDonateAccount[" & $i & "]", "0")
	IniReadS($icmbAccount[$i], $SSAConfig, "SwitchAccount", "cmbAccount[" & $i & "]", "0")
Next
