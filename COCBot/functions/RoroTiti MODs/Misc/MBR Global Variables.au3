; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Global Variables
; Description ...: This file Includes several files in the current script and all Declared variables, constant, or create an array.
; Syntax ........: #include , Global
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: Everyone all the time  :)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Multi Finger Attack Style Setting- added rulesss
Global Enum $directionLeft, $directionRight
Global Enum $sideBottomRight, $sideTopLeft, $sideBottomLeft, $sideTopRight
Global Enum $mfRandom, $mfFFStandard, $mfFFSpiralLeft, $mfFFSpiralRight, $mf8FBlossom, $mf8FImplosion, $mf8FPinWheelLeft, $mf8FPinWheelRight
Global $iMultiFingerStyle = 1
Global Enum $eCCSpell = $eHaSpell + 1

; CSV Speed
Global $cmbCSVSpeed[2] = [$LB, $DB]
Global $icmbCSVSpeed[2] = [$LB, $DB]
Global $Divider

; CoCStats
Global $ichkCoCStats = 0
Global $stxtAPIKey = ""
Global $MyApiKey = ""

; SmartUpgrade
Global $ichkSmartUpgrade
Global $ichkIgnoreTH, $ichkIgnoreKing, $ichkIgnoreQueen, $ichkIgnoreWarden, $ichkIgnoreCC, $ichkIgnoreLab
Global $ichkIgnoreBarrack, $ichkIgnoreDBarrack, $ichkIgnoreFactory, $ichkIgnoreDFactory, $ichkIgnoreGColl, $ichkIgnoreEColl, $ichkIgnoreDColl
Global $iSmartMinGold, $iSmartMinElixir, $iSmartMinDark
Global $upgradeAvailable = 0
Global $SufficentRessources = 0
Global $CanUpgrade = 0
Global $upgradeX = 0, $upgradeY = 0
Global $zerosX = 0, $zerosY = 0
Global $zerosHere = 0
Global $sBldgText, $sBldgLevel, $aString
Global $upgradeName[3] = ["", "", ""]
Global $UpgradeCost
Global $TypeFound = 0
Global $SmartMinGold, $SmartMinElixir, $SmartMinDark
Global $UpgradeDuration
Global $canContinueLoop = 1
Global $YtoDelete = 100

;Trsorerie
Global $ichkTrap, $iChkCollect, $ichkTombstones, $ichkCleanYard, $itxtTreasuryGold, $itxtTreasuryElixir, $itxtTreasuryDark, $ichkCollectTresory, $chkCollectTresory
Global $chkCollectTresoryGold, $ichkCollectTresoryGold, $chkCollectTresoryElixir, $ichkCollectTresoryElixir, $chkCollectTresoryDark, $ichkCollectTresoryDark, $ichkTRFull

Global $ichkAutoHide ; AutoHide mode enabled disabled
Global $ichkAutoHideDelay

; Profile Switch
Global $ichkGoldSwitchMax, $itxtMaxGoldAmount, $icmbGoldMaxProfile, $ichkGoldSwitchMin, $itxtMinGoldAmount, $icmbGoldMinProfile
Global $ichkElixirSwitchMax, $itxtMaxElixirAmount, $icmbElixirMaxProfile, $ichkElixirSwitchMin, $itxtMinElixirAmount, $icmbElixirMinProfile
Global $ichkDESwitchMax, $itxtMaxDEAmount, $icmbDEMaxProfile, $ichkDESwitchMin, $itxtMinDEAmount, $icmbDEMinProfile
Global $ichkTrophySwitchMax, $itxtMaxTrophyAmount, $icmbTrophyMaxProfile, $ichkTrophySwitchMin, $itxtMinTrophyAmount, $icmbTrophyMinProfile

; ================================================== SmartSwitchAccount PART ================================================== ;

Global $chkCanUse[6] = [0, 0, 0, 0, 0, 0]
Global $chkDonateAccount[6] = [0, 0, 0, 0, 0, 0]
Global $cmbAccount[6] = [0, 0, 0, 0, 0, 0]

Global $ichkCanUse[6] = [0, 0, 0, 0, 0, 0]
Global $ichkDonateAccount[6] = [0, 0, 0, 0, 0, 0]
Global $icmbAccount[6] = [0, 0, 0, 0, 0, 0]

Global $icmbAccountsQuantity = 0

Global $AllAccountsWaitTimeDiff[6] = [0, 0, 0, 0, 0, 0]
Global $AllAccountsWaitTime[6] = [0, 0, 0, 0, 0, 0]

Global $CurrentAccountWaitTime = 0

Global $TimerDiffStart[6] = [0, 0, 0, 0, 0, 0]
Global $TimerDiffEnd[6] = [0, 0, 0, 0, 0, 0]

Global $Init = False
Global $TotalAccountsOnEmu = 0
Global $CurrentAccount = 1
Global $CurrentDAccount = 1
Global $FirstLoop = 0
Global $FirstInit = True
Global $MustGoToDonateAccount = 0
Global $yCoord, $HeroesRemainingWait, $TotalAccountsInUse, $TotalDAccountsInUse, $ichkSwitchAccount, $NextAccount, $NextProfile
Global $cycleCount = 0
Global $IsDonateAccount = 0

Global $SSAConfig = $sProfilePath & "\Profile.ini"

; ================================================== SmartSwitchAccount END ================================================== ;
