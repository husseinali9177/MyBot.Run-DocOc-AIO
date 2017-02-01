;MODded by DocOc++ Team AIO

; #FUNCTION# ====================================================================================================================
; Name ..........: AttackReport
; Description ...: This function will report the loot from the last Attack: gold, elixir, dark elixir and trophies.
;                  It will also update the statistics to the GUI (Last Attack).
; Syntax ........: AttackReport()
; Parameters ....: None
; Return values .: None
; Author ........: Hervidero (2015-feb-10), Sardo (may-2015), Hervidero (2015-12)
; Modified ......: Sardo (may-2015), Hervidero (may-2015), Knowjack (July 2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func AttackReport()

	Local $iCount

	$lootGold = "" ; reset previous loot won values
	$lootElixir = ""
	$lootDarkElixir = ""
	$lootTrophies = ""

	$iCount = 0 ; Reset loop counter
	While _CheckPixel($aEndFightSceneAvl, True) = False ; check for light gold pixle in the Gold ribbon in End of Attack Scene before reading values
		$iCount += 1
		If _Sleep($iDelayAttackReport1) Then Return
		If $debugSetlog = 1 Then Setlog("Waiting Attack Report Ready, " & ($iCount / 2) & " Seconds.", $COLOR_DEBUG)
		If $iCount > 30 Then ExitLoop ; wait 30*500ms = 15 seconds max for the window to render
	WEnd
	If $iCount > 30 Then Setlog("End of Attack scene slow to appear, attack values my not be correct", $COLOR_INFO)

	$iCount = 0 ; reset loop counter
	While getResourcesLoot(333, 289 + $midOffsetY) = "" ; check for gold value to be non-zero before reading other values as a secondary timer to make sure all values are available
		$iCount += 1
		If _Sleep($iDelayAttackReport1) Then Return
		If $debugSetlog = 1 Then Setlog("Waiting Attack Report Ready, " & ($iCount / 2) & " Seconds.", $COLOR_DEBUG)
		If $iCount > 20 Then ExitLoop ; wait 20*500ms = 10 seconds max before we have call the OCR read an error
	WEnd
	If $iCount > 20 Then Setlog("End of Attack scene read gold error, attack values my not be correct", $COLOR_INFO)

	If _ColorCheck(_GetPixelColor($aAtkRprtDECheck[0], $aAtkRprtDECheck[1], True), Hex($aAtkRprtDECheck[2], 6), $aAtkRprtDECheck[3]) Then ; if the color of the DE drop detected
		$g_iGoldLast[$CurrentAccount] = getResourcesLoot(333, 289 + $midOffsetY)
		If _Sleep($iDelayAttackReport2) Then Return
		$g_iElixirLast[$CurrentAccount] = getResourcesLoot(333, 328 + $midOffsetY)
		If _Sleep($iDelayAttackReport2) Then Return
		$g_iDarkLast[$CurrentAccount] = getResourcesLootDE(365, 365 + $midOffsetY)
		If _Sleep($iDelayAttackReport2) Then Return
		$g_iTrophyLast[$CurrentAccount] = getResourcesLootT(403, 402 + $midOffsetY)
		If _ColorCheck(_GetPixelColor($aAtkRprtTrophyCheck[0], $aAtkRprtTrophyCheck[1], True), Hex($aAtkRprtTrophyCheck[2], 6), $aAtkRprtTrophyCheck[3]) Then
			$g_iTrophyLast[$CurrentAccount] = -$g_iTrophyLast[$CurrentAccount]
		EndIf
		SetLog("Loot: [G]: " & _NumberFormat($g_iGoldLast[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirLast[$CurrentAccount]) & " [DE]: " & _NumberFormat($g_iDarkLast[$CurrentAccount]) & " [T]: " & $g_iTrophyLast[$CurrentAccount], $COLOR_SUCCESS)
	Else
		$g_iGoldLast[$CurrentAccount] = getResourcesLoot(333, 289 + $midOffsetY)
		If _Sleep($iDelayAttackReport2) Then Return
		$g_iElixirLast[$CurrentAccount] = getResourcesLoot(333, 328 + $midOffsetY)
		If _Sleep($iDelayAttackReport2) Then Return
		$g_iTrophyLast[$CurrentAccount] = getResourcesLootT(403, 365 + $midOffsetY)
		If _ColorCheck(_GetPixelColor($aAtkRprtTrophyCheck[0], $aAtkRprtTrophyCheck[1], True), Hex($aAtkRprtTrophyCheck[2], 6), $aAtkRprtTrophyCheck[3]) Then
			$g_iTrophyLast[$CurrentAccount] = -$g_iTrophyLast[$CurrentAccount]
		EndIf
		$g_iDarkLast[$CurrentAccount] = ""
		SetLog("Loot: [G]: " & _NumberFormat($g_iGoldLast[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirLast[$CurrentAccount]) & " [T]: " & $g_iTrophyLast[$CurrentAccount], $COLOR_SUCCESS)
	EndIf
	Local $iBonusLast = 0
	If $g_iTrophyLast[$CurrentAccount] >= 0 Then
		$iBonusLast = Number(getResourcesBonusPerc(570, 309 + $midOffsetY))
		If $iBonusLast > 0 Then
			SetLog("Bonus Percentage: " & $iBonusLast & "%")
			Local $iCalcMaxBonus = 0, $iCalcMaxBonusDark = 0

			If _ColorCheck(_GetPixelColor($aAtkRprtDECheck2[0], $aAtkRprtDECheck2[1], True), Hex($aAtkRprtDECheck2[2], 6), $aAtkRprtDECheck2[3]) Then
				If _Sleep($iDelayAttackReport2) Then Return
				$g_iGoldLastBonus[$CurrentAccount] = getResourcesBonus(590, 340 + $midOffsetY)
				$g_iGoldLastBonus[$CurrentAccount] = StringReplace($g_iGoldLastBonus[$CurrentAccount], "+", "")
				If _Sleep($iDelayAttackReport2) Then Return
				$g_iElixirLastBonus[$CurrentAccount] = getResourcesBonus(590, 371 + $midOffsetY)
				$g_iElixirLastBonus[$CurrentAccount] = StringReplace($g_iElixirLastBonus[$CurrentAccount], "+", "")
				If _Sleep($iDelayAttackReport2) Then Return
				$g_iDarkLastBonus[$CurrentAccount] = getResourcesBonus(621, 402 + $midOffsetY)
				$g_iDarkLastBonus[$CurrentAccount] = StringReplace($g_iDarkLastBonus[$CurrentAccount], "+", "")

				If $iBonusLast = 100 Then
					$iCalcMaxBonus = $g_iGoldLastBonus[$CurrentAccount]
					SetLog("Bonus [G]: " & _NumberFormat($g_iGoldLastBonus[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirLastBonus[$CurrentAccount]) & " [DE]: " & _NumberFormat($g_iDarkLastBonus[$CurrentAccount]), $COLOR_SUCCESS)
				Else
					$iCalcMaxBonus = Number($g_iGoldLastBonus[$CurrentAccount] / ($iBonusLast / 100))
					$iCalcMaxBonusDark = Number($g_iDarkLastBonus[$CurrentAccount] / ($iBonusLast / 100))

					SetLog("Bonus [G]: " & _NumberFormat($g_iGoldLastBonus[$CurrentAccount]) & " out of " & _NumberFormat($iCalcMaxBonus) & " [E]: " & _NumberFormat($g_iElixirLastBonus[$CurrentAccount]) & " out of " & _NumberFormat($iCalcMaxBonus) & " [DE]: " & _NumberFormat($g_iDarkLastBonus[$CurrentAccount]) & " out of " & _NumberFormat($iCalcMaxBonusDark), $COLOR_SUCCESS)
				EndIf
			Else
				If _Sleep($iDelayAttackReport2) Then Return
				$g_iGoldLastBonus[$CurrentAccount] = getResourcesBonus(590, 340 + $midOffsetY)
				$g_iGoldLastBonus[$CurrentAccount] = StringReplace($g_iGoldLastBonus[$CurrentAccount], "+", "")
				If _Sleep($iDelayAttackReport2) Then Return
				$g_iElixirLastBonus[$CurrentAccount] = getResourcesBonus(590, 371 + $midOffsetY)
				$g_iElixirLastBonus[$CurrentAccount] = StringReplace($g_iElixirLastBonus[$CurrentAccount], "+", "")
				$g_iDarkLastBonus[$CurrentAccount] = 0

				If $iBonusLast = 100 Then
					$iCalcMaxBonus = $g_iGoldLastBonus[$CurrentAccount]
					SetLog("Bonus [G]: " & _NumberFormat($g_iGoldLastBonus[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirLastBonus[$CurrentAccount]), $COLOR_SUCCESS)
				Else
					$iCalcMaxBonus = Number($g_iGoldLastBonus[$CurrentAccount] / ($iBonusLast / 100))
					SetLog("Bonus [G]: " & _NumberFormat($g_iGoldLastBonus[$CurrentAccount]) & " out of " & _NumberFormat($iCalcMaxBonus) & " [E]: " & _NumberFormat($g_iElixirLastBonus[$CurrentAccount]) & " out of " & _NumberFormat($iCalcMaxBonus), $COLOR_SUCCESS)
				EndIf
			EndIf

			$LeagueShort = "--"
			For $i = 1 To 21 ; skip 0 = Bronze III, see "No Bonus" else section below
				If _Sleep($iDelayAttackReport2) Then Return
				If $League[$i][0] = $iCalcMaxBonus Then
					SetLog("Your league level is: " & $League[$i][1])
					$LeagueShort = $League[$i][3]
					ExitLoop
				EndIf
			Next
		Else
			SetLog("No Bonus")

			$LeagueShort = "--"
			If $g_iTrophyCurrent[$CurrentAccount] + $g_iTrophyLast[$CurrentAccount] >= 400 And $g_iTrophyCurrent[$CurrentAccount] + $g_iTrophyLast[$CurrentAccount] < 500 Then ; Bronze III has no League bonus
				SetLog("Your league level is: " & $League[0][1])
				$LeagueShort = $League[0][3]
			EndIf
		EndIf
		;Display League in Stats ==>
		GUICtrlSetData($lblLeague, "")

		If StringInStr($LeagueShort, "1") > 1 Then
			GUICtrlSetData($lblLeague, "1")
		ElseIf StringInStr($LeagueShort, "2") > 1 Then
			GUICtrlSetData($lblLeague, "2")
		ElseIf StringInStr($LeagueShort, "3") > 1 Then
			GUICtrlSetData($lblLeague, "3")
		EndIf
		_GUI_Value_STATE("HIDE", $groupLeague)
		If StringInStr($LeagueShort, "B") > 0 Then
			GUICtrlSetState($BronzeLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "S") > 0 Then
			GUICtrlSetState($SilverLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "G") > 0 Then
			GUICtrlSetState($GoldLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "c", $STR_CASESENSE) > 0 Then
			GUICtrlSetState($CrystalLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "M") > 0 Then
			GUICtrlSetState($MasterLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "C", $STR_CASESENSE) > 0 Then
			GUICtrlSetState($ChampionLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "T") > 0 Then
			GUICtrlSetState($TitanLeague, $GUI_SHOW)
		ElseIf StringInStr($LeagueShort, "LE") > 0 Then
			GUICtrlSetState($LegendLeague, $GUI_SHOW)
		Else
			GUICtrlSetState($UnrankedLeague,$GUI_SHOW)
		EndIf
		;==> Display League in Stats
	Else
		$g_iGoldLastBonus[$CurrentAccount] = 0
		$g_iElixirLastBonus[$CurrentAccount] = 0
		$g_iDarkLastBonus[$CurrentAccount] = 0
		$LeagueShort = "--"
	EndIf

	; check stars earned
	Local $starsearned = 0
	If _ColorCheck(_GetPixelColor($aWonOneStarAtkRprt[0], $aWonOneStarAtkRprt[1], True), Hex($aWonOneStarAtkRprt[2], 6), $aWonOneStarAtkRprt[3]) Then $starsearned += 1
	If _ColorCheck(_GetPixelColor($aWonTwoStarAtkRprt[0], $aWonTwoStarAtkRprt[1], True), Hex($aWonTwoStarAtkRprt[2], 6), $aWonTwoStarAtkRprt[3]) Then $starsearned += 1
	If _ColorCheck(_GetPixelColor($aWonThreeStarAtkRprt[0], $aWonThreeStarAtkRprt[1], True), Hex($aWonThreeStarAtkRprt[2], 6), $aWonThreeStarAtkRprt[3]) Then $starsearned += 1
	SetLog("Stars earned: " & $starsearned)

	Local $AtkLogTxt

	If $ichkSwitchAccount = 1 Then
		$AtkLogTxt = "#" & String($CurrentAccount) & "|" & _NowTime(4) & "|"
		$AtkLogTxt &= StringFormat("%5d", $g_iTrophyCurrent[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%4d", $SearchCount) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iGoldLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iElixirLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iDarkLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%3d", $g_iTrophyLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%1d", $starsearned) & "|"
		$AtkLogTxt &= StringFormat("%6d", $g_iGoldLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%6d", $g_iElixirLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%4d", $g_iDarkLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= $LeagueShort & "|"
	Else
		$AtkLogTxt = "" & _NowTime(4) & "|"
		$AtkLogTxt &= StringFormat("%5d", $g_iTrophyCurrent[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%6d", $SearchCount) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iGoldLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iElixirLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%7d", $g_iDarkLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%3d", $g_iTrophyLast[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%1d", $starsearned) & "|"
		$AtkLogTxt &= StringFormat("%6d", $g_iGoldLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%6d", $g_iElixirLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= StringFormat("%4d", $g_iDarkLastBonus[$CurrentAccount]) & "|"
		$AtkLogTxt &= $LeagueShort & "|"
	EndIf

	Local $AtkLogTxtExtend
	$AtkLogTxtExtend = "|"
	$AtkLogTxtExtend &= $CurCamp & "/" & $TotalCamp & "|"
	If Int($g_iTrophyLast[$CurrentAccount]) >= 0 Then
		SetAtkLog($AtkLogTxt, $AtkLogTxtExtend, $COLOR_BLACK)
	Else
		SetAtkLog($AtkLogTxt, $AtkLogTxtExtend, $COLOR_ERROR)
	EndIf

	AppendLineToSSALog($AtkLogTxt)

	; rename or delete zombie
	If $debugDeadBaseImage = 1 Then
		setZombie($g_iElixirLast[$CurrentAccount])
	EndIf

	; Share Replay
	If $iShareAttack = 1 Then
		If (Number($g_iGoldLast[$CurrentAccount]) >= Number($iShareminGold)) And (Number($g_iElixirLast[$CurrentAccount]) >= Number($iShareminElixir)) And (Number($g_iDarkLast[$CurrentAccount]) >= Number($iSharemindark)) Then
			SetLog("Reached miminum Loot values... Share Replay")
			$iShareAttackNow = 1
		Else
			SetLog("Below miminum Loot values... No Share Replay")
			$iShareAttackNow = 0
		EndIf
	EndIf


	    CoCStats($starsearned)

	If $FirstAttack = 0 Then $FirstAttack = 1

	$g_iGoldTotal[$CurrentAccount] += $g_iGoldLast[$CurrentAccount] + $g_iGoldLastBonus[$CurrentAccount]
	$g_iTotalGoldGain[$CurrentAccount][$iMatchMode] += $g_iGoldLast[$CurrentAccount] + $g_iGoldLastBonus[$CurrentAccount]

	$g_iElixirTotal[$CurrentAccount] += $g_iElixirLast[$CurrentAccount] + $g_iElixirLastBonus[$CurrentAccount]
	$g_iTotalElixirGain[$CurrentAccount][$iMatchMode] += $g_iElixirLast[$CurrentAccount] + $g_iElixirLastBonus[$CurrentAccount]

	If $g_iDarkStart[$CurrentAccount] <> "" Then
		$g_iDarkTotal[$CurrentAccount] += $g_iDarkLast[$CurrentAccount] + $g_iDarkLastBonus[$CurrentAccount]
		$g_iTotalDarkGain[$CurrentAccount][$iMatchMode] += $g_iDarkLast[$CurrentAccount] + $g_iDarkLastBonus[$CurrentAccount]
	EndIf

	$g_iTrophyTotal[$CurrentAccount] += $g_iTrophyLast[$CurrentAccount]
	$g_iTotalTrophyGain[$CurrentAccount][$iMatchMode] += $g_iTrophyLast[$CurrentAccount]
	If $iMatchMode = $TS Then
		If $starsearned > 0 Then
			$g_iNbrOfTHSnipeSuccess[$CurrentAccount] += 1
		Else
			$g_iNbrOfTHSnipeFails[$CurrentAccount] += 1
		EndIf
	EndIf
	$g_iAttackedVillageCount[$CurrentAccount][$iMatchMode] += 1

	If $ichkSwitchAccount = 1 Then
		$g_iGoldGainSW[$CurrentAccount] += $g_iGoldLast[$CurrentAccount] + $g_iGoldLastBonus[$CurrentAccount]
		$g_iElixirGainSW[$CurrentAccount] += $g_iElixirLast[$CurrentAccount] + $g_iElixirLastBonus[$CurrentAccount]
		$g_iDarkGainSW[$CurrentAccount] += $g_iDarkLast[$CurrentAccount] + $g_iDarkLastBonus[$CurrentAccount]
	EndIf

	UpdateStats()
	$troops_maked_after_fullarmy = False ; reset variable due to used troops for attack
	$actual_train_skip = 0 ;
	If $debugsetlogTrain = 1 Then setlog("reset: troops_maked_after_fullarmy = False",$color_purple)

EndFunc   ;==>AttackReport
