
; #FUNCTION# ====================================================================================================================
; Name ..........: DebugImageSave
; Description ...: Saves a copy of the current BS image to the Temp Folder for later review
; Syntax ........: DebugImageSave([$TxtName = "Unknown"])
; Parameters ....: $TxtName             - [optional] text string to use as part of saved filename. Default is "Unknown".
; Return values .: None
; Author ........: KnowJack (Aug 2015)
; Modified ......: Sardo (2016-01), MR.ViPER (2016-09)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func DebugImageSave($TxtName = "Unknown", $capturenew = True, $extensionpng = "png", $makesubfolder = True, $sDrawText = "", $iDrawX = 0, $iDrawY = 0, $iDrawSize = 10, $iDrawRX = 0, $iDrawRY = 0, $iDrawRW = 0, $iDrawRH = 0, $RedLineToDraw = Default)

	; Debug Code to save images before zapping for later review, time stamped to align with logfile!
	;SetLog("Taking snapshot for later review", $COLOR_GREEN) ;Debug purposes only :)
	$Date = @MDAY & "." & @MON & "." & @YEAR
	$Time = @HOUR & "." & @MIN & "." & @SEC
	Local $savefolder = $dirTempDebug
	If $makesubfolder = True Then
		$savefolder = $dirTempDebug & $TxtName & "\"
		DirCreate($savefolder)
	EndIf

	Local $extension
	If $extensionpng = "png" Then
		$extension = "png"
	Else
		$extension = "jpg"
	EndIf

	Local $exist = True
	Local $i = 1
	Local $first = True
	Local $filename = ""
	While $exist
		If $first Then
			$first = False
			$filename = $savefolder & $TxtName & $Date & " at " & $Time & "." & $extension
			If FileExists($filename) = 1 Then
				$exist = True
			Else
				$exist = False

			EndIf
		Else
			$filename = $savefolder & $TxtName & $Date & " at " & $Time & " (" & $i & ")." & $extension
			If FileExists($filename) = 1 Then
				$i += 1
			Else
				$exist = False
			EndIf
		EndIf
	WEnd

	If $capturenew Then _CaptureRegion()
	If $sDrawText <> "" Or ($iDrawRX <> 0 Or $iDrawRW <> 0 Or $iDrawRH <> 0) Or $RedLineToDraw <> Default Then
		Local $hBmpTemp = _GDIPlus_BitmapCloneArea($hBitmap, 0, 0, _GDIPlus_ImageGetWidth($hBitmap), _GDIPlus_ImageGetHeight($hBitmap))
		Local $hGraphics = _GDIPlus_ImageGetGraphicsContext($hBmpTemp)
		If $sDrawText <> "" Then
			Local $hBrush = _GDIPlus_BrushCreateSolid(0xFFFFFFFF)
			Local $hFormat = _GDIPlus_StringFormatCreate()
			Local $hFamily = _GDIPlus_FontFamilyCreate("Tahoma")
			Local $hFont = _GDIPlus_FontCreate($hFamily, 12, 2)
			Local $tLayout = _GDIPlus_RectFCreate($iDrawX, $iDrawY, 0, 0)
			Local $aInfo = _GDIPlus_GraphicsMeasureString($hGraphics, String($sDrawText), $hFont, $tLayout, $hFormat)
			_GDIPlus_GraphicsDrawStringEx($hGraphics, String($sDrawText), $hFont, $aInfo[0], $hFormat, $hBrush)
			_GDIPlus_FontDispose($hFont)
			_GDIPlus_FontFamilyDispose($hFamily)
			_GDIPlus_StringFormatDispose($hFormat)
			_GDIPlus_BrushDispose($hBrush)
		EndIf
		If $iDrawRX <> 0 Or $iDrawRW <> 0 Or $iDrawRH <> 0 Then
			_GDIPlus_GraphicsDrawRect($hGraphics, $iDrawRX, $iDrawRY, $iDrawRW, $iDrawRH)
		EndIf
		If $RedLineToDraw <> Default Then	; Draw RedLines
			If StringInStr($RedLineToDraw, "|") > 0 Then
				Local $splitedRedLines = StringSplit($RedLineToDraw, "|", 2)
				Local $tmpSplitedRedLine
				Local $hPenRED = _GDIPlus_PenCreate(0xFFFF0000, 2) ; Create a pencil Color FF0000/RED
				For $i = 0 To (UBound($splitedRedLines) - 1)
					$tmpSplitedRedLine = StringSplit($splitedRedLines[$i], ",", 2)
					_GDIPlus_GraphicsDrawRect($hGraphics, $tmpSplitedRedLine[0] - 2, $tmpSplitedRedLine[1] - 2, 4, 4, $hPenRED)
				Next
			EndIf
		EndIf
		_GDIPlus_ImageSaveToFile($hBmpTemp, $filename)
		_GDIPlus_BitmapDispose($hBmpTemp)
	Else
		_GDIPlus_ImageSaveToFile($hBitmap, $filename)
	EndIf
	If $debugsetlog = 1 Then Setlog($filename, $COLOR_DEBUG) ;Debug

	If _Sleep($iDelayDebugImageSave1) Then Return

EndFunc   ;==>DebugImageSave
