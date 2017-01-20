; #FUNCTION# ====================================================================================================================
; Name ..........: SmartSwitchAccount (v1)
; Description ...: This file contains all functions of SmartSwitchAccount feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 01/10/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func SwitchAccount($Init = False)

	If $ichkSwitchAccount = 1 And $g_bSwitchAcctPrereq Then
		If $Init Then $FirstInit = False

		Setlog("Starting SmartSwitchAccount...", $COLOR_SUCCESS)

		MakeSummaryLog()
		If Not $IsDonateAccount And Not $Init Then GetWaitTime()

		If $CurrentAccountWaitTime = 0 And Not $Init And Not $IsDonateAccount Then

			SetLog("Your Army is ready so I stay here, I'm a thug !!! ;P", $COLOR_SUCCESS)

		Else

			If $Init Then
				SetLog("Initialization of SmartSwitchAccount...", $COLOR_INFO)
				$FirstLoop = 1
				$NextAccount = 1
				GetYCoordinates($NextAccount)
			ElseIf $FirstLoop < $TotalAccountsInUse And Not $Init Then
				SetLog("Continue initialization of SmartSwitchAccount...", $COLOR_INFO)
				$NextAccount = $CurrentAccount
				Do
					$NextAccount += 1
					If $NextAccount > $TotalAccountsOnEmu Then $NextAccount = 1
				Until $ichkCanUse[$NextAccount] = 1
				$FirstLoop += 1
				SetLog("Next Account will be : " & $NextAccount, $COLOR_INFO)
				GetYCoordinates($NextAccount)
			ElseIf $FirstLoop >= $TotalAccountsInUse And Not $Init Then
				SetLog("Switching to next Account...", $COLOR_INFO)
				GetNextAccount()
				GetYCoordinates($NextAccount)
			EndIf

			If _Sleep($iDelayRespond) Then Return

			If $NextAccount = $CurrentAccount And Not $Init And $FirstLoop >= $TotalAccountsInUse Then

				SetLog("Next Account is already the account we are on, no need to change...", $COLOR_SUCCESS)

			Else

				SetLog("Trying to Request Troops before switching...", $COLOR_INFO)
				RequestCC()
				If _Sleep(500) Then Return

				Click(820, 590, 1, 0, "Click Setting")      ;Click setting

				$iCount = 0 ; Sleep(5000) if needed.
				While Not _ColorCheck(_GetPixelColor(766, 101, True), Hex(0xF88088, 6), 20)
					If _Sleep(100) Then Return
					$iCount += 1
					If $iCount = 50 Then ExitLoop
				WEnd
				;If _Sleep(1500) Then Return

				;The Double Click check for either green or red then click twice
				If _ColorCheck(_GetPixelColor(408, 408, True), "D0E878", 20) _
					Or _ColorCheck(_GetPixelColor(408, 408, True), "F07078", 20) Then
					Click(440, 420, 2, 750, "Click Connect Twice with long pause")

				EndIf


				$iCount = 0 ; Sleep(5000) if needed. Wait for Google Play animation
				While Not _ColorCheck(_GetPixelColor(550, 450, True), Hex(0x0B8043, 6), 20) ; Green
					If _Sleep(50) Then Return
					$iCount += 1
					If $iCount = 100 Then ExitLoop
				WEnd
				ClickP($aAway, 1, 0, "#0167") ;Click Away - disable Google Play animation
				If _Sleep(50) Then Return

				$iCount = 0 ; sleep(10000) or until account list appears
				While Not _ColorCheck(_GetPixelColor(159, 331, True), Hex(0xFFFFFF, 6), 20)
					If _Sleep(100) Then Return
					$iCount += 1
					If $iCount = 100 Then ExitLoop
				WEnd
				If _Sleep(50) Then Return
				Click(430, $yCoord) ; Click Account

				If _Sleep($iDelayRespond) Then Return


				WaitForNextStep()
				If $NextStep = 1 Then
					Setlog("Load button appeared", $COLOR_SUCCESS)
					Click(520, 430)

					;Fancy delay to wait for Enter Confirm text box
					$iCount
					While Not _ColorCheck(_GetPixelColor(587, 16, True), Hex(0xF88088, 6), 20)
						If _Sleep(100) Then Return
						$iCount += 1
						If $iCount = 50 Then ExitLoop
					WEnd
					;If _Sleep(1500) Then Return
					Click(360, 195)
					If _Sleep(250) Then Return
					AndroidSendText("CONFIRM")

					$iCount = 0 ; Another Fancy Sleep wait for Click Confirm Button
					While Not _ColorCheck(_GetPixelColor(480, 200, True), "71BB1E", 20)
						If _Sleep(100) Then Return
						$iCount += 1
						If $iCount = 100 Then ExitLoop
					WEnd
					;If _Sleep(1500) Then Return

					Click(530, 195)
				ElseIf $NextStep = 2 Then
					Setlog("Already on the right account...", $COLOR_SUCCESS)
					ClickP($aAway, 1, 0, "#0167") ;Click Away
				ElseIf $NextStep = 0 Then
					SetLog("Error when trying to go to the next step... skipping...", $COLOR_ERROR)
					;;;;;;;;;;; Add a Restart Bot func here....
					; something like
					;Switch account reset first start condition
					;$Init = False
					;$FirstInit = True
					;WaitnOpenCoC(5000,True)
					;runBot()
					Return
				EndIf

				$CurrentAccount = $NextAccount

				If $Init Then
					$NextProfile = _GUICtrlComboBox_GetCurSel($cmbAccount[1])
					_GUICtrlComboBox_SetCurSel($cmbProfile, $NextProfile)
					cmbProfile()
				Else
					$NextProfile = _GUICtrlComboBox_GetCurSel($cmbAccount[$NextAccount])
					_GUICtrlComboBox_SetCurSel($cmbProfile, $NextProfile)
					cmbProfile()
				EndIf

				If _Sleep($iDelayRespond) Then Return

				IdentifyDonateOnly()
				checkMainScreen()
				runBot()

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
		$CurrentAccount = $NextDAccount
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

Func TrainDonateOnlyLoop()

	If $IsDonateAccount Then

		DonateCC()
		randomSleep(1000)


		DonateCC()
		randomSleep(2000)

		TrainRevamp()
		randomSleep(10000)

		DonateCC()
		randomSleep(1000)


		DonateCC()
		randomSleep(2000)

		TrainRevamp()
		randomSleep(2000)

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
		Else
			For $i = $cmbAccount[$h] To $chkDonateAccount[$h]
				GUICtrlSetState($i, $GUI_DISABLE)
				GUICtrlSetState($i, $GUI_UNCHECKED)
			Next
			$ichkCanUse[$h] = 0
		EndIf

		If GUICtrlRead($chkDonateAccount[$h]) = $GUI_CHECKED Then
			$ichkDonateAccount[$h] = 1
		Else
			$ichkDonateAccount[$h] = 0
		EndIf

	Next

EndFunc   ;==>chkAccountsProperties

Func IdentifyDonateOnly()

	If $ichkSwitchAccount = 1 And $ichkDonateAccount[$CurrentAccount] = 1 And ($FirstLoop >= $TotalAccountsInUse) Then
		$IsDonateAccount = True
		SetLog("Current Account is a Train/Donate Only Account...", $COLOR_DEBUG1)
	Else
		$IsDonateAccount = False
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
			FileWriteLine($SSAAtkLog, "AC| TIME|TROP.|SEARCH|   GOLD| ELIXIR|DARK EL|TR.|S|  GOLD|ELIXIR|  DE|L.|")
		EndIf
		If FileWriteLine($SSAAtkLog, $AtkReportLine) = 0 Then Setlog("Error when trying to add Attack Report line to multi account log...", $COLOR_ERROR)
	EndIf

EndFunc   ;==>AppendLineToSSALog


