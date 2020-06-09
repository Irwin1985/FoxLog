Define Class TestLogMsgAppender As FxuTestCase Of FxuTestCase.prg
	#If .F.
		Local This As TestLogMsgAppender Of TestLogMsgAppender.prg
	#Endif
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
		This.oLogger = Createobject("Logger", "MsgAppender")
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
	Endfunc
&& ======================================================================== &&
&& Function TestSetTimeOut
&& ======================================================================== &&
	Function TestSetTimeOut
		This.oLogger.SetTimeOut(5)
	Endfunc
&& ======================================================================== &&
&& Function TestSetTitle
&& ======================================================================== &&
	Function TestSetTitle
		This.oLogger.SetTitle("My custom title...")
	Endfunc
&& ======================================================================== &&
&& Function TestOpen
&& ======================================================================== &&
	Function TestOpen
		This.oLogger.Open()
		This.oLogger.SetTimeOut(0)
	Endfunc
&& ======================================================================== &&
&& Function TestLogInfo
&& ======================================================================== &&
	Function TestLogInfo
		This.TestOpen()
		This.oLogger.LogInfo("Testing the info method...")
	Endfunc
&& ======================================================================== &&
&& Function TestLogDebug
&& ======================================================================== &&
	Function TestLogDebug
		This.TestOpen()
		This.oLogger.LogDebug("Testing the debug method...")
	Endfunc
&& ======================================================================== &&
&& Function TestLogWarn
&& ======================================================================== &&
	Function TestLogWarn
		This.TestOpen()
		This.oLogger.LogDebug("Testing the warning method...")
	Endfunc
&& ======================================================================== &&
&& Function TestLogError
&& ======================================================================== &&
	Function TestLogError
		This.TestOpen()
		This.oLogger.Logerror("Testing the error method...")
	Endfunc
&& ======================================================================== &&
&& Function TestLogException
&& ======================================================================== &&
	Function TestLogException
		This.TestOpen()
		Try
			a = a + b
		Catch To loEx
			This.oLogger.LogException(loEx)
		Endtry
	Endfunc
&& ======================================================================== &&
&& Function TestSecondsPassed
&& ======================================================================== &&
	Function TestSecondsPassed
		This.MessageOut("Starting the test...")
		This.TestOpen()
		Inkey(0.4, "HC")
		This.oLogger.Logerror("Testing the error method...")
		Inkey(0.4, "HC")
		This.oLogger.LogInfo("Testing the info method...")
		Inkey(0.4, "HC")
		This.oLogger.LogWarn("Testing the warn method...")
		Inkey(0.4, "HC")
		This.oLogger.LogDebug("Testing the debug method...")
		Inkey(0.4, "HC")
		Try
			a = a + b
		Catch To loEx
			This.oLogger.LogException(loEx)
		Endtry
		This.MessageOut("Test finished...")
	Endfunc
&& ======================================================================== &&
&& Function TestVersion
&& ======================================================================== &&
	Function TestVersion
		This.MessageOut("The Logger version is: " + This.oLogger.GetVersion())
	Endfunc
Enddefine