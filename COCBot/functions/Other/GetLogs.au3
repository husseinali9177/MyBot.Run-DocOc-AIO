; #FUNCTION# ====================================================================================================================
; Name ..........: GetLogs, LogContain
; Description ...: Get Last Logs / Check if logs contain the Text
; Syntax ........:
; Parameters ....:
; Return values .: None
; Author ........: MR.ViPER (December 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func GetLogs(Const $iLinesCount = 1, Const $bFirstLines = False, Const $bLogFile = False)
	Local $AllLogs = ""
	If $bLogFile = True Then
		; Get Logs from Log file
		$AllLogs = FileRead($hLogFileHandle)
	Else
		; Get Logs from Rich Text Box 'Log' in General Tab
		$AllLogs = _GUICtrlRichEdit_GetText($txtLog, True)
	EndIf

	Local $TheText = ""

	; Split all lines and put each line into this 1D array
	Local $splitedLines = StringSplit($AllLogs, @CRLF)
	If IsArray($splitedLines) Then
		_ArryRemoveBlanks($splitedLines)

		; Determine Line to Start Getting Text From
		Local $iLineToStartLoop = ($bFirstLines = True) ? Number(1) : Number(Number(UBound($splitedLines) - $iLinesCount) - 1)

		; Loop from 'Line To Start' till (Line To Start + Needed Lines Count)
		If IsArray($splitedLines) Then
			For $i = $iLineToStartLoop To (($iLineToStartLoop + $iLinesCount) - 1)
				If $i <= (UBound($splitedLines) - 1) Then
					$TheText &= $splitedLines[$i] & @CRLF
				Else
					ExitLoop
				EndIf
			Next
		EndIf

		Return $TheText
	Else
		Return $AllLogs
	EndIf
EndFunc   ;==>GetLogs

Func LogContain(Const $sSearch, Const $isRegexPattern = False, Const $iLinesCount = 1, Const $bFirstLines = False, Const $bLogFile = False)
	Local $Result = False

	Local $Logs = GetLogs($iLinesCount, $bFirstLines, $bLogFile)

	If $isRegexPattern = True Then
		; If is regex Then Process with Regex
		Local $RegexResult = StringRegExp($Logs, $sSearch)

		If Not @error Then
			; If regex matched Then 'Return True'
			If $RegexResult = 1 Then $Result = True
		Else
			; If Regex Result was SetError (@error) so Pattern is an invalid pattern, 'Return False'
			$Result = False
		EndIf

	Else

		If StringInStr($Logs, $sSearch) > 0 Then $Result = True

	EndIf

	Return $Result
EndFunc   ;==>LogContain
