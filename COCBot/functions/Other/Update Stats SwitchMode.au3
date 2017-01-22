; #FUNCTION# ====================================================================================================================
; Name ..........: UpdateStats
; Description ...: Additional functions for UpdateStats
; Syntax ........: UpdateStats()
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Func UpdateStatsSwitchMode()

If $g_sProfileName[$CurrentAccount] <> $sCurrProfile Then
	$g_sProfileName[$CurrentAccount] = $sCurrProfile
	GUICtrlSetData($g_grpVillageSW[$CurrentAccount], GetTranslated(603, 32, "Village") & ": " & $g_sProfileName[$CurrentAccount])
EndIf

	GUICtrlSetData($lblResultSkippedHourNow, $g_iSkippedVillageCountSW[$CurrentAccount])		;	Counting skipped village at Bottom GUI
	GUICtrlSetData($lblResultAttackedHourNow, $g_iAttackedVillageCount[$CurrentAccount])			;	Counting attacked village at Bottom GUI

    For $i = 1 To 8 ; Update time for all Accounts
#cs
		If $aTimerStart[$i] <> 0 Then
			$aTimerEnd[$i] = Round(TimerDiff($aTimerStart[$i]) / 1000 / 60, 2) 		; 	counting elapse of training time of an account from last army checking - in minutes
			$aUpdateRemainTrainTime[$i] = Round($aRemainTrainTime[$i]-$aTimerEnd[$i], 1)			;   updated remain train time of Active accounts
			If $aUpdateRemainTrainTime[$i] < 0 And $i <> ($nCurProfile - 1) Then
				GUICtrlSetData($lblResultTimeNowAcc[$i], _NumberFormat( $aUpdateRemainTrainTime[$i], True))
				GUICtrlSetFont($lblResultTimeNowAcc[$i], 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
				GUICtrlSetColor($lblResultTimeNowAcc[$i], $COLOR_RED)
			EndIf
			If $aUpdateRemainTrainTime[$i] >= 0 And $i <> ($nCurProfile - 1) Then
				GUICtrlSetData($lblResultTimeNowAcc[$i], _NumberFormat( $aUpdateRemainTrainTime[$i], True))
				GUICtrlSetFont($lblResultTimeNowAcc[$i], 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
				GUICtrlSetColor($lblResultTimeNowAcc[$i], $COLOR_BLACK)
			EndIf
		EndIf
#ce

	; Update Per Hour stats every Time

	;THESE ARE UPDATE STATS IN TAB, NOT BELOW STATS
		GUICtrlSetData($g_lblHrStatsGoldSW[$CurrentAccount], _NumberFormat(Round($g_iGoldGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
		GUICtrlSetData($g_lblHrStatsElixirSW[$CurrentAccount], _NumberFormat(Round($g_iElixirGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
		GUICtrlSetData($g_lblHrStatsDarkSW[$CurrentAccount], _NumberFormat(Round($g_iDarkGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) )

	Next


; Update Stats Just for Current Account, only the ones that have changed >> Faster

		If $g_iGoldNowSW[$CurrentAccount] <> $g_iOLDGoldNowSW[$CurrentAccount] Or $g_iGoldNowSW[$CurrentAccount] = "" Then
			GUICtrlSetData($g_lblGoldNowSW[$CurrentAccount], _NumberFormat($g_iGoldNowSW[$CurrentAccount]))
			$g_iOLDGoldNowSW[$CurrentAccount] = $g_iGoldNowSW[$CurrentAccount]
		EndIf

		If $g_iElixirNowSW[$CurrentAccount] <> $g_iOLDElixirNowSW[$CurrentAccount] Or $g_iElixirNowSW[$CurrentAccount] = "" Then
			GUICtrlSetData($g_lblElixirNowSW[$CurrentAccount], _NumberFormat($g_iElixirNowSW[$CurrentAccount]))
			$g_iOLDElixirNowSW[$CurrentAccount] = $g_iElixirNowSW[$CurrentAccount]
		EndIf

		If $g_iDarkNowSW[$CurrentAccount] <> $g_iOLDDarkNowSW[$CurrentAccount] Or $g_iDarkNowSW[$CurrentAccount] = "" Then
			If $iDarkStart <> "" Then
				GUICtrlSetData($g_lblDarkNowSW[$CurrentAccount], _NumberFormat($g_iDarkNowSW[$CurrentAccount]))
				$g_iOLDDarkNowSW[$CurrentAccount] = $g_iDarkNowSW[$CurrentAccount]
			EndIf
		EndIf

		If $g_iGemNow[$CurrentAccount] <> $g_iOLDGemNow[$CurrentAccount] Or $g_iGemNow[$CurrentAccount] = "" Then
			GUICtrlSetData($g_lblGemNowSW[$CurrentAccount], _NumberFormat($g_iGemNow[$CurrentAccount], True))
			$g_iOLDGemNow[$CurrentAccount] = $g_iGemNow[$CurrentAccount]
		EndIf

		If $g_iFreeBuilders[$CurrentAccount] <> $g_iOLDFreeBuilders[$CurrentAccount] Or $g_iFreeBuilders[$CurrentAccount] = "" Then
			GUICtrlSetData($g_lblBuilderNowSW[$CurrentAccount], $g_iFreeBuilders[$CurrentAccount] & "/" & $g_iTotalBuilders[$CurrentAccount])
			$g_iOLDFreeBuilders[$CurrentAccount] = $g_iFreeBuilders[$CurrentAccount]
		EndIf



	If $FirstAttack = 2 Then  ; ============= Update Gain Stats at Bottom GUI
		GUICtrlSetData($lblResultGoldHourNow, _NumberFormat(Round($g_iGoldGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & " K/hr") ;GUI BOTTOM
		GUICtrlSetData($lblResultElixirHourNow, _NumberFormat(Round($g_iElixirGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & " K/hr") ;GUI BOTTOM
		If $iDarkStart <> "" Then
			GUICtrlSetData($lblResultDEHourNow, _NumberFormat(Round($g_iDarkGainSW[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & "  /hr") ;GUI BOTTOM
		EndIf
	EndIf		; ============= Update Gain Stats at Bottom GUI

EndFunc   ;==>UpdateStatsForSwitchAcc

Func ResetStatsSwitchMode()

	For $i = 1 To 8 ; SwitchAcc Mod - Demen
	   $g_iGoldNowSW[$i] = 0
	   $g_iElixirNowSW[$i] = 0
	   $g_iDarkNowSW[$i] = 0

	   $g_iGoldGainSW[$i] = 0
	   $g_iElixirGainSW[$i] = 0
	   $g_iDarkGainSW[$i] = 0

	   $g_iAttackedVillageCount[$i] = 0
	   $g_iSkippedVillageCountSW[$i] = 0

	Next

EndFunc   ;==>ResetStatsForSwitchAcc


