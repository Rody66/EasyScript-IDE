Attribute VB_Name = "mdlMath"
Option Explicit
Option Compare Text
Dim n As Long, MathSkipErrors As Boolean, blnError As Boolean

Public Const Pi = 3.14159265358979

Const Plus = "+"
Const Minus = "-"
Const Mult = "*"
Const Div = "/"
Const Extent = "^"
Const iSin = "sin("
Const iCos = "cos("
Const iTan = "tan("
Const iCtn = "ctn("
Const iSqr = "sqr("
Const iRnd = "rnd"
Const iAbs = "abs("
Const iPi = "pi"

' ���������� ��������
Public Const loOR = "OR", loAND = "AND", loNOT = "NOT", loEQV = "=", loNOTEQV = "!="

Public Const GetLeft = 1, GetRight = 2

Function Calculate(ByVal strExpression As String, Optional SkipErrors As Boolean) As Variant   ', VarsNamesArr() As String, VarsValsArr() As String) As Variant   '----------------------- 1 --------------------------
    Dim s As String, BracketStart As Long, BracketEnd As Long, strTmpFunc As String, _
    Result As String, CustomFunction As String, blnExtent As Boolean, blnSaveBracket As Boolean, OriginalExpression As String
    MathSkipErrors = SkipErrors Or Settings.bSkipErrors
    If MathSkipErrors Then On Error GoTo lSkip Else On Error GoTo ErrHandler
    AddStage "������������� ���. ��������� - ������� ������"
    OriginalExpression = strExpression
    'ConvertXFactor strExpression
    UpdateExpression strExpression
    If InStr(1, strExpression, "(") > 0 Then
        If GetCount(ReplaceInQuotesSTR(strExpression, "(", ""), "(") <> GetCount(ReplaceInQuotesSTR(strExpression, ")", ""), ")") Then Err.Raise ErrNum, , "������� ���������� ������"
    End If
    If InStr(1, strExpression, "|") Then ConvertModule strExpression
    If blnError Then GoTo lEnd
    Do While IsNumeric(strExpression) = False Or InStr(1, strExpression, "(") > 0
        AddStage "������������� ���. ��������� - ������� ������"
        blnExtent = False
        blnSaveBracket = False
        BracketStart = InStrRev(strExpression, "(") ' <-------------------------
        If BracketStart = 0 Then '��������� ��������
            strExpression = LiteCalculate(strExpression)
            Exit Do
        End If
        BracketEnd = InStr(BracketStart, strExpression, ")") ' ---------------------------->
        strTmpFunc = Mid$(strExpression, BracketStart + 1, BracketEnd - (BracketStart + 1))
        If Mid$(strExpression, BracketEnd + 1, 1) = Extent Then
            If IsNumeric(strTmpFunc) Then
                BracketEnd = BracketEnd + Len(GetNum(strExpression, BracketEnd + 1, GetRight))
                strTmpFunc = Mid$(strExpression, BracketStart, BracketEnd - BracketStart + 2)
                blnExtent = True
            Else
                blnSaveBracket = True
            End If
        End If
        Result = LiteCalculate(strTmpFunc)
        If blnError Then Exit Do
        If BracketStart > 3 Then CustomFunction = Mid$(strExpression, BracketStart - 3, 4) Else CustomFunction = ""
        Select Case CustomFunction
            Case iSin
                Result = Any2Str(sIn(Result))
                ReplaceFunc strExpression, BracketStart, BracketEnd, Result
            Case iCos
                Result = Any2Str(Cos(Result))
                ReplaceFunc strExpression, BracketStart, BracketEnd, Result
            Case iTan
                Result = Any2Str(Tan(Result))
                ReplaceFunc strExpression, BracketStart, BracketEnd, Result
            Case iSqr
                Result = Any2Str(Sqr(Result))
                ReplaceFunc strExpression, BracketStart, BracketEnd, Result
            Case iAbs
                Result = Any2Str(Abs(Result))
                ReplaceFunc strExpression, BracketStart, BracketEnd, Result
            Case Else
                If blnSaveBracket Then
                    strExpression = Replace(strExpression, Mid$(strExpression, BracketStart, BracketEnd - BracketStart + 1), "(" & Result & ")")
                ElseIf blnExtent Then
                    strExpression = Replace(strExpression, Mid$(strExpression, BracketStart, BracketEnd - BracketStart + 2), Result)
                Else
                    strExpression = Replace(strExpression, Mid$(strExpression, BracketStart, BracketEnd - BracketStart + 1), Result)
                End If
        End Select
        DoEvents
        If blnError Or (Not blnExecuting) Then Exit Do
        UpdateExpression strExpression
    Loop
lEnd:
    If Not IsNumeric(strExpression) And MathSkipErrors Then strExpression = OriginalExpression
    Calculate = strExpression
    blnError = False
Exit Function
lSkip:
    ADL "�������� ���. ���������"
    Calculate = OriginalExpression
    blnError = False
Exit Function
ErrHandler:
    blnError = False
    GlobalError.Description = "������ ��� ������� ����� �������� ���. ���������"
    GlobalError.Expression = strExpression
    Call GlobalErrorHandler
End Function

'Sub ConvertXFactor(strExpression As String) '��������� ����.. 2�, 3�, 100� � ��. Factor - ���������
'    Dim n As Long, Factor As Variant, StartPos As Long
'    n = InStr(1, strExpression, "x")
'    If n < 2 Then Exit Sub
'    Do While IsNumeric(Mid$(strExpression, n - 1, 1))
'        GetFirstNum Factor, StartPos, strExpression, n
'        strExpression = Replace(strExpression, Mid$(strExpression, StartPos, (n - StartPos) + 1), Any2Str(Factor) & "*x")
'        n = InStr(n + 1, strExpression, "x")
'    Loop
'End Sub

Sub ConvertModule(strExpression As String)
    Dim ModuleStart As Long, ModuleEnd As Long, i As Long
    If MathSkipErrors Then
        On Error GoTo lSkip
    Else
        On Error GoTo ErrHandler
    End If
    'AddStage "����������� ������ � ���������� ���"
    Do While InStr(ModuleEnd + 1, strExpression, "|")
        ModuleStart = InStr(ModuleEnd + 1, strExpression, "|")
        ModuleEnd = InStr(ModuleStart + 1, strExpression, "|")
        strExpression = Mid$(strExpression, 1, ModuleStart - 1) & Replace(strExpression, "|", iAbs, ModuleStart, 1)
        strExpression = Mid$(strExpression, 1, ModuleStart + 3 + (ModuleEnd - ModuleStart) - 1) & Replace(strExpression, "|", ")", 4 + ModuleEnd - 1, 1)
    Loop
Exit Sub
lSkip:
    ADL "���������� �������������� ������"
    blnError = True
Exit Sub
ErrHandler:
    blnError = True
    GlobalError.Description = "������ ��� ������� ���������� ����������� ������ �����"
    GlobalError.Expression = strExpression
    Call GlobalErrorHandler
End Sub

Sub ReplaceFunc(ByRef strExpression As String, ByVal BracketStart As Long, ByVal BracketEnd As Long, ByVal Result As String)
    If MathSkipErrors Then
        On Error GoTo lSkip
    Else
        On Error GoTo ErrHandler
    End If
    strExpression = Replace(strExpression, Mid$(strExpression, BracketStart - 3, BracketEnd - BracketStart + 1 + 3), Result)
Exit Sub
lSkip:
    ADL "���������� �������� ������� ������"
    blnError = True
Exit Sub
ErrHandler:
    blnError = True
    GlobalError.Description = "������ ��� ������� �������� ������� ������"
    GlobalError.Expression = strExpression
    Call GlobalErrorHandler
End Sub

Function LiteCalculate(strExpression As String) As String   '--------------------- 2 -------------------
    Dim s As String, n As Long, Pos1 As Long, Pos2 As Long, Num1 As Double, Num2 As Double, Result As String, Operation As String, i As Long
    If MathSkipErrors Then
        On Error GoTo lSkip
    Else
        On Error GoTo ErrHandler
    End If
    AddStage "������������� ���. ��������� - �������������� ������"
    If IsNumeric(strExpression) Then GoTo iEnd
    n = 2
    Do While n > 1
        'level 0 - ^
        Operation = Extent
        n = InStr(1, strExpression, Operation) ' ^
        If n > 1 Then GoTo Calculate
        'level 1 - ����� * � /
        For n = 2 To Len(strExpression)
            s = Mid$(strExpression, n, 1)
            Operation = Mult
            If s = Operation Then GoTo Calculate
            Operation = Div
            If s = Operation Then GoTo Calculate
        Next n
        'level 2 - ����� + � -
        For n = 2 To Len(strExpression)
            s = Mid$(strExpression, n, 1)
            If LCase(Mid$(strExpression, n - 1, 1)) <> "e" And IsNumeric(Mid(strExpression, n - 1, 1)) Then '�������� �� ������� ����� � �� ������
                Operation = Plus
                If s = Operation Then GoTo Calculate
                Operation = Minus
                If s = Operation Then GoTo Calculate
            End If
        Next n
    Exit Do
Calculate:
        AddStage "������������� ���. ��������� - �������������� ������"
        If n > 1 Then
            Num1 = GetNum(strExpression, n, 1, Operation, Pos1) ' �������� ����� � ������� ������ �����
            Num2 = GetNum(strExpression, n, 2, Operation, Pos2) ' �������� ����� � ������� ������� �����
            Select Case Operation
                Case Extent ' ^
                    Result = Num1 ^ Num2
                Case Mult ' *
                    Result = Num1 * Num2
                Case Div ' /
                    Result = Num1 / Num2
                Case Plus ' +
                    Result = Num1 + Num2
                Case Minus ' -
                    Result = Num1 - Num2
            End Select
            Result = Any2Str(Result)
            If Sgn(Result) = 1 And Pos1 > 1 Then
                strExpression = AccurateReplace(strExpression, "+" & Result, Pos1, Pos2) 'Replace(strExpression, Mid$(strExpression, Pos1, Pos2 - Pos1), "+" & Result) '+
            Else
                strExpression = AccurateReplace(strExpression, Result, Pos1, Pos2) 'Replace(strExpression, Mid$(strExpression, Pos1, Pos2 - Pos1), Result) '-
            End If
        End If
        UpdateExpression strExpression
        If IsNumeric(strExpression) Then Exit Do
    Loop
iEnd:
    LiteCalculate = Any2Str(strExpression)
Exit Function
lSkip:
    ADL "���������� ������� ������"
    blnError = True
Exit Function
ErrHandler:
    blnError = True
    GlobalError.Description = "������ ��� ������� ���������� ���������� ���. �������"
    GlobalError.Expression = strExpression
    Call GlobalErrorHandler
End Function

Sub ConvertBracket(strExpression As String)
    If InStr(1, strExpression, "(") = 0 Or Len(strExpression) < 3 Then Exit Sub
    If IsNumeric(Mid(strExpression, 2, Len(strExpression) - 2)) Then strExpression = Mid$(strExpression, 2, Len(strExpression) - 2) '����������� �� ������, ������� ���� ���� �������
End Sub

Sub UpdateExpression(ByRef strExpression As String)
    strExpression = LCase(strExpression)
    strExpression = Replace(strExpression, " ", "")
    strExpression = Replace(strExpression, ".", ",")
    strExpression = Replace(strExpression, "\", Div)
    strExpression = Replace(strExpression, ":", Div)
    strExpression = Replace(strExpression, "������(", iAbs)
    strExpression = Replace(strExpression, "�������(", iCos)
    strExpression = Replace(strExpression, "���(", iSin)
    strExpression = Replace(strExpression, "�����(", iSin)
    strExpression = Replace(strExpression, "���(", iCos)
    strExpression = Replace(strExpression, "Tg(", iTan)
    strExpression = Replace(strExpression, "���(", iTan)
    strExpression = Replace(strExpression, "�������(", iTan)
    strExpression = Replace(strExpression, "CTg(", iCtn)
    strExpression = Replace(strExpression, "CTan(", iCtn)
    strExpression = Replace(strExpression, "CoTg(", iCtn)
    strExpression = Replace(strExpression, "CoTan(", iCtn)
    strExpression = Replace(strExpression, "���������(", iCtn)
    strExpression = Replace(strExpression, "������(", iSqr)
    strExpression = Replace(strExpression, "Sqrt(", iSqr)
    strExpression = Replace(strExpression, "��", iPi)
    strExpression = Replace(strExpression, iPi, Pi)
    If InStr(1, strExpression, "Rnd") Then strExpression = Replace(strExpression, "Rnd", Rnd) 'Random
    strExpression = Replace(strExpression, "++", "+")
    strExpression = Replace(strExpression, "+-", "-")
    strExpression = Replace(strExpression, "-+", "-")
    strExpression = Replace(strExpression, "--", "+")
    strExpression = Replace(strExpression, "/+", "/")
    strExpression = Replace(strExpression, "+/", "/")
    strExpression = Replace(strExpression, "+:", "/")
    strExpression = Replace(strExpression, ":+", "/")
    strExpression = Replace(strExpression, "*+", "*")
    strExpression = Replace(strExpression, "+*", "*")
    strExpression = Replace(strExpression, "+^", "^")
    strExpression = Replace(strExpression, "^+", "^")
End Sub

Function GetNum(line As String, OperationPos As Long, Side As Long, Optional Operation As String, Optional ByRef GetPosTo As Long) As Variant
    Dim tmp As String, RightSideStart As Long, NextOperationMet As Boolean, LeftSideEnd As Long, IsExtent As Boolean
    If MathSkipErrors Then
        On Error GoTo lSkip
    Else
        On Error GoTo ErrHandler
    End If
    AddStage "����������� ���������"
    If Side = GetLeft Then
        ' ����� �������
        LeftSideEnd = OperationPos '- 1
        For n = 1 To Len(line)
            GetPosTo = LeftSideEnd - n '+ 1
            If LeftSideEnd - n <= 1 Then
                tmp = Mid(line, 1, LeftSideEnd - 1)
                GoTo ReturnVal
            End If
            tmp = Mid$(line, LeftSideEnd - n, n)
            NextOperationMet = CBool(Not IsNumeric(Mid$(line, LeftSideEnd - n - 1, 1)) _
            And Mid$(line, LeftSideEnd - n - 1, 1) <> "e" _
            And Left$(tmp, 1) <> "e" _
            And Mid$(line, LeftSideEnd - n - 1, 1) <> "," _
            And Left$(tmp, 1) <> "," _
            And Mid$(line, LeftSideEnd - n - 1, 1) <> ")" _
            And Mid$(line, LeftSideEnd - n - 1, 1) <> "-" _
            Or (Left$(tmp, 1) = "-" And Mid$(line, LeftSideEnd - n - 1, 1) <> "e"))
            If NextOperationMet Or IsExtent Then
ReturnVal:
                If Right$(tmp, 1) = ")" And Operation = Extent Then
                    tmp = Mid(tmp, 1, Len(tmp) - 1)
                    GetPosTo = GetPosTo - 1 '����� ��������� ������ ���� ��������������
                ElseIf tmp < 0 And Operation = Extent Then
                    GetPosTo = GetPosTo + 1 '����� �������� �����
                    tmp = Abs(tmp)
                End If
                GetNum = tmp
                Exit Function  ' ���� ����� �������� - ����� �� �������
            End If
        Next n
    Else
        ' ������ �������
        RightSideStart = OperationPos + 1
        For n = 1 To Len(line)
            GetPosTo = RightSideStart + n - 1
            tmp = Mid$(line, RightSideStart, n)
            NextOperationMet = CBool(Not IsNumeric(Mid$(line, RightSideStart + n, 1)) _
            And Mid$(line, RightSideStart + n - 1, 1) <> "e" _
            And Mid$(line, RightSideStart + n, 1) <> "e" _
            And Mid$(line, RightSideStart + n, 1) <> "," _
            And Mid$(line, RightSideStart + n, 1) <> ".")
            If (RightSideStart + n - 1 = Len(line) Or NextOperationMet) And IsNumeric(tmp) Then
                GetNum = tmp
                Exit Function ' ���� ����� �������� - ����� �� �������
            End If
        Next n
    End If
Exit Function
lSkip:
    ADL "���������� ����� �������"
    blnError = True
Exit Function
ErrHandler:
    blnError = True
    GlobalError.Description = "������ ��� ������� ����� �������� " & IIf(Side = GetLeft, "������", "�������") & " ��������"
    GlobalError.Expression = line
    Call GlobalErrorHandler
End Function

