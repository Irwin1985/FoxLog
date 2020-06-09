&& ======================================================================== &&
&& Name:    FoxStringClass.prg
&& Descrip: Provides a set of built-in function for string management
&& Author:  <Irwin Rodriguez> rodriguez.irwin@gmail.com
&& Version: 1.0.1
&& ======================================================================== &&
&& ======================================================================== &&
&& Default code snippet when user performs: do FoxStringClass.prg
&& ======================================================================== &&
Set Procedure To "FoxStringClass" Additive
If Type("String") = "U"
    PUBLIC String As StringClass
Endif
String = CreateObject("StringClass")

&& ======================================================================== &&
&& NewString constructor class for creating the StringClass
&& ======================================================================== &&
Function NewString(tcString As Memo) As StringClass
    tcString = evl(tcString, "")
    Return CreateObject("StringClass", tcString)
EndFunc
&& ======================================================================== &&
&& Class StringClass
&& ======================================================================== &&
Define Class StringClass As Custom
    Hidden lInternalAssignment
    lError    = .F.
    cErrorMsg = ""
    Version   = "1.0.1"
    Protected aParams[1]
    Hidden nParamCounter
    Hidden cString
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init As Void
        lParameters tcString As String
        This.nParamCounter = 0
        This.cString = evl(tcString, "")
    EndFunc
&& ======================================================================== &&
&& Function Length
&& ======================================================================== &&
    Function Length As Integer
        Local lnLength As Integer
        lnLength = 0
        If Type("This.cString") = "C"
            lnLength = len(This.cString)
        Endif
        Return lnLength
    EndFunc
&& ======================================================================== &&
&& Function Format
&& ======================================================================== &&
    Function Format As String
        lParameters ;
        tcString As String, ;
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
        Local lcResult As String
        lcResult = ""
        With This
            If !Empty(tcString)
                .nParamCounter = 0
                For i = 1 To 10
                    .IncrementArray()
                    .aParams[.nParamCounter] = evaluate("tvParam" + alltrim(str(i)))
                EndFor
                Return .ParseString(tcString)
            Endif
        Endwith
        Return lcResult
    EndFunc
&& ======================================================================== &&
&& Hidden Function ParseString
&& ======================================================================== &&
    Hidden Function ParseString As Void
        lParameters tcString As String
        #Define OPEN_BRACKET "{"
        #Define CLOSE_BRACKET "}"

        Local lnTotal As Integer, lcReplaceStr As String, lcExtractedStr As String, lcFinalStr As String
        lnTotal = Occurs(OPEN_BRACKET, tcString)
        Store "" To lcReplaceStr, lcExtractedStr
        lcFinalStr = tcString
        If lnTotal > 0
            For i = 1 to lnTotal
                lcExtractedStr = StrExtract(tcString, OPEN_BRACKET, CLOSE_BRACKET, i)
                lcReplaceStr = OPEN_BRACKET + lcExtractedStr + CLOSE_BRACKET
                lcFinalStr = StrTran(lcFinalStr, lcReplaceStr, Transform(This.aParams[val(lcExtractedStr)]))
            EndFor
        Endif
        Return lcFinalStr
    EndFunc
&& ======================================================================== &&
&& Hidden Function IncrementArray
&& ======================================================================== &&
    Hidden Function IncrementArray As Void
        With This
            .nParamCounter = .nParamCounter + 1
            Dimension .aParams[.nParamCounter]
        Endwith
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