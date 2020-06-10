&& ======================================================================== &&
&&                                                                          &&
&&                ______        _                                           &&
&&               |  ____|      | |                                          &&
&&               | |__ _____  _| |     ___   __ _                           &&
&&               |  __/ _ \ \/ / |    / _ \ / _` |                          &&
&&               | | | (_) >  <| |___| (_) | (_| |                          &&
&&               |_|  \___/_/\_\______\___/ \__, |                          &&
&&                                           __/ |                          &&
&&                                          |___/                           &&
&& ======================================================================== &&
&& Name:    FoxLog.prg
&& Descrip: Provides the ability to capture the log output into 3
&&          appenders like (file, debug console and messagebox)
&& Author:  <Irwin Rodriguez> rodriguez.irwin@gmail.com
&& Version: 1.0.1
&& ======================================================================== &&
Define Class Logger As Custom
    Hidden oAppender
    Hidden cAppendersName
    Hidden cAppenderClass
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init As Void
        lParameters tcAppenderClass As String
        With This
            .cAppendersName = "ConsoleAppender;LogAppender;MsgAppender"
            .cAppenderClass = tcAppenderClass
            .SetAppender(tcAppenderClass)
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function Destroy
&& ======================================================================== &&
    Function Destroy As Void
        This.oAppender = .Null.
        Try
            lcCommand = "Clear Class " + This.cAppenderClass
            &lcCommand
        Catch
        EndTry
        Try
            lcCommand = "Clear Class iLogger"
            &lcCommand
        Catch
        EndTry
    EndFunc
&& ======================================================================== &&
&& Function Open
&& ======================================================================== &&
    Function Open As Void
        lParameters tcLogFile As String
        This.oAppender.Open(tcLogFile)
    EndFunc
&& ======================================================================== &&
&& Function Close
&& ======================================================================== &&
    Function Close As Void
        This.oAppender.Close()
    EndFunc
&& ======================================================================== &&
&& Function LogInfo
&& ======================================================================== &&
    Function LogInfo As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        This.oAppender.LogInfo(;
        tcLogMsg, ;
        tvParam1, ;
        tvParam2, ;
        tvParam3, ;
        tvParam4, ;
        tvParam5, ;
        tvParam6, ;
        tvParam7, ;
        tvParam8, ;
        tvParam9, ;
        tvParam10)
    EndFunc
&& ======================================================================== &&
&& Function LogDebug
&& ======================================================================== &&
    Function LogDebug As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        This.oAppender.LogDebug(;
        tcLogMsg, ;
        tvParam1, ;
        tvParam2, ;
        tvParam3, ;
        tvParam4, ;
        tvParam5, ;
        tvParam6, ;
        tvParam7, ;
        tvParam8, ;
        tvParam9, ;
        tvParam10)
    EndFunc
&& ======================================================================== &&
&& Function LogWarn
&& ======================================================================== &&
    Function LogWarn As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        This.oAppender.LogWarn(;
        tcLogMsg, ;
        tvParam1, ;
        tvParam2, ;
        tvParam3, ;
        tvParam4, ;
        tvParam5, ;
        tvParam6, ;
        tvParam7, ;
        tvParam8, ;
        tvParam9, ;
        tvParam10)
    EndFunc
&& ======================================================================== &&
&& Function LogError
&& ======================================================================== &&
    Function LogError As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        This.oAppender.LogError(;
        tcLogMsg, ;
        tvParam1, ;
        tvParam2, ;
        tvParam3, ;
        tvParam4, ;
        tvParam5, ;
        tvParam6, ;
        tvParam7, ;
        tvParam8, ;
        tvParam9, ;
        tvParam10)
    EndFunc
&& ======================================================================== &&
&& Function LogException
&& ======================================================================== &&
    Function LogException As Void
        lParameters toEx As Exception
        This.oAppender.LogException(toEx)
    EndFunc
&& ======================================================================== &&
&& Function SetTimeOut
&& ======================================================================== &&
    Function SetTimeOut As Boolean
        lParameters tnTimeOut As Integer
        This.oAppender.nTimeOut = tnTimeOut
    EndFunc
&& ======================================================================== &&
&& Function SetTitle
&& ======================================================================== &&
    Function SetTitle As Boolean
        lParameters tcTitle As String
        This.oAppender.cTitle = tcTitle
    EndFunc
&& ======================================================================== &&
&& Function SetAppender
&& ======================================================================== &&
    Function SetAppender As Boolean
        lParameters tcAppenderClass As String
        Local llCreatedObject As Boolean
        If !Empty(tcAppenderClass) And lower(tcAppenderClass) $ lower(This.cAppendersName)
            This.oAppender = CreateObject(tcAppenderClass)
        Endif
        llCreatedObject = (Type("This.oAppender") == "O")
        Return llCreatedObject
    EndFunc
&& ======================================================================== &&
&& Function GetVersion
&& ======================================================================== &&
    Function GetVersion As String
        Return This.oAppender.Version
    EndFunc
EndDefine
&& ======================================================================== &&
&& Class iLogger
&& ======================================================================== &&
Define Class iLogger As Custom
    #Define CR Chr(13)
    #Define LF Chr(10)
    Hidden lInternalAssignment
    Hidden oFoxString
    lError    = .F.
    cErrorMsg = ""
    Version   = "1.0.1"
    Hidden cLogMsg
    Hidden vParam1
    Hidden vParam2
    Hidden vParam3
    Hidden vParam4
    Hidden vParam5
    Hidden vParam6
    Hidden vParam7
    Hidden vParam8
    Hidden vParam9
    Hidden vParam10
    Hidden cFormattedMsg
    Hidden cLogType
    nSeconds = 0
    nAppStartedSeconds = 0
    Hidden cUserName
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init As Void
        Set Procedure To "FoxStringClass" Additive
        With This
            .oFoxString = CreateObject("StringClass")
            .cUserName = Upper(GetWordNum(Sys(0), 2, "#"))
            .nSeconds = 0
            .nAppStartedSeconds = 0
            .cLogType = ""
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function Destroy
&& ======================================================================== &&
    Function Destroy As Void
        This.oFoxString = .Null.
        Try
        	Clear Class StringClass
        Catch
        EndTry
        Try
        	Release Procedure FoxStringClass
        Catch
        EndTry
    EndFunc
&& ======================================================================== &&
&& Function Open
&& ======================================================================== &&
    Function Open As Void
        lParameters tcLogFile As String
        With This
            .nSeconds = Seconds()
            .nAppStartedSeconds = Seconds()
            .LogInfo("App started")
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function Close
&& ======================================================================== &&
    Function Close As Void
        With This
            Local lnDiffApp As Number
            lnDiffApp = Iif(.nAppStartedSeconds <= 0, 0.000, Seconds() - .nAppStartedSeconds)
            .LogInfo("App finished")
            .cFormattedMsg = "Total time to run: " + ;
            Transform(lnDiffApp, "999.9999999") + " seconds" + CR + LF
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function LogInfo
&& ======================================================================== &&
    Function LogInfo As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        With This
            .cLogMsg = tcLogMsg
            .vParam1 = tvParam1
            .vParam2 = tvParam2
            .vParam3 = tvParam3
            .vParam4 = tvParam4
            .vParam5 = tvParam5
            .vParam6 = tvParam6
            .vParam7 = tvParam7
            .vParam8 = tvParam8
            .vParam9 = tvParam9
            .vParam10 = tvParam10
            .cLogType = "INFO"
            .FormatLogMessage()
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function LogDebug
&& ======================================================================== &&
    Function LogDebug As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        With This
            .cLogMsg = tcLogMsg
            .vParam1 = tvParam1
            .vParam2 = tvParam2
            .vParam3 = tvParam3
            .vParam4 = tvParam4
            .vParam5 = tvParam5
            .vParam6 = tvParam6
            .vParam7 = tvParam7
            .vParam8 = tvParam8
            .vParam9 = tvParam9
            .vParam10 = tvParam10
            .cLogType = "DEBUG"
            .FormatLogMessage()
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function LogWarn
&& ======================================================================== &&
    Function LogWarn As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        With This
            .cLogMsg = tcLogMsg
            .vParam1 = tvParam1
            .vParam2 = tvParam2
            .vParam3 = tvParam3
            .vParam4 = tvParam4
            .vParam5 = tvParam5
            .vParam6 = tvParam6
            .vParam7 = tvParam7
            .vParam8 = tvParam8
            .vParam9 = tvParam9
            .vParam10 = tvParam10
            .cLogType = "WARNING"
            .FormatLogMessage()
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function LogError
&& ======================================================================== &&
    Function LogError As Void
        lParameters ;
        tcLogMsg As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        With This
            .cLogMsg = tcLogMsg
            .vParam1 = tvParam1
            .vParam2 = tvParam2
            .vParam3 = tvParam3
            .vParam4 = tvParam4
            .vParam5 = tvParam5
            .vParam6 = tvParam6
            .vParam7 = tvParam7
            .vParam8 = tvParam8
            .vParam9 = tvParam9
            .vParam10 = tvParam10
            .cLogType = "ERROR"
            .FormatLogMessage()
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function LogException
&& ======================================================================== &&
    Function LogException As Void
        lParameters toEx As Exception
        With This
            .cLogMsg = .oFoxString.Format("Error ({1}) at line # {2}, {3}", toEx.ErrorNo, toEx.LineNo, toEx.Message)
            .cLogType = "EXCEPTION"
            .FormatLogMessage()
            .WriteLog()
        Endwith
    EndFunc
&& ======================================================================== &&
&& Function FormatLogMessage
&& ======================================================================== &&
    Hidden Function FormatLogMessage As Void
        With This
            .cFormattedMsg = .GetLogText(.cLogType, .GetStringFormat())
        EndWith
    EndFunc
&& ======================================================================== &&
&& Hidden Function GetStringFormat
&& ======================================================================== &&
    Hidden Function GetStringFormat As String
        Local lcFormattedText As String
        lcFormattedText = ""
        With This
            lcFormattedText = .oFoxString.Format(;
            .cLogMsg, ;
            .vParam1, ;
            .vParam2, ;
            .vParam3, ;
            .vParam4, ;
            .vParam5, ;
            .vParam6, ;
            .vParam7, ;
            .vParam8, ;
            .vParam9, ;
            .vParam10)
        EndWith
        Return lcFormattedText
    EndFunc
&& ======================================================================== &&
&& Hidden Function GetLogText
&& ======================================================================== &&
    Hidden Function GetLogText As Void
        lParameters tcLogType As String, tcLogContent As String
        Try
            Local ;
            loEx            As Exception, ;
            lcDateAct       As String, ;
            lcCenturyAct    As String, ;
            lcLogText       As String, ;
            lcDate          As String, ;
            lnHourAct       As Integer, ;
            lnDiffApp       As Number, ;
            lnDiffStep      As Number

            lcDateAct 	 = Set("Date")
            lcCenturyAct = Set("Century")
            lnHourAct    = Set("Hours")
            Set Date Italian
            Set Century On
            Set Hours To 24
            lnDiffApp  = Iif(This.nAppStartedSeconds <= 0, 0.000, Seconds() - This.nAppStartedSeconds)
            lnDiffStep = Iif(This.nSeconds <= 0, 0.000, Seconds() - This.nSeconds)
            lcDate     = Alltrim(StrTran(StrTran(Ttoc(Datetime()), "AM"), "PM"))
            lcLogText  = lcDate + ;
            ", (" + Transform(lnDiffApp, "999.9999999") + ;
            " seconds since app started, " + Transform(lnDiffStep, "999.9999999") + ;
            " seconds since last milestone) " + ;
            This.cUserName + space(1) + tcLogType + " - " + ;
            Alltrim(tcLogContent) + chr(13) + chr(10)
        Catch To loEx
            Wait ;
            "ERROR: "   + str(loEx.ErrorNo) + CR + ;
            "MSG: "     + loEx.Message + CR + ;
            "LINE: "    + str(loEx.LineNo) Window Nowait
        Finally
            Set Century &lcCenturyAct
            Set Date &lcDateAct
            Set Hours To &lnHourAct
        Endtry
        Return lcLogText
    EndFunc
&& ======================================================================== &&
&& Hidden Function WriteLog
&& ======================================================================== &&
    Function WriteLog As Void
        * Virtual
    EndFunc
&& ======================================================================== &&
&& Hidden Function SetErrorMsg
&& ======================================================================== &&
    Hidden Function SetErrorMsg As Void
        lParameters tnError As Integer, tcMsg As String
        With This
            .lInternalAssignment = .T.
            .lError = .T.
            .lInternalAssignment = .T.
            .cErrorMsg = "ERROR:" + Alltrim(Str(tnError)) + " - MENSAJE: " + tcMsg
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function lError_Assign
&& ======================================================================== &&
    Function lError_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .lError = m.vNewVal
            Endif
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function cErrorMsg_Assign
&& ======================================================================== &&
    Function cErrorMsg_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .cErrorMsg = m.vNewVal
            Endif
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function Version_Assign
&& ======================================================================== &&
    Function Version_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .Version = m.vNewVal
            Endif
        Endwith
    Endfunc
EndDefine
&& ======================================================================== &&
&& Class LogAppender
&& ======================================================================== &&
Define Class LogAppender As iLogger
    Hidden LogFile
&& ======================================================================== &&
&& Function Open
&& ======================================================================== &&
    Function Open As Void
        lParameters tcLogFile As String
        This.LogFile = evl(tcLogFile, "")
        If Empty(This.LogFile)
            This.LogFile = FullPath(Addbs(Sys(2023)) + sys(2015) + ".log")
        Else
            This.LogFile = Addbs(JustPath(tcLogFile)) + JustStem(tcLogFile) + ".log"
        Endif
        DoDefault(tcLogFile)
    EndFunc
&& ======================================================================== &&
&& Function WriteLog
&& ======================================================================== &&
    Function WriteLog As Void
        If !Empty(This.LogFile)
            Strtofile(This.cFormattedMsg, This.LogFile, .T.)
        Endif
    EndFunc
EndDefine
&& ======================================================================== &&
&& Class MsgAppender
&& ======================================================================== &&
Define Class MsgAppender As iLogger
    nTimeOut = 1
    cTitle = "MessageBox Dialog for Logging purposes..."
&& ======================================================================== &&
&& Function WriteLog
&& ======================================================================== &&
    Function WriteLog As Void
        Local lnMBIcon As Integer
        lnMBIcon = 0
        With This
            Do Case
            Case Inlist(.cLogType, "INFO", "DEBUG")
                lnMBIcon = 64
            Case .cLogType == "WARN"
                lnMBIcon = 48
            Case Inlist(.cLogType, "ERROR", "EXCEPTION")
                lnMBIcon = 16
            EndCase
            MessageBox(.cFormattedMsg, lnMBIcon, .cTitle, .nTimeOut * 1000)
        EndWith
    EndFunc
EndDefine
&& ======================================================================== &&
&& Class ConsoleAppender
&& ======================================================================== &&
Define Class ConsoleAppender As iLogger
    WinDebugOpen = .F.
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init As Void
        DoDefault()
        If Not WVisible("Debug Output")
            Local lcWindow As String
            lcWindow = WOutput()
            Activate Window "DEBUG OUTPUT"
            If Empty(lcWindow)
                Activate Screen
            Else
                Activate Window (lcWindow)
            Endif
        Endif
        This.WinDebugOpen = WVisible("Debug Output")
    EndFunc
&& ======================================================================== &&
&& Function WriteLog
&& ======================================================================== &&
    Function WriteLog As Void
        If This.WinDebugOpen
            DebugOut This.cFormattedMsg
        Endif
    EndFunc
EndDefine