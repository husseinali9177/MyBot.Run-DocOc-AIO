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
Global $sBldgText, $sBldgLevel, $aString
Global $upgradeName[3] = ["", "", ""]
Global $UpgradeCost
Global $TypeFound = 0
Global $SmartMinGold, $SmartMinElixir, $SmartMinDark
Global $UpgradeDuration
Global $canContinueLoop = True

; Auto Hide
Global $ichkAutoHide ; AutoHide mode enabled disabled
Global $ichkAutoHideDelay

; Profile Switch
Global $profileString = ""
Global $ichkGoldSwitchMax, $itxtMaxGoldAmount, $icmbGoldMaxProfile, $ichkGoldSwitchMin, $itxtMinGoldAmount, $icmbGoldMinProfile
Global $ichkElixirSwitchMax, $itxtMaxElixirAmount, $icmbElixirMaxProfile, $ichkElixirSwitchMin, $itxtMinElixirAmount, $icmbElixirMinProfile
Global $ichkDESwitchMax, $itxtMaxDEAmount, $icmbDEMaxProfile, $ichkDESwitchMin, $itxtMinDEAmount, $icmbDEMinProfile
Global $ichkTrophySwitchMax, $itxtMaxTrophyAmount, $icmbTrophyMaxProfile, $ichkTrophySwitchMin, $itxtMinTrophyAmount, $icmbTrophyMinProfile

; SmartSwitchAccount
Global $chkCanUse[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $chkDonateAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $cmbAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $ichkCanUse[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $ichkDonateAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $icmbAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $icmbAccountsQuantity = 0

Global $AllAccountsWaitTimeDiff[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $AllAccountsWaitTime[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $CurrentAccountWaitTime = 0

Global $TimerDiffStart[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $TimerDiffEnd[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

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
Global $IsLoadButton = False, $AlreadyConnected = False, $NextStep = 0

Global $SSAConfig = $sProfilePath & "\Profile.ini"
Global $SSAAtkLog = $sProfilePath & "\SmartSwitchAccount_Attack_Report.txt"
Global $LastDate = ""

;Forecast Added by rulesss
Global Const $COLOR_DEEPPINK = 0xFF1493
Global Const $COLOR_DARKGREEN = 0x006400
Global $oIE = ObjCreate("Shell.Explorer.2")
Global $dtStamps[0]
Global $lootMinutes[0]
Global $timeOffset = 0
Global $TimerForecast = 0
Global $lootIndexScaleMarkers
Global $currentForecast
Global $chkForecastBoost, $txtForecastBoost
Global $iChkForecastBoost, $iTxtForecastBoost
Global $cmbForecastHopingSwitchMax, $cmbForecastHopingSwitchMin
Global $ichkForecastHopingSwitchMax, $icmbForecastHopingSwitchMax, $itxtForecastHopingSwitchMax, $ichkForecastHopingSwitchMin, $icmbForecastHopingSwitchMin, $itxtForecastHopingSwitchMin

;Added Multi Switch Language by rulesss and Kychera
Global $icmbSwLang
Global $cmbSwLang

; ChatBot - modification by rulesss
Global $FoundChatMessage = 0
Global $ChatbotStartTime

; ChatBot - modification by rulesss
Global $FoundChatMessage = 0
Global $ChatbotStartTime

; Modified kychera
Global $chkRusLang2
Global $ichkRusLang2 = 0
Global $chkRusLang
Global $ichkRusLang = 0
Global $cmbLang
Global $icmbLang

; QuickTrainCombo (Demen) - Added by NguyenAnhHD
Global $iRadio_Army12, $iRadio_Army123

; Simple QuickTrain (Demen) - Added by NguyenAnhHD
Global $ichkSimpleQuickTrain, $ichkFillArcher, $iFillArcher, $ichkFillEQ, $ichkTrainDonated

; Check Collector Outside - Added by NguyenAnhHD
#region Check Collectors Outside
; collectors outside filter
Global $ichkDBMeetCollOutside, $iDBMinCollOutsidePercent, $iCollOutsidePercent ; check later if $iCollOutsidePercent obsolete

; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335 ; check later if $THEllipseWidth, $THEllipseHeigth obsolete
Global $hBitmapFirst
#endregion

; Clan Hop Setting - Added by NguyenAnhHD
Global $ichkClanHop
