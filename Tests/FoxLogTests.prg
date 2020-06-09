DEFINE CLASS FoxLogTests as FxuTestCase OF FxuTestCase.prg
	#IF .f.
		LOCAL THIS AS FoxLogTests OF FoxLogTests.PRG
	#ENDIF
	
	icTestPrefix = "Test"
	cProcAct = ""
	oLogger = .Null.
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		This.cProcAct = Set("Procedure")
		Set Path To "Src" Additive
		Set Procedure To "FoxLog.prg" Additive
		This.oLogger = CreateObject("Logger", "LogAppender")
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		Local lcProcAct As String
		lcProcAct = This.cProcAct
		This.oLogger.Close()
		This.oLogger = .Null.
		Clear Class Logger
		Release Procedure FoxLog
		If Not Empty(lcProcAct)
			Set Procedure To (lcProcAct)
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(This.oLogger, "Test Failed")
			This.MessageOut("Logger object created successfully")
		Endif
	EndFunc
&& ======================================================================== &&
&& Function TestOpen
&& ======================================================================== &&
	Function TestOpen
		This.oLogger.Open("c:\desarrollo\MyLog.log")
	EndFunc
&& ======================================================================== &&
&& Function TestLogInfo
&& ======================================================================== &&
	Function TestLogInfo
		This.TestOpen()
		This.oLogger.LogInfo("Abecedario: {1},{2},{3},{4},{5},{6},{7},{8},{9},{10}", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
	EndFunc
&& ======================================================================== &&
&& Function TestLogDebug
&& ======================================================================== &&
	Function TestLogDebug
		This.TestOpen()
		This.oLogger.LogDebug("Testing the debug method...")
	EndFunc
&& ======================================================================== &&
&& Function TestLogWarn
&& ======================================================================== &&
	Function TestLogWarn
		This.TestOpen()
		This.oLogger.LogDebug("Testing the warning method...")
	EndFunc
&& ======================================================================== &&
&& Function TestLogError
&& ======================================================================== &&
	Function TestLogError
		This.TestOpen()
		This.oLogger.LogError("Testing the error method...")
	EndFunc
&& ======================================================================== &&
&& Function TestLogException
&& ======================================================================== &&
	Function TestLogException
		This.TestOpen()
		Try
			a = a + b
		Catch to loEx
			This.oLogger.LogException(loEx)
		EndTry
	EndFunc
&& ======================================================================== &&
&& Function TestSecondsPassed
&& ======================================================================== &&
	Function TestSecondsPassed
		This.MessageOut("Starting the test...")
		This.TestOpen()
		Inkey(0.4, "HC")
		This.oLogger.LogError("Testing the error method...")
		Inkey(0.4, "HC")
		This.oLogger.LogInfo("Testing the info method...")
		Inkey(0.4, "HC")
		This.oLogger.LogWarn("Testing the warn method...")
		Inkey(0.4, "HC")
		This.oLogger.LogDebug("Testing the debug method...")
		Inkey(0.4, "HC")
		Try
			a = a + b
		Catch to loEx
			This.oLogger.LogException(loEx)
		EndTry
		This.MessageOut("Test finished...")
	EndFunc
&& ======================================================================== &&
&& Function TestVersion
&& ======================================================================== &&
	Function TestVersion
		This.MessageOut("The Logger version is: " + This.oLogger.GetVersion())
	Endfunc
ENDDEFINE