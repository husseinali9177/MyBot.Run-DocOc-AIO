; #FUNCTION# ====================================================================================================================
; Name ..........: SmartSwitchAccount (v2)
; Description ...: This file contains all functions of SmartSwitchAccount feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti & Ezeck0001
; Modified ......: 28/01/2017
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func SwitchAccount($Init = False)

	If $ichkSwitchAccount = 1 And $g_bSwitchAcctPrereq Then

		If $Init Then $FirstInit = False

		If $CurrentAccount >= 1 Or $CurrentAccount <= 8 Then
			If LabStatus() Then
				GUICtrlSetBkColor($g_lblLabStatus[$CurrentAccount], $COLOR_GREEN)
			Else
				GUICtrlSetBkColor($g_lblLabStatus[$CurrentAccount], $COLOR_RED)
			EndIf
		EndIf

		Setlog("Starting SmartSwitchAccount...", $COLOR_SUCCESS)

		MakeSummaryLog()
		If Not $Init And $ichkDonateAccount[$CurrentAccount] = 0 Then GetWaitTime()

		If Not $Init And $CurrentAccountWaitTime = 0 And $ichkDonateAccount[$CurrentAccount] = 0 Then

			SetLog("Your Army is ready so I stay here, I'm a thug !!! ;P", $COLOR_SUCCESS)

		Else

			If $Init Then
				SetLog("Initialization of SmartSwitchAccount...", $COLOR_INFO)
				$CurrentAccount = 1
				$FirstLoop = 2 ; Don't Ask.. It Just Works...
				FindFirstAccount()
				$NextAccount = $CurrentAccount
				GetYCoordinates($NextAccount)
				$FirstRun = 1

			ElseIf $FirstLoop <= $TotalAccountsInUse And Not $Init Then
				SetLog("Continue initialization of SmartSwitchAccount...", $COLOR_INFO)
				$NextAccount = $CurrentAccount
				Do
					$NextAccount += 1
					If $NextAccount > $TotalAccountsOnEmu Then $NextAccount = 1
				Until $ichkCanUse[$NextAccount] = 1
				$FirstLoop += 1
				SetLog("Next Account will be : " & $NextAccount, $COLOR_INFO)
				GetYCoordinates($NextAccount)
				$FirstRun = 1 ; To Update Stats as First Run for each Account

			ElseIf $FirstLoop > $TotalAccountsInUse And Not $Init Then
				SetLog("Switching to next Account...", $COLOR_INFO)
				GetNextAccount()
				GetYCoordinates($NextAccount)
			EndIf

			If $ichkDonateAccount[$CurrentAccount] = 1 Then ; Set Gui Label for Donate or Looting CurrentAccount BackGround Color Green
				GUICtrlSetData($g_lblTimeNowSW[$CurrentAccount], "Donating")
;				GUICtrlSetFont($g_lblTimeNowSW[$CurrentAccount], 8, 800, 0, "MS Sans Serif")
				GUICtrlSetBkColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_GREEN)
				GUICtrlSetColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_BLACK)
			Else
				GUICtrlSetData($g_lblTimeNowSW[$CurrentAccount], "Looting")
;				GUICtrlSetFont($g_lblTimeNowSW[$CurrentAccount], 8, 800, 0, "MS Sans Serif")
				GUICtrlSetBkColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_GREEN)
				GUICtrlSetColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_BLACK)
			EndIf

			If _Sleep($iDelayRespond) Then Return

			If $NextAccount = $CurrentAccount And Not $Init And $FirstLoop >= $TotalAccountsInUse Then

				SetLog("Next Account is already the account we are on, no need to change...", $COLOR_SUCCESS)

			Else
				If Not $Init And $ichkDonateAccount[$CurrentAccount] = 0 Then
					SetLog("Trying to Request Troops before switching...", $COLOR_INFO)
					RequestCC()
					If _Sleep(500) Then Return
				EndIf

				Click(820, 590, 1, 0, "Click Setting") ;Click setting

				If _Sleep(1500) Then Return

				If _ColorCheck(_GetPixelColor(408, 408, True), "D0E878", 20) Then ; if green button, click to disconnect
					Click(440, 420)
					If _Sleep(500) Then Return
				EndIf
				Click(440, 420) ; click connect

				$iCount = 0 ; Sleep(5000) if needed. Wait for Google Play animation
				While (Not _ColorCheck(_GetPixelColor(300, 440, True), "0B8043", 20)) And $iCount <= 100 ; Green
					If _Sleep(50) Then Return
					$iCount += 1
				WEnd

				$iCount = 0 ; sleep(10000) or until account list appears
				While (Not _ColorCheck(_GetPixelColor(170, 410, True), "FFFFFF", 20)) And $iCount <= 50
					If _Sleep(100) Then Return
					$iCount += 1
				WEnd
				If _Sleep(500) Then Return
				Click(430, $yCoord) ; Click Account

				WaitForNextStep()

				If _Sleep($iDelayRespond) Then Return

				If $NextStep = 1 Then
					Setlog("Load button appeared", $COLOR_SUCCESS)
					If _Sleep($iDelayRespond) Then Return
					Click(520, 430)

					$iCount = 0 ; Fancy delay to wait for Enter Confirm text box
					While (Not _ColorCheck(_GetPixelColor(587, 16, True), "F88088", 20)) And $iCount <= 50
						If _Sleep(100) Then Return
						$iCount += 1
					WEnd
					Click(360, 195)
					If _Sleep(250) Then Return
					AndroidSendText("CONFIRM")

					$iCount = 0 ; Another Fancy Sleep wait for Click Confirm Button
					While (Not _ColorCheck(_GetPixelColor(480, 200, True), "71BB1E", 20)) And $iCount <= 100
						If _Sleep(100) Then Return
						$iCount += 1
					WEnd
					Click(530, 195)

				ElseIf $NextStep = 2 Then
					Setlog("Already on the right account...", $COLOR_SUCCESS)
					If _Sleep($iDelayRespond) Then Return
					ClickP($aAway, 1, 0, "#0167") ;Click Away
				ElseIf $NextStep = 0 Then
					SetLog("Error when trying to go to the next step... skipping...", $COLOR_ERROR)
					If _Sleep($iDelayRespond) Then Return
					Return
				EndIf

				; Update Stats Gui Lables.
				If Not $Init Then
					If $ichkDonateAccount[$CurrentAccount] = 1 Then ; Set Gui Label for Donate or Looting CurrentAccount BackGround Color Green
						GUICtrlSetData($g_lblTimeNowSW[$CurrentAccount], "Donate")
						GUICtrlSetBkColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_YELLOW)
						GUICtrlSetColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_BLACK)
					Else
						GUICtrlSetData($g_lblTimeNowSW[$CurrentAccount], Round($CurrentAccountWaitTime, 2))
						GUICtrlSetBkColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_YELLOW)
						GUICtrlSetColor($g_lblTimeNowSW[$CurrentAccount], $COLOR_BLACK)
					EndIf

					If $ichkDonateAccount[$NextAccount] = 1 Then ; Set Gui Label for Donate or Looting CurrentAccount BackGround Color Green
						GUICtrlSetData($g_lblTimeNowSW[$NextAccount], "Donating")
						GUICtrlSetBkColor($g_lblTimeNowSW[$NextAccount], $COLOR_GREEN)
						GUICtrlSetColor($g_lblTimeNowSW[$NextAccount], $COLOR_BLACK)
					Else
						GUICtrlSetData($g_lblTimeNowSW[$NextAccount], "Looting")
						GUICtrlSetBkColor($g_lblTimeNowSW[$NextAccount], $COLOR_GREEN)
						GUICtrlSetColor($g_lblTimeNowSW[$NextAccount], $COLOR_BLACK)
					EndIf
				EndIf

				$CurrentAccount = $NextAccount
				If _Sleep($iDelayRespond) Then Return
				If $Init Then
					$NextProfile = _GUICtrlComboBox_GetCurSel($cmbAccount[$CurrentAccount])
					_GUICtrlComboBox_SetCurSel($cmbProfile, $NextProfile)
					cmbProfile()
				Else
					$NextProfile = _GUICtrlComboBox_GetCurSel($cmbAccount[$NextAccount])
					_GUICtrlComboBox_SetCurSel($cmbProfile, $NextProfile)
					cmbProfile()
				EndIf
				If _Sleep($iDelayRespond) Then Return
				IdentifyDonateOnly()
				waitMainScreen()
				VillageReport()
				UpdateStats()

				CheckArmyCamp(True, True) ; Update troops first after switch

				If _Sleep(500) Then Return

				If $ichkDonateAccount[$CurrentAccount] = 1 Then
					TrainDonateOnlyLoop()
				Else
					runBot()
				EndIf
			EndIf
		EndIf
	Else
		$FirstInit = False
	EndIf

EndFunc   ;==>SwitchAccount

Func GetYCoordinates($AccountNumber)

	$res = DllCall($LibDir & "\SmartSwitchAcc_Formulas.dll", "int", "SwitchAccY", "int", $TotalAccountsOnEmu, "int", $AccountNumber)
	$yCoord = $res[0]

EndFunc   ;==>GetYCoordinates

Func GetWaitTime()

	$aTimeTrain[0] = 0
	$aTimeTrain[1] = 0
	Local $HeroesRemainingWait[3] = [0, 0, 0]

	openArmyOverview()
	Sleep(1500)
	getArmyTroopTime()
	If IsWaitforSpellsActive() Then getArmySpellTime()
	If IsWaitforHeroesActive() Then
		If _Sleep($iDelayRespond) Then Return

		If GUICtrlRead($chkABActivateSearches) = $GUI_CHECKED Then
			If GUICtrlRead($chkABKingWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[0] = getArmyHeroTime($eKing)
			EndIf
			If GUICtrlRead($chkABQueenWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[1] = getArmyHeroTime($eQueen)
			EndIf
			If GUICtrlRead($chkABWardenWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[2] = getArmyHeroTime($eWarden)
			EndIf
		EndIf
		If GUICtrlRead($chkDBActivateSearches) = $GUI_CHECKED Then
			If GUICtrlRead($chkDBKingWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[0] = getArmyHeroTime($eKing)
			EndIf
			If GUICtrlRead($chkDBQueenWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[1] = getArmyHeroTime($eQueen)
			EndIf
			If GUICtrlRead($chkDBWardenWait) = $GUI_CHECKED Then
				$HeroesRemainingWait[2] = getArmyHeroTime($eWarden)
			EndIf
		EndIf
		If GUICtrlRead($chkTSActivateSearches) = $GUI_CHECKED Then
			If GUICtrlRead($chkTSKingAttack) = $GUI_CHECKED Then
				$HeroesRemainingWait[0] = getArmyHeroTime($eKing)
			EndIf
			If GUICtrlRead($chkTSQueenAttack) = $GUI_CHECKED Then
				$HeroesRemainingWait[1] = getArmyHeroTime($eQueen)
			EndIf
			If GUICtrlRead($chkTSWardenAttack) = $GUI_CHECKED Then
				$HeroesRemainingWait[2] = getArmyHeroTime($eWarden)
			EndIf
		EndIf

		If $HeroesRemainingWait[0] > 0 Then SetLog("King time: " & $HeroesRemainingWait[0] & ".00 min", $COLOR_INFO)
		If $HeroesRemainingWait[1] > 0 Then SetLog("Queen time: " & $HeroesRemainingWait[0] & ".00 min", $COLOR_INFO)
		If $HeroesRemainingWait[2] > 0 Then SetLog("Warden time: " & $HeroesRemainingWait[0] & ".00 min", $COLOR_INFO)

		If _Sleep($iDelayRespond) Then Return

	EndIf

	ClickP($aAway, 1, 0, "#0167") ;Click Away

	Local $MaxTime[3] = [$aTimeTrain[0], $aTimeTrain[1], _ArrayMax($HeroesRemainingWait)]
	$CurrentAccountWaitTime = _ArrayMax($MaxTime)
	$AllAccountsWaitTime[$CurrentAccount] = $CurrentAccountWaitTime
	$TimerDiffStart[$CurrentAccount] = TimerInit()
	If $CurrentAccountWaitTime = 0 Then
		SetLog("Wait time for current Account : training finished, Chief ;P !", $COLOR_SUCCESS)
	Else
		SetLog("Wait time for current Account : " & Round($CurrentAccountWaitTime, 2) & " minutes", $COLOR_SUCCESS)
	EndIf
	If _Sleep($iDelayRespond) Then Return

EndFunc   ;==>GetWaitTime


Func FindFirstAccount()

	For $x = 1 To 8
		$NextAccount = $x
		If $ichkCanUse[$x] = 1 Then ExitLoop
	Next
	$CurrentAccount = $NextAccount
	$NextProfile = _GUICtrlComboBox_GetCurSel($cmbAccount[$NextAccount])
	_GUICtrlComboBox_SetCurSel($cmbProfile, $NextProfile)
	cmbProfile()

EndFunc   ;==>FindFirstAccount

Func GetNextAccount()

	If $MustGoToDonateAccount = 1 And $TotalDAccountsInUse <> 0 Then

		SetLog("Time to go to Donate Account...", $COLOR_SUCCESS)

		$NextDAccount = $CurrentDAccount
		Do
			$NextDAccount += 1
			If $NextDAccount > $TotalAccountsOnEmu Then $NextDAccount = 1
		Until $ichkCanUse[$NextDAccount] = 1 And $ichkDonateAccount[$NextDAccount] = 1

		If _Sleep($iDelayRespond) Then Return

		SetLog("So, next Account will be : " & $NextDAccount, $COLOR_SUCCESS)

		If _Sleep($iDelayRespond) Then Return

		$CurrentDAccount = $NextDAccount
		$NextAccount = $NextDAccount
		$MustGoToDonateAccount = 0

	Else

		For $x = 1 To 8
			If $ichkCanUse[$x] = 1 And $ichkDonateAccount[$x] = 0 Then
				$TimerDiffEnd[$x] = TimerDiff($TimerDiffStart[$x])
				$AllAccountsWaitTimeDiff[$x] = Round($AllAccountsWaitTime[$x] * 60 * 1000 - $TimerDiffEnd[$x])
				If Round($AllAccountsWaitTimeDiff[$x] / 60 / 1000, 2) < 0 Then
					$FinishedSince = StringReplace(Round($AllAccountsWaitTimeDiff[$x] / 60 / 1000, 2), "-", "")
					SetLog("Account " & $x & " wait time left : training finished since " & $FinishedSince & " minutes", $COLOR_SUCCESS)
				Else
					SetLog("Account " & $x & " wait time left : " & Round($AllAccountsWaitTimeDiff[$x] / 60 / 1000, 2) & " minutes", $COLOR_SUCCESS)
				EndIf
			EndIf
		Next

		If _Sleep($iDelayRespond) Then Return

		$NextAccount = _ArrayMinIndex($AllAccountsWaitTimeDiff, 1, 1, 5)
		SetLog("So, next Account will be : " & $NextAccount, $COLOR_SUCCESS)

		If _Sleep($iDelayRespond) Then Return

		$MustGoToDonateAccount = 1

	EndIf

EndFunc   ;==>GetNextAccount

Func MakeSummaryLog()

	cmbAccountsQuantity()
	CheckAccountsInUse()
	CheckDAccountsInUse()

	SetLog("SmartSwitchAccount Summary : " & $TotalAccountsOnEmu & " Accounts - " & $TotalAccountsInUse & " in use - " & $TotalDAccountsInUse & " Donate Accounts", $COLOR_ORANGE)

EndFunc   ;==>MakeSummaryLog

Func TrainDonateOnlyLoop() ; not used func

	If $ichkDonateAccount[$CurrentAccount] = 1 Then

		$CommandStop = 3 ; Set the commandStops
		VillageReport()
		Collect()
		randomSleep(2000)
		DonateCC()
		randomSleep(2000)

		DonateCC()
		randomSleep(2000)

		CheckArmyCamp(True, True)
		If _Sleep($iDelayIdle1) Then Return
		If ($fullArmy = False Or $bFullArmySpells = False) And $bTrainEnabled = True Then
			SetLog("Army Camp and Barracks are not full, Training Continues...", $COLOR_ACTION)
			$CommandStop = 0
			TrainRevamp()
			randomSleep(10000)
		EndIf

		DonateCC()
		randomSleep(2000)

		DonateCC()
		randomSleep(2000)

		CheckArmyCamp(True, True) ; Only Train if Camps not Full
		If _Sleep($iDelayIdle1) Then Return
		If ($fullArmy = False Or $bFullArmySpells = False) And $bTrainEnabled = True Then
			SetLog("Army Camp and Barracks are not full, Training Continues...", $COLOR_ACTION)
			$CommandStop = 0
			TrainRevamp()
			randomSleep(2000)
		EndIf

		SwitchAccount()

	EndIf

EndFunc   ;==>TrainDonateOnlyLoop

Func CheckAccountsInUse()

	$TotalAccountsInUse = 8
	For $x = 1 To 8
		If $ichkCanUse[$x] = 0 Then
			$AllAccountsWaitTimeDiff[$x] = 999999999999
			$TotalAccountsInUse -= 1
		EndIf
	Next

EndFunc   ;==>CheckAccountsInUse

Func CheckDAccountsInUse()

	$TotalDAccountsInUse = 0
	For $x = 1 To 8
		If $ichkDonateAccount[$x] = 1 Then
			$AllAccountsWaitTimeDiff[$x] = 999999999999
			$TotalDAccountsInUse += 1
		EndIf
	Next

EndFunc   ;==>CheckDAccountsInUse

Func cmbAccountsQuantity()

	$TotalAccountsOnEmu = _GUICtrlComboBox_GetCurSel($cmbAccountsQuantity) + 2

	For $i = $chkCanUse[1] To $chkDonateAccount[8]
		GUICtrlSetState($i, $GUI_SHOW)
	Next

	If $TotalAccountsOnEmu >= 1 And $TotalAccountsOnEmu < 8 Then
		For $i = $chkCanUse[$TotalAccountsOnEmu + 1] To $chkDonateAccount[8]
			GUICtrlSetState($i, $GUI_HIDE)
			GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
	EndIf

	chkAccountsProperties()

EndFunc   ;==>cmbAccountsQuantity

Func chkSwitchAccount()

	If GUICtrlRead($chkEnableSwitchAccount) = $GUI_CHECKED Then
		For $i = $lblNB To $chkDonateAccount[8]
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		cmbAccountsQuantity()
		;chkAccountsProperties()
		$ichkSwitchAccount = 1
	Else
		For $i = $lblNB To $chkDonateAccount[8]
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		$ichkSwitchAccount = 0
	EndIf

EndFunc   ;==>chkSwitchAccount

Func chkAccountsProperties()

	For $h = 1 To 8

		If GUICtrlRead($chkCanUse[$h]) = $GUI_CHECKED Then

			For $i = $cmbAccount[$h] To $chkDonateAccount[$h]
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
			$ichkCanUse[$h] = 1
			GUICtrlSetState($g_icnGoldSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_icnElixirSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_icnDarkSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_icnGemSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_icnBuliderSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_icnHourGlassSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_lblLabStatus[$h], $GUI_SHOW)
			GUICtrlSetState($g_lblUnitMeasureSW1[$h], $GUI_SHOW)
			GUICtrlSetState($g_lblUnitMeasureSW2[$h], $GUI_SHOW)
			GUICtrlSetState($g_lblUnitMeasureSW3[$h], $GUI_SHOW)
			GUICtrlSetState($g_lblTimeNowSW[$h], $GUI_SHOW)
			GUICtrlSetState($g_grpVillageSW[$h], $GUI_SHOW)
		Else

			For $i = $cmbAccount[$h] To $chkDonateAccount[$h]
				GUICtrlSetState($i, $GUI_DISABLE)
				GUICtrlSetState($i, $GUI_UNCHECKED)
			Next
			$ichkCanUse[$h] = 0
			GUICtrlSetState($g_icnGoldSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_icnElixirSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_icnDarkSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_icnGemSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_icnBuliderSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_icnHourGlassSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_lblLabStatus[$h], $GUI_HIDE)
			GUICtrlSetState($g_lblUnitMeasureSW1[$h], $GUI_HIDE)
			GUICtrlSetState($g_lblUnitMeasureSW2[$h], $GUI_HIDE)
			GUICtrlSetState($g_lblUnitMeasureSW3[$h], $GUI_HIDE)
			GUICtrlSetState($g_lblTimeNowSW[$h], $GUI_HIDE)
			GUICtrlSetState($g_grpVillageSW[$h], $GUI_HIDE)

		EndIf

		If GUICtrlRead($chkDonateAccount[$h]) = $GUI_CHECKED Then

			$ichkDonateAccount[$h] = 1
		Else
			$ichkDonateAccount[$h] = 0
		EndIf

	Next

EndFunc   ;==>chkAccountsProperties

Func IdentifyDonateOnly()

	If $ichkDonateAccount[$CurrentAccount] = 1 Then
		SetLog("Current Account is a Train/Donate Only Account...", $COLOR_DEBUG1)
	Else
		SetLog("Current Account is not a Train/Donate Only Account...", $COLOR_DEBUG1)
	EndIf

EndFunc   ;==>IdentifyDonateOnly

Func WaitForNextStep()

	SetLog("Waiting for Load button or Already Connected...", $COLOR_INFO)

	$CheckStep = 0
	While (Not (IsLoadButton() Or AlreadyConnected())) And $CheckStep < 150
		If _Sleep(200) Then Return
		$CheckStep += 1
	WEnd

	If $IsLoadButton Then
		$NextStep = 1
	ElseIf $AlreadyConnected Then
		$NextStep = 2
	Else
		$NextStep = 0
	EndIf

EndFunc   ;==>WaitForNextStep

Func IsLoadButton()

	$IsLoadButton = _ColorCheck(_GetPixelColor(480, 441, True), "60B010", 20)
	Return $IsLoadButton

EndFunc   ;==>IsLoadButton

Func AlreadyConnected()

	$AlreadyConnected = _ColorCheck(_GetPixelColor(408, 408, True), "D0E878", 20)
	Return $AlreadyConnected

EndFunc   ;==>AlreadyConnected

Func AppendLineToSSALog($AtkReportLine)

	If $ichkSwitchAccount = 1 Then
		If $LastDate <> _NowDate() Then
			$LastDate = _NowDate()
			FileWriteLine($SSAAtkLog, @CRLF)
			FileWriteLine($SSAAtkLog, _NowDate())
			FileWriteLine($SSAAtkLog, @CRLF)
			FileWriteLine($SSAAtkLog, "                    --------  LOOT --------       ----- BONUS ------")
			FileWriteLine($SSAAtkLog, @CRLF)
			FileWriteLine($SSAAtkLog, "Ac| TIME|TROP.| SRC|   GOLD| ELIXIR|DARK EL|TR.|S|  GOLD|ELIXIR|  DE|L.")
		EndIf
		If FileWriteLine($SSAAtkLog, $AtkReportLine) = 0 Then Setlog("Error when trying to add Attack Report line to multi account log...", $COLOR_ERROR)
	EndIf

EndFunc   ;==>AppendLineToSSALog

Func LabStatus()
	Local Static $sLabUpgradeTimeStatic[9]
	Local $TimeDiff, $aArray, $Result

	If $aLabPos[0] <= 0 Or $aLabPos[1] <= 0 Then
		SetLog("Laboratory Location not found!", $COLOR_ERROR)
		LocateLab() ; Lab location unknown, so find it.
		If $aLabPos[0] = 0 Or $aLabPos[1] = 0 Then
			SetLog("Problem locating Laboratory, train laboratory position before proceeding", $COLOR_ERROR)
			Return False
		EndIf
	EndIf

	If $sLabUpgradeTimeStatic[$CurrentAccount] <> "" Then $TimeDiff = _DateDiff("n", _NowCalc(), $sLabUpgradeTimeStatic[$CurrentAccount]) ; what is difference between end time and now in minutes?
	If @error Then _logErrorDateDiff(@error)
	If $debugSetlog = 1 Then SetLog(" Lab end time: " & $sLabUpgradeTimeStatic[$CurrentAccount] & ", DIFF= " & $TimeDiff, $COLOR_DEBUG)
	If $RunState = False Then Return

	If $TimeDiff <= 0 Then
		SetLog("Checking Troop Upgrade in Laboratory ...", $COLOR_INFO)
	Else
		SetLog("Laboratory Upgrade in progress, waiting for completion", $COLOR_INFO)
		Return True
	EndIf

	BuildingClickP($aLabPos, "#0197") ;Click Laboratory
	If _Sleep($iDelayLaboratory1) Then Return ; Wait for window to open

	; Find Research Button
	Local $offColors[4][3] = [[0x708CB0, 37, 34], [0x603818, 50, 43], [0xD5FC58, 61, 8], [0x000000, 82, 0]] ; 2nd pixel Blue blade, 3rd pixel brown handle, 4th pixel Green cross, 5th black button edge
	Global $ButtonPixel = _MultiPixelSearch(433, 565 + $bottomOffsetY, 562, 619 + $bottomOffsetY, 1, 1, Hex(0x000000, 6), $offColors, 30) ; Black pixel of button edge
	If IsArray($ButtonPixel) Then
		If $debugSetlog = 1 Then
			Setlog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_DEBUG) ;Debug
			Setlog("#1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 37, $ButtonPixel[1] + 34, True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 50, $ButtonPixel[1] + 43, True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 61, $ButtonPixel[1] + 8, True), $COLOR_DEBUG)
		EndIf
		If $debugImageSave = 1 Then DebugImageSave("LabUpgrade_") ; Debug Only
		Click($ButtonPixel[0] + 40, $ButtonPixel[1] + 25, 1, 0, "#0198") ; Click Research Button
		If _Sleep($iDelayLaboratory1) Then Return ; Wait for window to open
	Else
		Setlog("Trouble finding research button, try again...", $COLOR_WARNING)
		ClickP($aAway, 2, $iDelayLaboratory4, "#0199")
		Return False
	EndIf

	; check for upgrade in process - look for green in finish upgrade with gems button
	If _ColorCheck(_GetPixelColor(625, 250 + $midOffsetY, True), Hex(0x60AC10, 6), 20) Or _ColorCheck(_GetPixelColor(660, 250 + $midOffsetY, True), Hex(0x60AC10, 6), 20) Then
		SetLog("Upgrade in progress, waiting for completion of other troops", $COLOR_INFO)
		If _Sleep($iDelayLaboratory2) Then Return
		; upgrade in process and time not recorded?  Then update completion time!
		If $sLabUpgradeTimeStatic[$CurrentAccount] = "" Or $TimeDiff <= 0 Then
			$Result = getRemainTLaboratory(336, 260) ; Try to read white text showing actual time left for upgrade
			If $debugSetlog = 1 Then Setlog($aLabTroops[$icmbLaboratory][3] & " OCR Remaining Lab Time = " & $Result, $COLOR_DEBUG)
			$aArray = StringSplit($Result, ' ', BitOR($STR_CHRSPLIT, $STR_NOCOUNT)) ;separate days, hours, minutes, seconds
			If IsArray($aArray) Then
				$iRemainingTimeMin = 0
				For $i = 0 To UBound($aArray) - 1 ; step through array and compute minutes remaining
					$sTime = ""
					Select
						Case StringInStr($aArray[$i], "d", $STR_NOCASESENSEBASIC) > 0
							$sTime = StringTrimRight($aArray[$i], 1) ; removing the "d"
							$iRemainingTimeMin += (Int($sTime) * 24 * 60) ; change days to minutes and add
						Case StringInStr($aArray[$i], "h", $STR_NOCASESENSEBASIC) > 0
							$sTime = StringTrimRight($aArray[$i], 1) ; removing the "h"
							$iRemainingTimeMin += (Int($sTime) * 60) ; change hours to minutes and add
						Case StringInStr($aArray[$i], "m", $STR_NOCASESENSEBASIC) > 0
							$sTime = StringTrimRight($aArray[$i], 1) ; removing the "m"
							$iRemainingTimeMin += Int($sTime) ; add minutes
						Case StringInStr($aArray[$i], "s", $STR_NOCASESENSEBASIC) > 0
							$sTime = StringTrimRight($aArray[$i], 1) ; removing the "s"
							$iRemainingTimeMin += Int($sTime) / 60 ; Add seconds
						Case Else
							Setlog("Remaining lab time OCR invalid:" & $aArray[$i], $COLOR_WARNING)
							ClickP($aAway, 2, $iDelayLaboratory4, "#0328")
							Return False
					EndSelect

					If $debugSetlog = 1 Then Setlog("Remain Lab Time: " & $aArray[$i] & ", Minutes= " & $iRemainingTimeMin, $COLOR_DEBUG)
				Next

				$sLabUpgradeTimeStatic[$CurrentAccount] = _DateAdd('n', Ceiling($iRemainingTimeMin), _NowCalc()) ; add the time required to NOW to finish the upgrade
				If @error Then _logErrorDateAdd(@error)
				SetLog($aLabTroops[$icmbLaboratory][3] & "Updated Lab finishing time: " & $sLabUpgradeTimeStatic[$CurrentAccount], $COLOR_SUCCESS)
			Else
				If $debugSetlog = 1 Then Setlog("Invalid getRemainTLaboratory OCR", $COLOR_DEBUG)
			EndIf
		EndIf
		ClickP($aAway, 2, $iDelayLaboratory4, "#0359")
		Return True
	Else
		SetLog("Laboratory has Stopped", $COLOR_INFO)
		ClickP($aAway, 2, $iDelayLaboratory4, "#0359")
		Return False
	EndIf
	If _Sleep(1500) Then Return
EndFunc   ;==>LabStatus
