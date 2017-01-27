; #FUNCTION# ====================================================================================================================
; Name ..........:
; Description ...: This function will update the statistics in the GUI.
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Boju (11-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Func StartGainCost()
	$TempGainCost[0] = 0
	$TempGainCost[1] = 0
	$TempGainCost[2] = 0
	VillageReport(True, True)
	Local $tempCounter = 0
	While ($g_iGoldCurrent[$CurrentAccount] = "" Or $g_iElixirCurrent[$CurrentAccount] = "" Or ($g_iDarkCurrent[$CurrentAccount] = "" And $g_iDarkStart[$CurrentAccount] <> "")) And $tempCounter < 5
		$tempCounter += 1
		If _Sleep(100) Then Return
		VillageReport(True, True)
	WEnd
	$TempGainCost[0] = $g_iGoldCurrent[$CurrentAccount] ;$tempGold
	$TempGainCost[1] = $g_iElixirCurrent[$CurrentAccount] ;$tempElixir
	$TempGainCost[2] = $g_iDarkCurrent[$CurrentAccount] ;$tempDElixir
EndFunc   ;==>StartGainCost

Func EndGainCost($Type)
	VillageReport(True, True)
	$tempCounter = 0
	While ($g_iGoldCurrent[$CurrentAccount] = "" Or $g_iElixirCurrent[$CurrentAccount] = "" Or ($g_iDarkCurrent[$CurrentAccount] = "" And $g_iDarkStart[$CurrentAccount] <> "")) And $tempCounter < 5
		$tempCounter += 1
		VillageReport(True, True)
	WEnd

	Switch $Type
		Case "Collect"
			Local $tempGoldCollected = 0
			Local $tempElixirCollected = 0
			Local $tempDElixirCollected = 0

			If $TempGainCost[0] <> "" And $g_iGoldCurrent[$CurrentAccount] <> "" And $TempGainCost[0] <> $g_iGoldCurrent[$CurrentAccount] Then
				$tempGoldCollected = $g_iGoldCurrent[$CurrentAccount] - $TempGainCost[0]
				$g_iGoldFromMines[$CurrentAccount] += $tempGoldCollected
				$g_iGoldTotal[$CurrentAccount] += $tempGoldCollected
			EndIf

			If $TempGainCost[1] <> "" And $g_iElixirCurrent[$CurrentAccount] <> "" And $TempGainCost[1] <> $g_iElixirCurrent[$CurrentAccount] Then
				$tempElixirCollected = $g_iElixirCurrent[$CurrentAccount] - $TempGainCost[1]
				$g_iElixirFromCollectors[$CurrentAccount] += $tempElixirCollected
				$g_iElixirTotal[$CurrentAccount] += $tempElixirCollected
			EndIf

			If $TempGainCost[2] <> "" And $g_iDarkCurrent[$CurrentAccount] <> "" And $TempGainCost[2] <> $g_iDarkCurrent[$CurrentAccount] Then
				$tempDElixirCollected = $g_iDarkCurrent[$CurrentAccount] - $TempGainCost[2]
				$g_iDElixirFromDrills[$CurrentAccount] += $tempDElixirCollected
				$g_iDarkTotal[$CurrentAccount] += $tempDElixirCollected
			EndIf

			If $ichkSwitchAccount = 1 Then
				$g_iGoldGainSW[$CurrentAccount] += $tempGoldCollected
				$g_iElixirGainSW[$CurrentAccount] += $tempElixirCollected
				$g_iDarkGainSW[$CurrentAccount] += $tempDElixirCollected
			EndIf


		Case "Train"
			Local $tempElixirSpent = 0
			Local $tempDElixirSpent = 0
			If $TempGainCost[1] <> "" And $g_iElixirCurrent[$CurrentAccount] <> ""  And $TempGainCost[1] <> $g_iElixirCurrent[$CurrentAccount] Then
				$tempElixirSpent = ($TempGainCost[1] - $g_iElixirCurrent[$CurrentAccount])
				$g_iTrainCostElixir[$CurrentAccount] += $tempElixirSpent
				$g_iElixirTotal[$CurrentAccount] -= $tempElixirSpent
			EndIf

			If $TempGainCost[2] <> "" And $g_iDarkCurrent[$CurrentAccount] <> ""  And $TempGainCost[2] <> $g_iDarkCurrent[$CurrentAccount] Then
				$tempDElixirSpent = ($TempGainCost[2] - $g_iDarkCurrent[$CurrentAccount])
				$g_iTrainCostDElixir[$CurrentAccount] += $tempDElixirSpent
				$g_iDarkTotal[$CurrentAccount] -= $tempDElixirSpent
			EndIf

			If $ichkSwitchAccount = 1 Then
				$g_iElixirGainSW[$CurrentAccount] -= $tempElixirSpent
				$g_iDarkGainSW[$CurrentAccount] -= $tempDElixirSpent
			EndIf

	EndSwitch

	UpdateStats()
EndFunc   ;==>StartGainCost