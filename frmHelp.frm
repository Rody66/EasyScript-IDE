VERSION 5.00
Begin VB.Form frmHelp 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "���� �������� ������"
   ClientHeight    =   2805
   ClientLeft      =   13290
   ClientTop       =   2205
   ClientWidth     =   3330
   BeginProperty Font 
      Name            =   "Book Antiqua"
      Size            =   8.25
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2805
   ScaleWidth      =   3330
   ShowInTaskbar   =   0   'False
   Begin VB.Shape line 
      BackStyle       =   1  '�����������
      FillStyle       =   0  '�������
      Height          =   14
      Left            =   378
      Top             =   2016
      Visible         =   0   'False
      Width           =   1148
   End
   Begin VB.Label lblParam 
      AutoSize        =   -1  'True
      BackStyle       =   0  '���������
      Caption         =   "LBL"
      BeginProperty Font 
         Name            =   "Book Antiqua"
         Size            =   10.5
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   252
      Index           =   0
      Left            =   1638
      TabIndex        =   1
      ToolTipText     =   "������� ����, ����� ������� ������"
      Top             =   1764
      Visible         =   0   'False
      Width           =   392
   End
   Begin VB.Shape frame 
      BorderColor     =   &H00C0C0C0&
      BorderWidth     =   2
      Height          =   518
      Index           =   0
      Left            =   1386
      Top             =   1008
      Visible         =   0   'False
      Width           =   1148
   End
   Begin VB.Label lblFunc 
      AutoSize        =   -1  'True
      BackStyle       =   0  '���������
      Caption         =   "LBL"
      BeginProperty Font 
         Name            =   "Book Antiqua"
         Size            =   13.5
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   322
      Index           =   0
      Left            =   1512
      TabIndex        =   0
      ToolTipText     =   "��������, ����� �������"
      Top             =   1134
      Visible         =   0   'False
      Width           =   518
   End
   Begin VB.Menu mnuActionsHelp 
      Caption         =   "������ �� ����������"
      Visible         =   0   'False
      Begin VB.Menu mnuSelect 
         Caption         =   "&������� ��������"
      End
      Begin VB.Menu mnuActionsInfo 
         Caption         =   "&�������������� ����������"
      End
      Begin VB.Menu mnuClose 
         Caption         =   "&������� ���� �������� ������"
      End
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
'Dim i As Integer, SelectedIndex As Integer
'
'Public Sub ShowHelp(HelpType As Long, Optional Func As String)
'    If NowHelp = Func Then Exit Sub
'    If HelpType = typFunc Then
'        ShowFuncsInfo
'    ElseIf HelpType = typParam Then
'        Select Case Func
'        Case cClick
'            ShowParam 8
'            ShowClickInfo
'        Case cWait
'            ShowParam 2
'            ShowWaitInfo
'        Case cSetCursorPos
'            ShowParam 4
'            ShowSetCursorPosInfo
'        Case Else
'            ShowFuncsInfo
'        End Select
'    End If
'    If Not Me.Visible Then
'        Left = frmMain.Left + frmMain.Width + 100
'        Top = frmMain.Top + 500
'        Show , frmMain
'        If Me.WindowState = 1 Then frmMain.SetFocus
'    End If
'    NowHelp = Func
'End Sub
'
'Sub ShowWaitInfo()
'    lblParam(1).Caption = "1. ����� �������� :: �� ��������� = 1 �������"
'    lblParam(2).Caption = "2. ��������������� �������� �� :: �� ��������� = 0 ��"
'    lblParam(3).Caption = "������: ����� 10 �����, 0"
'End Sub
'
'Sub ShowSetCursorPosInfo()
'    lblParam(1).Caption = "1. ���������� �� ��� X :: �� ��������� = ������� ����������"
'    lblParam(2).Caption = "2. ���������� �� ��� Y :: �� ��������� = ������� ����������"
'    lblParam(3).Caption = "3. �������� ����� ��������� :: �� ��������� = 0"
'    lblParam(4).Caption = "4. �������� ����� �������� :: �� ��������� = 0"
'    lblParam(5).Caption = "������: ����������� ������ 100, 200, 0, 0"
'End Sub
'
'Sub ShowClickInfo()
'    lblParam(1).Caption = "1. ���������� �� ��� X :: �� ��������� = ������� ����������"
'    lblParam(2).Caption = "2. ���������� �� ��� Y :: �� ��������� = ������� ����������"
'    lblParam(3).Caption = "3. ������� (��� �������) :: �� ��������� = ����"
'    lblParam(4).Caption = "4. ������ ���� :: �� ��������� = �����"
'    lblParam(5).Caption = "5. ������� ��� ��������� �������� :: �� ��������� = 1"
'    lblParam(6).Caption = "6. �������� ����� ��������� :: �� ��������� = 0"
'    lblParam(7).Caption = "7. �������� ����� �������� :: �� ��������� = 0"
'    lblParam(8).Caption = "8. ������� ������ �� ������� ����� :: �� ��������� = ��"
'    lblParam(9).Caption = "������: ���� 100, 200, ����, ������, 10, 500, 1000, ��"
'End Sub
'
'
'Sub ShowParam(Optional ParamCount As Long, Optional HideAll As Boolean)
'    Static LastIndex As Integer
'    If HideAll Then
'        For i = 0 To LastIndex
'            lblParam(i).Visible = False
'        Next i
'        Exit Sub
'    End If
'    ShowFuncsInfo True '�������� ��������
'    lblParam(0).Caption = "��������� �������: "
'    lblParam(0).Left = 20
'    lblParam(0).Top = 0
'    lblParam(0).FontItalic = True
'    lblParam(0).FontBold = True
'    lblParam(0).Visible = True
'    For i = 1 To LastIndex
'        lblParam(i).Caption = ""
'    Next i
'    For i = 1 To ParamCount + 1
'        If LastIndex < i Then Load lblParam(i)
'        lblParam(i).Left = 20
'        lblParam(i).Top = i * lblParam(0).Height + 20
'        lblParam(i).Caption = "0"
'        lblParam(i).ForeColor = 0
'        lblParam(i).FontSize = 10
'        lblParam(i).Visible = True
'    Next i
'    If ParamCount + 1 > LastIndex Then LastIndex = ParamCount + 1
'    lblParam(ParamCount + 1).FontSize = 12
'    lblParam(ParamCount + 1).ForeColor = &H8000000D
'    lblParam(0).ForeColor = &H808080
'    lblParam(0).FontItalic = False
'    lblParam(0).FontBold = False
'    Height = (ParamCount + 2) * (lblParam(1).Height + 10) + (Height - ScaleHeight)
'    Width = lblParam(0).Width + 4500
'End Sub
'
'Sub ShowFuncsInfo(Optional HideAll As Boolean)
'    Static LastIndex As Integer
'    If HideAll Then
'        For i = 0 To LastIndex
'            lblFunc(i).Visible = False
'        Next i
'        Exit Sub
'    End If
'    ShowParam , True
'    i = 0
'    lblFunc(i).Caption = "������ ������: "
'    lblFunc(i).Left = 20
'    lblFunc(i).Top = i * lblFunc(0).Height
'    lblFunc(i).FontItalic = True
'    lblFunc(i).FontBold = True
'    lblFunc(i).Visible = True
'    For i = 1 To FuncsCount
'        If LastIndex < i Then Load lblFunc(i)
'        lblFunc(i).Left = 20
'        lblFunc(i).Top = i * lblFunc(0).Height + 20
'        lblFunc(i).Visible = True
'    Next i
'    LastIndex = FuncsCount
'    lblFunc(0).ForeColor = &H808080
'    lblFunc(0).FontItalic = False
'    lblFunc(0).FontBold = False
'    Height = (LastIndex + 1) * (lblFunc(1).Height + 10) + (Height - ScaleHeight)
'    Width = lblFunc(0).Width + 1000
'    lblFunc(1).Caption = ruClick
'    lblFunc(2).Caption = ruWait
'    lblFunc(3).Caption = ruSetCursorPos
'    lblFunc(4).Caption = ruPress
'    lblFunc(5).Caption = ruStartScript
'    lblFunc(6).Caption = ruLoop
'    lblFunc(7).Caption = ruExit
'End Sub
'
'Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
'    For i = 1 To lblFunc.UBound
'        lblFunc(i).ForeColor = 0
'    Next i
'End Sub
'
'Private Sub lblFunc_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
'    If Index > 0 Then
'       For i = 1 To lblFunc.UBound
'            If i <> Index Then lblFunc(i).ForeColor = 0
'       Next i
'       lblFunc(Index).ForeColor = &H8000000D
'    End If
'End Sub
'
'Private Sub lblFunc_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
'    If Button = 1 Then
'        If Index = 0 Then Exit Sub
'        SelectFunc Index
'    ElseIf Button = 2 Then
'        SelectedIndex = Index
'        PopupMenu mnuFuncsHelp
'    End If
'End Sub
'
'Sub SelectFunc(Index As Integer)
'        frmMain.SetFunc lblFunc(Index).Caption
'        frmMain.SetFocus
'End Sub
'
'Private Sub mnuSelect_Click()
'    SelectFunc SelectedIndex
'End Sub
