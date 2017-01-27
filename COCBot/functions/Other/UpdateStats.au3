; #FUNCTION# ====================================================================================================================
; Name ..........: UpdateStats
; Description ...: This function will update the statistics in the GUI.
; Syntax ........: UpdateStats()
; Parameters ....: None
; Return values .: None
; Author ........: kaganus (2015-jun-20)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Global $ResetStats = 0
Global $iOldFreeBuilderCount, $iOldTotalBuilderCount, $iOldGemAmount ; builder and gem amounts
Global $iOldGoldTotal, $iOldElixirTotal, $iOldDarkTotal, $iOldTrophyTotal ; total stats
Global $iOldGoldLast, $iOldElixirLast, $iOldDarkLast, $iOldTrophyLast ; loot and trophy gain from last raid
Global $iOldGoldLastBonus, $iOldElixirLastBonus, $iOldDarkLastBonus ; bonus loot from last raid
Global $iOldSkippedVillageCount, $iOldDroppedTrophyCount ; skipped village and dropped trophy counts
Global $iOldCostGoldWall, $iOldCostElixirWall, $iOldCostGoldBuilding, $iOldCostElixirBuilding, $iOldCostDElixirHero ; wall, building and hero upgrade costs
Global $iOldNbrOfWallsUppedGold, $iOldNbrOfWallsUppedElixir, $iOldNbrOfBuildingsUppedGold, $iOldNbrOfBuildingsUppedElixir, $iOldNbrOfHeroesUpped ; number of wall, building, hero upgrades with gold, elixir, delixir
Global $iOldSearchCost, $iOldTrainCostElixir, $iOldTrainCostDElixir ; search and train troops cost
Global $iOldNbrOfOoS ; number of Out of Sync occurred
Global $iOldNbrOfTHSnipeFails, $iOldNbrOfTHSnipeSuccess ; number of fails and success while TH Sniping
Global $iOldGoldFromMines, $iOldElixirFromCollectors, $iOldDElixirFromDrills ; number of resources gain by collecting mines, collectors, drills
Global $iOldAttackedCount, $iOldAttackedVillageCount[$iModeCount + 1] ; number of attack villages for DB, LB, TB, TS
Global $iOldTotalGoldGain[$iModeCount + 1], $iOldTotalElixirGain[$iModeCount + 1], $iOldTotalDarkGain[$iModeCount + 1], $iOldTotalTrophyGain[$iModeCount + 1] ; total resource gains for DB, LB, TB, TS
Global $iOldNbrOfDetectedMines[$iModeCount + 1], $iOldNbrOfDetectedCollectors[$iModeCount + 1], $iOldNbrOfDetectedDrills[$iModeCount + 1] ; number of mines, collectors, drills detected for DB, LB, TB

Func UpdateStats()
	Local Static $iAttackedCountStatic = 0
	Local Static $iOLDGoldCurrentStatic[9] , $iOLDElixirCurrentStatic[9] , $iOLDDarkCurrentStatic[9] , $iOLDTrophyCurrentStatic[9]  ; current stats


	If $FirstRun = 1  Then
		;GUICtrlSetState($lblResultStatsTemp, $GUI_HIDE)
		GUICtrlSetState($lblVillageReportTemp, $GUI_HIDE)
		GUICtrlSetState($picResultGoldTemp, $GUI_HIDE)
		GUICtrlSetState($picResultElixirTemp, $GUI_HIDE)
		GUICtrlSetState($picResultDETemp, $GUI_HIDE)

		GUICtrlSetState($lblResultGoldNow, $GUI_SHOW + $GUI_DISABLE) ; $GUI_DISABLE to trigger default view in btnVillageStat
		GUICtrlSetState($picResultGoldNow, $GUI_SHOW)
		GUICtrlSetState($lblResultElixirNow, $GUI_SHOW)
		GUICtrlSetState($picResultElixirNow, $GUI_SHOW)
		If $g_iDarkCurrent[$CurrentAccount] <> "" Then
			GUICtrlSetState($lblResultDeNow, $GUI_SHOW)
			GUICtrlSetState($picResultDeNow, $GUI_SHOW)
		Else
			GUICtrlSetState($picResultDEStart, $GUI_HIDE)
			GUICtrlSetState($picDarkLoot, $GUI_HIDE)
			GUICtrlSetState($picDarkLastAttack, $GUI_HIDE)
			GUICtrlSetState($picHourlyStatsDark, $GUI_HIDE)
		EndIf
		GUICtrlSetState($lblResultTrophyNow, $GUI_SHOW)
		GUICtrlSetState($lblResultBuilderNow, $GUI_SHOW)
		GUICtrlSetState($lblResultGemNow, $GUI_SHOW)
		btnVillageStat("UpdateStats")

				$g_iGoldStart[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
				$g_iElixirStart[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
				$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
				$g_iTrophyStart[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]

				GUICtrlSetData($lblResultGoldStart, _NumberFormat($g_iGoldStart[$CurrentAccount], True))
				GUICtrlSetData($lblResultGoldNow, _NumberFormat($g_iGoldCurrent[$CurrentAccount], True))
				$iOLDGoldCurrentStatic[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
				GUICtrlSetData($lblResultElixirStart, _NumberFormat($g_iElixirStart[$CurrentAccount], True))
				GUICtrlSetData($lblResultElixirNow, _NumberFormat($g_iElixirCurrent[$CurrentAccount], True))
				$iOLDElixirCurrentStatic[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]

				If $g_iDarkStart[$CurrentAccount] <> "" Then
					GUICtrlSetData($lblResultDEStart, _NumberFormat($g_iDarkStart[$CurrentAccount], True))
					GUICtrlSetData($lblResultDeNow, _NumberFormat($g_iDarkCurrent[$CurrentAccount], True))
					$iOLDDarkCurrentStatic[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
				EndIf

				GUICtrlSetData($lblResultTrophyStart, _NumberFormat($g_iTrophyStart[$CurrentAccount], True))
				GUICtrlSetData($lblResultTrophyNow, _NumberFormat($g_iTrophyCurrent[$CurrentAccount], True))
				$iOLDTrophyCurrentStatic[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]





		GUICtrlSetData($lblResultGemNow, _NumberFormat($g_iGemAmount[$CurrentAccount], True))
		$iOldGemAmount = $g_iGemAmount[$CurrentAccount]
		GUICtrlSetData($lblResultBuilderNow, $g_iFreeBuilderCount[$CurrentAccount] & "/" & $g_iTotalBuilderCount[$CurrentAccount])
		$iOldFreeBuilderCount = $g_iFreeBuilderCount[$CurrentAccount]
		$iOldTotalBuilderCount = $g_iTotalBuilderCount[$CurrentAccount]
		$FirstRun = 0
		GUICtrlSetState($btnResetStats, $GUI_ENABLE)

		If $ichkSwitchAccount = 1 Then
			UpdateStatsSwitchMode()
		EndIf

		Return
	EndIf

	If $FirstAttack = 1 Then
		$FirstAttack = 2
	EndIf


	GUICtrlSetData($lblResultGoldStart, _NumberFormat($g_iGoldStart[$CurrentAccount], True))
	GUICtrlSetData($lblResultElixirStart, _NumberFormat($g_iElixirStart[$CurrentAccount], True))
	GUICtrlSetData($lblResultDEStart, _NumberFormat($g_iDarkStart[$CurrentAccount], True))
	GUICtrlSetData($lblResultTrophyStart, _NumberFormat($g_iTrophyStart[$CurrentAccount], True))

	If Number($g_iGoldLast[$CurrentAccount]) > Number($topgoldloot) Then
		$topgoldloot = $g_iGoldLast[$CurrentAccount]
		GUICtrlSetData($lbltopgoldloot, _NumberFormat($topgoldloot))
	EndIf

	If Number($g_iElixirLast[$CurrentAccount]) > Number($topelixirloot) Then
		$topelixirloot = $g_iElixirLast[$CurrentAccount]
		GUICtrlSetData($lbltopelixirloot, _NumberFormat($topelixirloot))
	EndIf

	If Number($g_iDarkLast[$CurrentAccount]) > Number($topdarkloot) Then
		$topdarkloot = $g_iDarkLast[$CurrentAccount]
		GUICtrlSetData($lbltopdarkloot, _NumberFormat($topdarkloot))
	EndIf

	If Number($g_iTrophyLast[$CurrentAccount]) > Number($topTrophyloot) Then
		$topTrophyloot = $g_iTrophyLast[$CurrentAccount]
		GUICtrlSetData($lbltopTrophyloot, _NumberFormat($topTrophyloot))
	EndIf

	If $ResetStats = 1 Then
		GUICtrlSetData($lblResultGoldStart, _NumberFormat($g_iGoldCurrent[$CurrentAccount], True))
		GUICtrlSetData($lblResultElixirStart, _NumberFormat($g_iElixirCurrent[$CurrentAccount], True))
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblResultDEStart, _NumberFormat($g_iDarkCurrent[$CurrentAccount], True))
		EndIf
		GUICtrlSetData($lblResultTrophyStart, _NumberFormat($g_iTrophyCurrent[$CurrentAccount], True))
		GUICtrlSetData($lblHourlyStatsGold, "")
		GUICtrlSetData($lblHourlyStatsElixir, "")
		GUICtrlSetData($lblHourlyStatsDark, "")
		GUICtrlSetData($lblHourlyStatsTrophy, "")
		GUICtrlSetData($lblResultGoldHourNow, "") ;GUI BOTTOM
		GUICtrlSetData($lblResultElixirHourNow, "") ;GUI BOTTOM
		GUICtrlSetData($lblResultDEHourNow, "") ;GUI BOTTOM

	EndIf

	If $iOldFreeBuilderCount <> $g_iFreeBuilderCount[$CurrentAccount] Or $iOldTotalBuilderCount <> $g_iTotalBuilderCount[$CurrentAccount] Then
		GUICtrlSetData($lblResultBuilderNow, $g_iFreeBuilderCount[$CurrentAccount] & "/" & $g_iTotalBuilderCount[$CurrentAccount])
		$iOldFreeBuilderCount = $g_iFreeBuilderCount[$CurrentAccount]
		$iOldTotalBuilderCount = $g_iTotalBuilderCount[$CurrentAccount]
	EndIf

	If $iOldGemAmount <> $g_iGemAmount[$CurrentAccount] Then
		GUICtrlSetData($lblResultGemNow, _NumberFormat($g_iGemAmount[$CurrentAccount], True))
		$iOldGemAmount = $g_iGemAmount[$CurrentAccount]
	EndIf

	If $iOLDGoldCurrentStatic[$CurrentAccount] <> $g_iGoldCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultGoldNow, _NumberFormat($g_iGoldCurrent[$CurrentAccount], True))
		$iOLDGoldCurrentStatic[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
	EndIf

	If $iOLDElixirCurrentStatic[$CurrentAccount] <> $g_iElixirCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultElixirNow, _NumberFormat($g_iElixirCurrent[$CurrentAccount], True))
		$iOLDElixirCurrentStatic[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
	EndIf

	If $iOLDDarkCurrentStatic[$CurrentAccount] <> $g_iDarkCurrent[$CurrentAccount] And $g_iDarkStart[$CurrentAccount] <> "" Then
		GUICtrlSetData($lblResultDeNow, _NumberFormat($g_iDarkCurrent[$CurrentAccount], True))
		$iOLDDarkCurrentStatic[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
	EndIf

	If $iOLDTrophyCurrentStatic[$CurrentAccount] <> $g_iTrophyCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultTrophyNow, _NumberFormat($g_iTrophyCurrent[$CurrentAccount], True))
		$iOLDTrophyCurrentStatic[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]
	EndIf

	If $iOldGoldTotal <> $g_iGoldTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblGoldLoot, _NumberFormat($g_iGoldTotal[$CurrentAccount]))
		$iOldGoldTotal = $g_iGoldTotal[$CurrentAccount]
	EndIf

	If $iOldElixirTotal <> $g_iElixirTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblElixirLoot, _NumberFormat($g_iElixirTotal[$CurrentAccount]))
		$iOldElixirTotal = $g_iElixirTotal[$CurrentAccount]
	EndIf

	If $iOldDarkTotal <> $g_iDarkTotal[$CurrentAccount] And (($FirstAttack = 2 And $g_iDarkStart[$CurrentAccount] <> "") Or $ResetStats = 1) Then
		GUICtrlSetData($lblDarkLoot, _NumberFormat($g_iDarkTotal[$CurrentAccount]))
		$iOldDarkTotal = $g_iDarkTotal[$CurrentAccount]
	EndIf

	If $iOldTrophyTotal <> $g_iTrophyTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblTrophyLoot, _NumberFormat($g_iTrophyTotal[$CurrentAccount]))
		$iOldTrophyTotal = $g_iTrophyTotal[$CurrentAccount]
	EndIf

	If $iOldGoldLast <> $g_iGoldLast[$CurrentAccount] Then
		GUICtrlSetData($lblGoldLastAttack, _NumberFormat($g_iGoldLast[$CurrentAccount]))
		$iOldGoldLast = $g_iGoldLast[$CurrentAccount]
	EndIf

	If $iOldElixirLast <> $g_iElixirLast[$CurrentAccount] Then
		GUICtrlSetData($lblElixirLastAttack, _NumberFormat($g_iElixirLast[$CurrentAccount]))
		$iOldElixirLast = $g_iElixirLast[$CurrentAccount]
	EndIf

	If $iOldDarkLast <> $g_iDarkLast[$CurrentAccount] Then
		GUICtrlSetData($lblDarkLastAttack, _NumberFormat($g_iDarkLast[$CurrentAccount]))
		$iOldDarkLast = $g_iDarkLast[$CurrentAccount]
	EndIf

	If $iOldTrophyLast <> $g_iTrophyLast[$CurrentAccount] Then
		GUICtrlSetData($lblTrophyLastAttack, _NumberFormat($g_iTrophyLast[$CurrentAccount]))
		$iOldTrophyLast = $g_iTrophyLast[$CurrentAccount]
	EndIf

	If $iOldGoldLastBonus <> $g_iGoldLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblGoldBonusLastAttack, _NumberFormat($g_iGoldLastBonus[$CurrentAccount]))
		$iOldGoldLastBonus = $g_iGoldLastBonus[$CurrentAccount]
	EndIf

	If $iOldElixirLastBonus <> $g_iElixirLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblElixirBonusLastAttack, _NumberFormat($g_iElixirLastBonus[$CurrentAccount]))
		$iOldElixirLastBonus = $g_iElixirLastBonus[$CurrentAccount]
	EndIf

	If $iOldDarkLastBonus <> $g_iDarkLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblDarkBonusLastAttack, _NumberFormat($g_iDarkLastBonus[$CurrentAccount]))
		$iOldDarkLastBonus = $g_iDarkLastBonus[$CurrentAccount]
	EndIf

	If $iOldCostGoldWall <> $g_iCostGoldWall[$CurrentAccount] Then
		GUICtrlSetData($lblWallUpgCostGold, _NumberFormat($g_iCostGoldWall[$CurrentAccount], True))
		$iOldCostGoldWall = $g_iCostGoldWall[$CurrentAccount]
	EndIf

	If $iOldCostElixirWall <> $g_iCostElixirWall[$CurrentAccount] Then
		GUICtrlSetData($lblWallUpgCostElixir, _NumberFormat($g_iCostElixirWall[$CurrentAccount], True))
		$iOldCostElixirWall = $g_iCostElixirWall[$CurrentAccount]
	EndIf

	If $iOldCostGoldBuilding <> $g_iCostGoldBuilding[$CurrentAccount] Then
		GUICtrlSetData($lblBuildingUpgCostGold, _NumberFormat($g_iCostGoldBuilding[$CurrentAccount], True))
		$iOldCostGoldBuilding = $g_iCostGoldBuilding[$CurrentAccount]
	EndIf

	If $iOldCostElixirBuilding <> $g_iCostElixirBuilding[$CurrentAccount] Then
		GUICtrlSetData($lblBuildingUpgCostElixir, _NumberFormat($g_iCostElixirBuilding[$CurrentAccount], True))
		$iOldCostElixirBuilding = $g_iCostElixirBuilding[$CurrentAccount]
	EndIf

	If $iOldCostDElixirHero <> $g_iCostDElixirHero[$CurrentAccount] Then
		GUICtrlSetData($lblHeroUpgCost, _NumberFormat($g_iCostDElixirHero[$CurrentAccount], True))
		$iOldCostDElixirHero = $g_iCostDElixirHero[$CurrentAccount]
	EndIf

	If $iOldSkippedVillageCount <> $g_iSkippedVillageCount[$CurrentAccount] Then
		GUICtrlSetData($lblresultvillagesskipped, _NumberFormat($g_iSkippedVillageCount[$CurrentAccount], True))
		GUICtrlSetData($lblResultSkippedHourNow, _NumberFormat($g_iSkippedVillageCount[$CurrentAccount], True))
		$iOldSkippedVillageCount = $g_iSkippedVillageCount[$CurrentAccount]
	EndIf

	If $iOldDroppedTrophyCount <> $g_iDroppedTrophyCount[$CurrentAccount] Then
		GUICtrlSetData($lblresulttrophiesdropped, _NumberFormat($g_iDroppedTrophyCount[$CurrentAccount], True))
		$iOldDroppedTrophyCount = $g_iDroppedTrophyCount[$CurrentAccount]
	EndIf

	If $iOldNbrOfWallsUppedGold <> $g_iNbrOfWallsUppedGold[$CurrentAccount] Then
		GUICtrlSetData($lblWallgoldmake, $g_iNbrOfWallsUppedGold[$CurrentAccount])
		$iOldNbrOfWallsUppedGold = $g_iNbrOfWallsUppedGold[$CurrentAccount]
		WallsStatsMAJ()
	EndIf

	If $iOldNbrOfWallsUppedElixir <> $g_iNbrOfWallsUppedElixir[$CurrentAccount] Then
		GUICtrlSetData($lblWallelixirmake, $g_iNbrOfWallsUppedElixir[$CurrentAccount])
		$iOldNbrOfWallsUppedElixir = $g_iNbrOfWallsUppedElixir[$CurrentAccount]
		WallsStatsMAJ()
	EndIf

	If $iOldNbrOfBuildingsUppedGold <> $g_iNbrOfBuildingsUppedGold[$CurrentAccount] Then
		GUICtrlSetData($lblNbrOfBuildingUpgGold, $g_iNbrOfBuildingsUppedGold[$CurrentAccount])
		$iOldNbrOfBuildingsUppedGold = $g_iNbrOfBuildingsUppedGold[$CurrentAccount]
	EndIf

	If $iOldNbrOfBuildingsUppedElixir <> $g_iNbrOfBuildingsUppedElixir[$CurrentAccount] Then
		GUICtrlSetData($lblNbrOfBuildingUpgElixir, $g_iNbrOfBuildingsUppedElixir[$CurrentAccount])
		$iOldNbrOfBuildingsUppedElixir = $g_iNbrOfBuildingsUppedElixir[$CurrentAccount]
	EndIf

	If $iOldNbrOfHeroesUpped <> $g_iNbrOfHeroesUpped[$CurrentAccount] Then
		GUICtrlSetData($lblNbrOfHeroUpg, $g_iNbrOfHeroesUpped[$CurrentAccount])
		$iOldNbrOfHeroesUpped = $g_iNbrOfHeroesUpped[$CurrentAccount]
	EndIf

	If $iOldSearchCost <> $g_iSearchCost[$CurrentAccount] Then
		GUICtrlSetData($lblSearchCost, _NumberFormat($g_iSearchCost[$CurrentAccount], True))
		$iOldSearchCost = $g_iSearchCost[$CurrentAccount]
	EndIf

	If $iOldTrainCostElixir <> $g_iTrainCostElixir[$CurrentAccount] Then
		GUICtrlSetData($lblTrainCostElixir, _NumberFormat($g_iTrainCostElixir[$CurrentAccount], True))
		$iOldTrainCostElixir = $g_iTrainCostElixir[$CurrentAccount]
	EndIf

	If $iOldTrainCostDElixir <> $g_iTrainCostDElixir[$CurrentAccount] Then
		GUICtrlSetData($lblTrainCostDElixir, _NumberFormat($g_iTrainCostDElixir[$CurrentAccount], True))
		$iOldTrainCostDElixir = $g_iTrainCostDElixir[$CurrentAccount]
	EndIf

	If $iOldNbrOfOoS <> $iNbrOfOoS Then
		GUICtrlSetData($lblNbrOfOoS, $iNbrOfOoS)
		$iOldNbrOfOoS = $iNbrOfOoS
	EndIf

	If $iOldNbrOfTHSnipeFails <> $g_iNbrOfTHSnipeFails[$CurrentAccount] Then
		GUICtrlSetData($lblNbrOfTSFailed, $g_iNbrOfTHSnipeFails[$CurrentAccount])
		$iOldNbrOfTHSnipeFails = $g_iNbrOfTHSnipeFails[$CurrentAccount]
	EndIf

	If $iOldNbrOfTHSnipeSuccess <> $g_iNbrOfTHSnipeSuccess[$CurrentAccount] Then
		GUICtrlSetData($lblNbrOfTSSuccess, $g_iNbrOfTHSnipeSuccess[$CurrentAccount])
		$iOldNbrOfTHSnipeSuccess = $g_iNbrOfTHSnipeSuccess[$CurrentAccount]
	EndIf

	If $iOldGoldFromMines <> $g_iGoldFromMines[$CurrentAccount] Then
		GUICtrlSetData($lblGoldFromMines, _NumberFormat($g_iGoldFromMines[$CurrentAccount], True))
		$iOldGoldFromMines = $g_iGoldFromMines[$CurrentAccount]
	EndIf

	If $iOldElixirFromCollectors <> $g_iElixirFromCollectors[$CurrentAccount] Then
		GUICtrlSetData($lblElixirFromCollectors, _NumberFormat($g_iElixirFromCollectors[$CurrentAccount], True))
		$iOldElixirFromCollectors = $g_iElixirFromCollectors[$CurrentAccount]
	EndIf

	If $iOldDElixirFromDrills <> $g_iDElixirFromDrills[$CurrentAccount] Then
		GUICtrlSetData($lblDElixirFromDrills, _NumberFormat($g_iDElixirFromDrills[$CurrentAccount], True))
		$iOldDElixirFromDrills = $g_iDElixirFromDrills[$CurrentAccount]
	EndIf

	; ============================================================================
	; ================================= SmartZap =================================
	; ============================================================================
	; SmartZap DE Gain
	If $iOldSmartZapGain <> $iSmartZapGain Then
		GUICtrlSetData($lblSmartZapGain, _NumberFormat($iSmartZapGain, True))
		$iOldSmartZapGain = $iSmartZapGain
	EndIf

	; SmartZap Spells Used
	If $iOldNumLSpellsUsed <> $iNumLSpellsUsed Then
		GUICtrlSetData($lblLightningUsed, _NumberFormat($iNumLSpellsUsed, True))
		$iOldNumLSpellsUsed = $iNumLSpellsUsed
	EndIf

	; EarthQuake Spells Used
	If $iOldNumEQSpellsUsed <> $iNumEQSpellsUsed Then
		GUICtrlSetData($lblEarthQuakeUsed, _NumberFormat($iNumEQSpellsUsed, True))
		$iOldNumEQSpellsUsed = $iNumEQSpellsUsed
	EndIf
	; ============================================================================
	; ================================= SmartZap =================================
	; ============================================================================

	$iAttackedCountStatic = 0

	For $i = 0 To $iModeCount

		If $iOldAttackedVillageCount[$i] <> $g_iAttackedVillageCount[$CurrentAccount][$i] Then
			GUICtrlSetData($lblAttacked[$i], _NumberFormat($g_iAttackedVillageCount[$CurrentAccount][$i], True))
			$iOldAttackedVillageCount[$i] = $g_iAttackedVillageCount[$CurrentAccount][$i]
		EndIf
		$iAttackedCountStatic += $g_iAttackedVillageCount[$CurrentAccount][$i]

		If $iOldTotalGoldGain[$i] <> $g_iTotalGoldGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalGoldGain[$i], _NumberFormat($g_iTotalGoldGain[$CurrentAccount][$i], True))
			$iOldTotalGoldGain[$i] = $g_iTotalGoldGain[$CurrentAccount][$i]
		EndIf

		If $iOldTotalElixirGain[$i] <> $g_iTotalElixirGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalElixirGain[$i], _NumberFormat($g_iTotalElixirGain[$CurrentAccount][$i], True))
			$iOldTotalElixirGain[$i] = $g_iTotalElixirGain[$CurrentAccount][$i]
		EndIf

		If $iOldTotalDarkGain[$i] <> $g_iTotalDarkGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalDElixirGain[$i], _NumberFormat($g_iTotalDarkGain[$CurrentAccount][$i], True))
			$iOldTotalDarkGain[$i] = $g_iTotalDarkGain[$CurrentAccount][$i]
		EndIf

		If $iOldTotalTrophyGain[$i] <> $g_iTotalTrophyGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalTrophyGain[$i], _NumberFormat($g_iTotalTrophyGain[$CurrentAccount][$i], True))
			$iOldTotalTrophyGain[$i] = $g_iTotalTrophyGain[$CurrentAccount][$i]
		EndIf

	Next

	If $iOldAttackedCount <> $iAttackedCountStatic Then
		GUICtrlSetData($lblresultvillagesattacked, _NumberFormat($iAttackedCountStatic, True))
		GUICtrlSetData($lblResultAttackedHourNow, _NumberFormat($iAttackedCountStatic, True))
		$iOldAttackedCount = $iAttackedCountStatic
	EndIf

	For $i = 0 To $iModeCount

		If $i = $TS Then ContinueLoop

		If $iOldNbrOfDetectedMines[$i] <> $g_iNbrOfDetectedMines[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedMines[$i], $g_iNbrOfDetectedMines[$CurrentAccount][$i])
			$iOldNbrOfDetectedMines[$i] = $g_iNbrOfDetectedMines[$CurrentAccount][$i]
		EndIf

		If $iOldNbrOfDetectedCollectors[$i] <> $g_iNbrOfDetectedCollectors[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedCollectors[$i], $g_iNbrOfDetectedCollectors[$CurrentAccount][$i])
			$iOldNbrOfDetectedCollectors[$i] = $g_iNbrOfDetectedCollectors[$CurrentAccount][$i]
		EndIf

		If $iOldNbrOfDetectedDrills[$i] <> $g_iNbrOfDetectedDrills[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedDrills[$i], $g_iNbrOfDetectedDrills[$CurrentAccount][$i])
			$iOldNbrOfDetectedDrills[$i] = $g_iNbrOfDetectedDrills[$CurrentAccount][$i]
		EndIf

	Next

	If $FirstAttack = 2 Then
		GUICtrlSetData($lblHourlyStatsGold, _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h")
		GUICtrlSetData($lblHourlyStatsElixir, _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h")
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblHourlyStatsDark, _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h")
		EndIf
		GUICtrlSetData($lblHourlyStatsTrophy, _NumberFormat(Round($g_iTrophyTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h")

		GUICtrlSetData($lblResultGoldHourNow, _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h") ;GUI BOTTOM
		GUICtrlSetData($lblResultElixirHourNow, _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h") ;GUI BOTTOM
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblResultDEHourNow, _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h") ;GUI BOTTOM
		EndIf

	EndIf

	If Number($g_iGoldLast[$CurrentAccount]) > Number($topgoldloot) Then
		$topgoldloot = $g_iGoldLast[$CurrentAccount]
		GUICtrlSetData($lbltopgoldloot, _NumberFormat($topgoldloot))
	EndIf

	If Number($g_iElixirLast[$CurrentAccount]) > Number($topelixirloot) Then
		$topelixirloot = $g_iElixirLast[$CurrentAccount]
		GUICtrlSetData($lbltopelixirloot, _NumberFormat($topelixirloot))
	EndIf

	If Number($g_iDarkLast[$CurrentAccount]) > Number($topdarkloot) Then
		$topdarkloot = $g_iDarkLast[$CurrentAccount]
		GUICtrlSetData($lbltopdarkloot, _NumberFormat($topdarkloot))
	EndIf

	If Number($g_iTrophyLast[$CurrentAccount]) > Number($topTrophyloot) Then
		$topTrophyloot = $g_iTrophyLast[$CurrentAccount]
		GUICtrlSetData($lbltopTrophyloot, _NumberFormat($topTrophyloot))
	EndIf

	If $ResetStats = 1 Then
		$ResetStats = 0
	EndIf

If $ichkSwitchAccount = 1 Then
	UpdateStatsSwitchMode()
EndIf


EndFunc   ;==>UpdateStats

Func ResetStats()
	$ResetStats = 1
	$FirstAttack = 0
	$iTimePassed = 0
	$sTimer = TimerInit()
	GUICtrlSetData($lblresultruntime, "00:00:00")
	GUICtrlSetData($lblResultRuntimeNow, "00:00:00")
	;GUICtrlSetState($lblLastAttackTemp, $GUI_SHOW)
	;GUICtrlSetState($lblLastAttackBonusTemp, $GUI_SHOW)
	;GUICtrlSetState($lblHourlyStatsTemp, $GUI_SHOW)
	If $ichkSwitchAccount = 1 Then
		$g_iGoldStart[9] = $g_iGoldCurrent[$CurrentAccount]
		$g_iElixirStart[9] = $g_iElixirCurrent[$CurrentAccount]
		$g_iDarkStart[9] = $g_iDarkCurrent[$CurrentAccount]
		$g_iTrophyStart[9] = $g_iTrophyCurrent[$CurrentAccount]
		;reset first run conditions SW
		$Init = False
		$FirstInit = True
		
	Else
		$g_iGoldStart[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
		$g_iElixirStart[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
		$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
		$g_iTrophyStart[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]
	EndIf
	
	$g_iGoldTotal[9] = 0
	$g_iElixirTotal[9] = 0
	$g_iDarkTotal[9] = 0
	$g_iTrophyTotal[9] = 0
	$g_iGoldLast[9] = 0
	$g_iElixirLast[9] = 0
	$g_iDarkLast[9] = 0
	$g_iTrophyLast[9] = 0
	$g_iGoldLastBonus[9] = 0
	$g_iElixirLastBonus[9] = 0
	$g_iDarkLastBonus[9] = 0
	$g_iSkippedVillageCount[9] = 0
	$g_iDroppedTrophyCount[9] = 0
	$g_iCostGoldWall[9] = 0
	$g_iCostElixirWall[9] = 0
	$g_iCostGoldBuilding[9] = 0
	$g_iCostElixirBuilding[9] = 0
	$g_iCostDElixirHero[9] = 0
	$g_iNbrOfWallsUppedGold[9] = 0
	$g_iNbrOfWallsUppedElixir[9] = 0
	$g_iNbrOfBuildingsUppedGold[9] = 0
	$g_iNbrOfBuildingsUppedElixir[9] = 0
	$g_iNbrOfHeroesUpped[9] = 0
	$g_iSearchCost[9] = 0
	$g_iTrainCostElixir[9] = 0
	$g_iTrainCostDElixir[9] = 0
	$iNbrOfOoS = 0
	$g_iNbrOfTHSnipeFails[9] = 0
	$g_iNbrOfTHSnipeSuccess[9] = 0
	$g_iGoldFromMines[9] = 0
	$g_iElixirFromCollectors[9] = 0
	$g_iDElixirFromDrills[9] = 0
	; ======================= SmartZap =======================
	$iSmartZapGain = 0
	$iNumLSpellsUsed = 0
	$iNumEQSpellsUsed = 0
	; ======================= SmartZap =======================
	For $i = 0 To $iModeCount
		$g_iAttackedVillageCount[9][$i] = 0
		$g_iTotalGoldGain[9][$i] = 0
		$g_iTotalElixirGain[9][$i] = 0
		$g_iTotalDarkGain[9][$i] = 0
		$g_iTotalTrophyGain[9][$i] = 0
		$g_iNbrOfDetectedMines[9][$i] = 0
		$g_iNbrOfDetectedCollectors[9][$i] = 0
		$g_iNbrOfDetectedDrills[9][$i] = 0
	Next

	For $i = 0 To 28
		$TroopsDonQ[$i] = 0
		GUICtrlSetData($lblDonQ[$i], $TroopsDonQ[$i])
		$TroopsDonXP[$i] = 0
	Next

	GUICtrlSetData($lblTotalTroopsQ, "Total Donated : 0")
	GUICtrlSetData($lblTotalSpellsQ, "Total Donated : 0")
	GUICtrlSetData($lblTotalTroopsXP, "XP Won : 0")
	GUICtrlSetData($lblTotalSpellsXP, "XP Won : 0")

	UpdateStats()
EndFunc   ;==>ResetStats
