VERSION 5.00
Begin VB.Form frmPSettings 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "��������� ���������"
   ClientHeight    =   7260
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   7320
   BeginProperty Font 
      Name            =   "Book Antiqua"
      Size            =   9.75
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "PSettings"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7260
   ScaleWidth      =   7320
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame frameHotkeys 
      Caption         =   "��������� ������� ������ (HotKeys)"
      Height          =   1400
      Left            =   0
      TabIndex        =   5
      Top             =   1800
      Width           =   7322
      Begin VB.ComboBox execKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   1
         ItemData        =   "frmPSettings.frx":0000
         Left            =   3150
         List            =   "frmPSettings.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   25
         Top             =   360
         Width           =   1022
      End
      Begin VB.ComboBox recKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   2
         ItemData        =   "frmPSettings.frx":002B
         Left            =   4410
         List            =   "frmPSettings.frx":003E
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   882
         Width           =   1022
      End
      Begin VB.ComboBox recKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   3
         ItemData        =   "frmPSettings.frx":005E
         Left            =   5670
         List            =   "frmPSettings.frx":0071
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   882
         Width           =   1022
      End
      Begin VB.ComboBox recKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   1
         ItemData        =   "frmPSettings.frx":0091
         Left            =   3150
         List            =   "frmPSettings.frx":00A1
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   882
         Width           =   1022
      End
      Begin VB.ComboBox execKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   3
         ItemData        =   "frmPSettings.frx":00BC
         Left            =   5670
         List            =   "frmPSettings.frx":00CC
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   378
         Width           =   1022
      End
      Begin VB.ComboBox execKey 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   2
         ItemData        =   "frmPSettings.frx":00E7
         Left            =   4410
         List            =   "frmPSettings.frx":00F7
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   378
         Width           =   1022
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   13.5
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   294
         Index           =   3
         Left            =   4200
         TabIndex        =   16
         Top             =   882
         Width           =   154
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   13.5
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   294
         Index           =   4
         Left            =   5460
         TabIndex        =   15
         Top             =   882
         Width           =   154
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   13.5
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   294
         Index           =   2
         Left            =   5460
         TabIndex        =   10
         Top             =   378
         Width           =   154
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "���������\���������� ������:"
         Height          =   252
         Left            =   126
         TabIndex        =   8
         Top             =   882
         Width           =   2842
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   13.5
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   294
         Index           =   0
         Left            =   4200
         TabIndex        =   7
         Top             =   378
         Width           =   154
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "���������\���������� ������:"
         Height          =   252
         Left            =   126
         TabIndex        =   6
         Top             =   378
         Width           =   2884
      End
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   6900
      TabIndex        =   20
      Top             =   6840
      Width           =   300
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "������"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   5760
      TabIndex        =   18
      Top             =   6840
      Width           =   1022
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "������"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   4680
      TabIndex        =   17
      ToolTipText     =   "������� ���������"
      Top             =   6840
      Width           =   1022
   End
   Begin VB.Frame frameCommon 
      Caption         =   "����� ���������"
      Height          =   3555
      Left            =   0
      TabIndex        =   21
      Top             =   3240
      Width           =   7322
      Begin VB.CheckBox chkLog 
         Caption         =   "����� ��� - Log.txt"
         BeginProperty Font 
            Name            =   "Book Antiqua"
            Size            =   9.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   31
         Top             =   3240
         Width           =   2145
      End
      Begin VB.CheckBox chkMinimizeOnRecord 
         Caption         =   "����������� ���� ��������� ��� ������ �������"
         Height          =   195
         Left            =   120
         TabIndex        =   30
         Top             =   2880
         Value           =   1  '��������
         Width           =   5100
      End
      Begin VB.CheckBox chkShowButtons 
         Caption         =   "���������� ���� ������� ������� ������"
         Height          =   195
         Left            =   120
         TabIndex        =   29
         Top             =   1800
         Value           =   1  '��������
         Width           =   4380
      End
      Begin VB.CheckBox chkMaximize 
         Caption         =   "�������� ���� ��������� ����� ���������� �������"
         Height          =   195
         Left            =   120
         TabIndex        =   28
         Top             =   2520
         Value           =   1  '��������
         Width           =   5340
      End
      Begin VB.CheckBox chkMinimize 
         Caption         =   "����������� ���� ��������� ��� ������� �������"
         Height          =   195
         Left            =   120
         TabIndex        =   27
         Top             =   2160
         Value           =   1  '��������
         Width           =   5100
      End
      Begin VB.CheckBox chkShowMarker 
         Caption         =   "���������� ������ ���������"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   1080
         Value           =   1  '��������
         Width           =   3180
      End
      Begin VB.CheckBox chkShowDebug 
         Caption         =   "��������� ����� ���� �������"
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Top             =   1440
         Value           =   1  '��������
         Width           =   3180
      End
      Begin VB.CheckBox chkShowTextTT 
         Caption         =   "���������� ��������� �� ���������� ������"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   720
         Value           =   1  '��������
         Width           =   4500
      End
      Begin VB.CheckBox chkShowListTT 
         Caption         =   "���������� ���������� ������ ���������"
         BeginProperty Font 
            Name            =   "Book Antiqua"
            Size            =   9.75
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   120
         TabIndex        =   22
         Top             =   360
         Value           =   1  '��������
         Width           =   4980
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00808080&
         X1              =   120
         X2              =   7200
         Y1              =   2040
         Y2              =   2040
      End
   End
   Begin VB.Frame frameRec 
      Caption         =   "��������� ������ �������"
      Height          =   1770
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7322
      Begin VB.CheckBox chkRecByWindow 
         Caption         =   "����������� ��������� ������������ ����"
         Height          =   182
         Left            =   126
         TabIndex        =   19
         Top             =   1386
         Width           =   4676
      End
      Begin VB.CheckBox chkReturnCursor 
         Caption         =   "���������� ������ �� ����� (������� �����)"
         Height          =   182
         Left            =   126
         TabIndex        =   4
         Top             =   1008
         Value           =   1  '��������
         Width           =   4676
      End
      Begin VB.TextBox txtUpdateMousePosInterval 
         Alignment       =   2  '���������
         BeginProperty Font 
            Name            =   "Book Antiqua"
            Size            =   9
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   294
         Left            =   4200
         MaxLength       =   4
         TabIndex        =   3
         Text            =   "100"
         Top             =   600
         Width           =   518
      End
      Begin VB.CheckBox chkRecCursor 
         Caption         =   "���������� ������������ �������"
         Height          =   182
         Left            =   126
         TabIndex        =   1
         Top             =   378
         Value           =   1  '��������
         Width           =   3668
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  '���������
         Caption         =   "������� ���������� ��������� �������:"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   2
         Top             =   630
         Width           =   3705
      End
   End
End
Attribute VB_Name = "frmPSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'PSettings - Programm Settings
Option Explicit

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdHelp_Click()
    ShowHelp "��������� ���������"
End Sub

Private Sub cmdSave_Click()
    ResetCommandLine
    Me.Hide
    SaveSettings
    If chkShowButtons.Value = 0 Then
        If frmButtons.Visible Then Unload frmButtons
    Else
        If frmButtons.Visible = False Then frmButtons.Show , frmMain
    End If
End Sub

Private Sub Form_Load()
    SetNumericStyle txtUpdateMousePosInterval.hwnd
    SetBackColor Me, txtUpdateMousePosInterval.hwnd, execKey(1).hwnd, execKey(2).hwnd, execKey(3).hwnd, recKey(1).hwnd, recKey(2).hwnd, recKey(3).hwnd
    AddKeysToList execKey(1), execKey(2), execKey(3), recKey(1), recKey(2), recKey(3)
    LoadSettings lsmPSettings
End Sub
