; #FUNCTION# ====================================================================================================================
; Name ..........: Laboratory
; Description ...:
; Syntax ........: LabStatus()
; Parameters ....:
; Return values .: True or False
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func LabStatus()

	If $aLabPos[0] = 0 Or $aLabPos[1] = 0 Then
		SetLog("Laboratory Location not found!", $COLOR_ERROR)
		LocateLab() ; Lab location unknown, so find it.
		If $aLabPos[0] = 0 Or $aLabPos[1] = 0 Then
			SetLog("Problem locating Laboratory, train laboratory position before proceeding", $COLOR_ERROR)
			Return False
		EndIf
	EndIf

	If $sLabUpgradeTime <> "" Then $TimeDiff = _DateDiff("n", _NowCalc(), $sLabUpgradeTime) ; what is difference between end time and now in minutes?
	If @error Then _logErrorDateDiff(@error)
	If $debugSetlog = 1 Then SetLog($aLabTroops[$icmbLaboratory][3] & " Lab end time: " & $sLabUpgradeTime & ", DIFF= " & $TimeDiff, $COLOR_DEBUG)

	If $RunState = False Then Return
	If $TimeDiff <= 0 Then
		Return True
	Else
		Return False
	EndIf
EndFunc

