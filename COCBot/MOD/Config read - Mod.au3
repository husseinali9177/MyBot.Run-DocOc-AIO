; #FUNCTION# ====================================================================================================================
; Name ..........: Config read - Mod.au3
; Description ...: Extension of readConfig() for Mod
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

; Config Read for SwitchAcc Mode - DEMEN
$ichkSwitchAcc = IniRead($profile, "Switch Account", "Enable", "0")
$icmbTotalCoCAcc = IniRead($profile, "Switch Account", "Total Coc Account", "0") ; 0 = AutoDetect
$ichkSmartSwitch = IniRead($profile, "Switch Account", "Smart Switch", "1")
$ichkCloseTraining = Number(IniRead($profile, "Switch Account", "Sleep Combo", "0")) ; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep

$ProfileType = IniRead($config, "Switch Account", "Profile Type", "")
$MatchProfileAcc = IniRead($config, "Switch Account", "Match Profile Acc", "")

For $i = 1 To 6
	IniReadS($aAccPosY[$i - 1], $profile, "Acc Location", "yAccNo." & $i, "-1")
Next

; Config for Adding Quicktrain Combo - DEMEN
IniReadS($iRadio_Army12, $config, "troop", "QuickTrain12", "0")
IniReadS($iRadio_Army123, $config, "troop", "QuickTrain123", "0")
IniReadS($iRadio_ArmyRandom, $config, "troop", "QuickTrainRandom", "0")

; Multi Finger (LunaEclipse) added rulesss
$iMultiFingerStyle = IniRead($config, "MultiFinger", "Select", "2")

$ichkSmartUpgrade = IniRead($config, "upgrade", "chkSmartUpgrade", "0")
$ichkIgnoreTH = IniRead($config, "upgrade", "chkIgnoreTH", "0")
$ichkIgnoreKing = IniRead($config, "upgrade", "chkIgnoreKing", "0")
$ichkIgnoreQueen = IniRead($config, "upgrade", "chkIgnoreQueen", "0")
$ichkIgnoreWarden = IniRead($config, "upgrade", "chkIgnoreWarden", "0")
$ichkIgnoreCC = IniRead($config, "upgrade", "chkIgnoreCC", "0")
$ichkIgnoreLab = IniRead($config, "upgrade", "chkIgnoreLab", "0")
$ichkIgnoreBarrack = IniRead($config, "upgrade", "chkIgnoreBarrack", "0")
$ichkIgnoreDBarrack = IniRead($config, "upgrade", "chkIgnoreDBarrack", "0")
$ichkIgnoreFactory = IniRead($config, "upgrade", "chkIgnoreFactory", "0")
$ichkIgnoreDFactory = IniRead($config, "upgrade", "chkIgnoreDFactory", "0")
$ichkIgnoreGColl = IniRead($config, "upgrade", "chkIgnoreGColl", "0")
$ichkIgnoreEColl = IniRead($config, "upgrade", "chkIgnoreEColl", "0")
$ichkIgnoreDColl = IniRead($config, "upgrade", "chkIgnoreDColl", "0")
$iSmartMinGold = IniRead($config, "upgrade", "SmartMinGold", "0")
$iSmartMinElixir = IniRead($config, "upgrade", "SmartMinElixir", "0")
$iSmartMinDark = IniRead($config, "upgrade", "SmartMinDark", "0")

;Tresorerie
$ichkCollectTresory = IniRead($config, "other", "CollectTresory", "0")
$itxtTreasuryGold = IniRead($config, "other", "treasuryGold", "0")
$itxtTreasuryElixir = IniRead($config, "other", "treasuryElixir", "0")
$itxtTreasuryDark = IniRead($config, "other", "treasuryDark", "0")
$ichkCollectTresoryGold = IniRead($config, "other", "CollectTresoryGold", "0")
$ichkCollectTresoryElixir = IniRead($config, "other", "CollectTresoryElixir", "0")
$ichkCollectTresoryDark = IniRead($config, "other", "CollectTresoryDark", "0")
$ichkTRFull = IniRead($config, "other", "chkTRFull", "0")

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
