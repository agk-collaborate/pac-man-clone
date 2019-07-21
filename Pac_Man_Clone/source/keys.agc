
/*
AUTHOR:
	IronManhood
	
DATE:
	last updated 2018-07-01
	
PURPOSE:
	Written for standard includes.

DOCUMENTATION:
	Key related constants.

FUNCTIONS:
	none
	
EXAMPLE:
	N/A
*/
//~ constant declarations
#constant KEY_LMB	1
#constant KEY_RMB	2
#constant KEY_MMB	3

#constant KEY_BACKSPACE	8
#constant KEY_TAB		9
#constant KEY_ENTER		13
#constant KEY_SHIFT		16
#constant KEY_CONTROL	17
#constant KEY_ALT		18
#constant KEY_ESCAPE	27
#constant KEY_SPACE		32
#constant KEY_PAGEUP	33
#constant KEY_PAGEDOWN	34
#constant KEY_END		35
#constant KEY_HOME		36
#constant KEY_LEFT		37
#constant KEY_UP		38
#constant KEY_RIGHT		39
#constant KEY_DOWN		40
#constant KEY_INSERT	45
#constant KEY_DELETE	46
#constant KEY_0		48
#constant KEY_1		49
#constant KEY_2		50
#constant KEY_3		51
#constant KEY_4		52
#constant KEY_5		53
#constant KEY_6		54
#constant KEY_7		55
#constant KEY_8		56
#constant KEY_9		57
#constant KEY_A		65
#constant KEY_B		66
#constant KEY_C		67
#constant KEY_D		68
#constant KEY_E		69
#constant KEY_F		70
#constant KEY_G		71
#constant KEY_H		72
#constant KEY_I		73
#constant KEY_J		74
#constant KEY_K		75
#constant KEY_L		76
#constant KEY_M		77
#constant KEY_N		78
#constant KEY_O		79
#constant KEY_P		80
#constant KEY_Q		81
#constant KEY_R		82
#constant KEY_S		83
#constant KEY_T		84
#constant KEY_U		85
#constant KEY_V		86
#constant KEY_W		87
#constant KEY_X		88
#constant KEY_Y		89
#constant KEY_Z		90
#constant KEY_CONTEXT	93
#constant KEY_ASTERISK	106
#constant KEY_PLUS		107
#constant KEY_F1		112
#constant KEY_F2		113
#constant KEY_F3		114
#constant KEY_F4		115
#constant KEY_F5		116
#constant KEY_F6		117
#constant KEY_F7		118
#constant KEY_F8		119
#constant KEY_SEMICOLON		186
#constant KEY_EQUAL			187
#constant KEY_COMMA			188
#constant KEY_HYPHEN		189
#constant KEY_PERIOD		190
#constant KEY_FORSLASH		191
#constant KEY_DIVIDE		192
#constant KEY_GRAVE			192
#constant KEY_LEFTBRACKET	219
#constant KEY_BAR			220
#constant KEY_RIGHTBRACKET	221
#constant KEY_APOSTROPHE	222


#constant KEY_LMB_STATE GetRawMouseLeftState()
#constant KEY_RMB_STATE GetRawMouseRightState()
#constant KEY_MMB_STATE GetRawMouseMiddleState()

#constant KEY_LMB_PRESSED GetRawMouseLeftPressed()
#constant KEY_RMB_PRESSED GetRawMouseRightPressed()
#constant KEY_MMB_PRESSED GetRawMouseMiddlePressed()

#constant KEY_LMB_RELEASED GetRawMouseLeftReleased()
#constant KEY_RMB_RELEASED GetRawMouseRightReleased()
#constant KEY_MMB_RELEASED GetRawMouseMiddleReleased()


#constant KEY_BACKSPACE_STATE GetRawKeyState( 8 )
#constant KEY_TAB_STATE GetRawKeyState( 9 )
#constant KEY_ENTER_STATE GetRawKeyState( 13 )
#constant KEY_SHIFT_STATE GetRawKeyState( 16 )
#constant KEY_CONTROL_STATE GetRawKeyState( 17 )
#constant KEY_ALT_STATE GetRawKeyState( 18 )
#constant KEY_ESCAPE_STATE GetRawKeyState( 27 )
#constant KEY_SPACE_STATE GetRawKeyState( 32 )
#constant KEY_PAGEUP_STATE GetRawKeyState( 33 )
#constant KEY_PAGEDOWN_STATE GetRawKeyState( 34 )
#constant KEY_END_STATE GetRawKeyState( 35 )
#constant KEY_HOME_STATE GetRawKeyState( 36 )
#constant KEY_LEFT_STATE GetRawKeyState( 37 )
#constant KEY_UP_STATE GetRawKeyState( 38 )
#constant KEY_RIGHT_STATE GetRawKeyState( 39 )
#constant KEY_DOWN_STATE GetRawKeyState( 40 )
#constant KEY_INSERT_STATE GetRawKeyState( 45 )
#constant KEY_DELETE_STATE GetRawKeyState( 46 )
#constant KEY_0_STATE GetRawKeyState( 48 )
#constant KEY_1_STATE GetRawKeyState( 49 )
#constant KEY_2_STATE GetRawKeyState( 50 )
#constant KEY_3_STATE GetRawKeyState( 51 )
#constant KEY_4_STATE GetRawKeyState( 52 )
#constant KEY_5_STATE GetRawKeyState( 53 )
#constant KEY_6_STATE GetRawKeyState( 54 )
#constant KEY_7_STATE GetRawKeyState( 55 )
#constant KEY_8_STATE GetRawKeyState( 56 )
#constant KEY_9_STATE GetRawKeyState( 57 )
#constant KEY_A_STATE GetRawKeyState( 65 )
#constant KEY_B_STATE GetRawKeyState( 66 )
#constant KEY_C_STATE GetRawKeyState( 67 )
#constant KEY_D_STATE GetRawKeyState( 68 )
#constant KEY_E_STATE GetRawKeyState( 69 )
#constant KEY_F_STATE GetRawKeyState( 70 )
#constant KEY_G_STATE GetRawKeyState( 71 )
#constant KEY_H_STATE GetRawKeyState( 72 )
#constant KEY_I_STATE GetRawKeyState( 73 )
#constant KEY_J_STATE GetRawKeyState( 74 )
#constant KEY_K_STATE GetRawKeyState( 75 )
#constant KEY_L_STATE GetRawKeyState( 76 )
#constant KEY_M_STATE GetRawKeyState( 77 )
#constant KEY_N_STATE GetRawKeyState( 78 )
#constant KEY_O_STATE GetRawKeyState( 79 )
#constant KEY_P_STATE GetRawKeyState( 80 )
#constant KEY_Q_STATE GetRawKeyState( 81 )
#constant KEY_R_STATE GetRawKeyState( 82 )
#constant KEY_S_STATE GetRawKeyState( 83 )
#constant KEY_T_STATE GetRawKeyState( 84 )
#constant KEY_U_STATE GetRawKeyState( 85 )
#constant KEY_V_STATE GetRawKeyState( 86 )
#constant KEY_W_STATE GetRawKeyState( 87 )
#constant KEY_X_STATE GetRawKeyState( 88 )
#constant KEY_Y_STATE GetRawKeyState( 89 )
#constant KEY_Z_STATE GetRawKeyState( 90 )
#constant KEY_CONTEXT_STATE GetRawKeyState( 93 )
#constant KEY_ASTERISK_STATE GetRawKeyState( 106 )
#constant KEY_PLUS_STATE GetRawKeyState( 107 )
#constant KEY_F1_STATE GetRawKeyState( 112 )
#constant KEY_F2_STATE GetRawKeyState( 113 )
#constant KEY_F3_STATE GetRawKeyState( 114 )
#constant KEY_F4_STATE GetRawKeyState( 115 )
#constant KEY_F5_STATE GetRawKeyState( 116 )
#constant KEY_F6_STATE GetRawKeyState( 117 )
#constant KEY_F7_STATE GetRawKeyState( 118 )
#constant KEY_F8_STATE GetRawKeyState( 119 )
#constant KEY_SEMICOLON_STATE GetRawKeyState( 186 )
#constant KEY_EQUAL_STATE GetRawKeyState( 187 )
#constant KEY_COMMA_STATE GetRawKeyState( 188 )
#constant KEY_HYPHEN_STATE GetRawKeyState( 189 )
#constant KEY_PERIOD_STATE GetRawKeyState( 190 )
#constant KEY_FORSLASH_STATE GetRawKeyState( 191 )
#constant KEY_DIVIDE_STATE GetRawKeyState( 192 )
#constant KEY_GRAVE_STATE GetRawKeyState( 192 )
#constant KEY_LEFTBRACKET_STATE GetRawKeyState( 219 )
#constant KEY_BAR_STATE GetRawKeyState( 220 )
#constant KEY_RIGHTBRACKET_STATE GetRawKeyState( 221 )
#constant KEY_APOSTROPHE_STATE GetRawKeyState( 222 )

#constant KEY_BACKSPACE_PRESSED GetRawKeyPressed( 8 )
#constant KEY_TAB_PRESSED GetRawKeyPressed( 9 )
#constant KEY_ENTER_PRESSED GetRawKeyPressed( 13 )
#constant KEY_SHIFT_PRESSED GetRawKeyPressed( 16 )
#constant KEY_CONTROL_PRESSED GetRawKeyPressed( 17 )
#constant KEY_ALT_PRESSED GetRawKeyPressed( 18 )
#constant KEY_ESCAPE_PRESSED GetRawKeyPressed( 27 )
#constant KEY_SPACE_PRESSED GetRawKeyPressed( 32 )
#constant KEY_PAGEUP_PRESSED GetRawKeyPressed( 33 )
#constant KEY_PAGEDOWN_PRESSED GetRawKeyPressed( 34 )
#constant KEY_END_PRESSED GetRawKeyPressed( 35 )
#constant KEY_HOME_PRESSED GetRawKeyPressed( 36 )
#constant KEY_LEFT_PRESSED GetRawKeyPressed( 37 )
#constant KEY_UP_PRESSED GetRawKeyPressed( 38 )
#constant KEY_RIGHT_PRESSED GetRawKeyPressed( 39 )
#constant KEY_DOWN_PRESSED GetRawKeyPressed( 40 )
#constant KEY_INSERT_PRESSED GetRawKeyPressed( 45 )
#constant KEY_DELETE_PRESSED GetRawKeyPressed( 46 )
#constant KEY_0_PRESSED GetRawKeyPressed( 48 )
#constant KEY_1_PRESSED GetRawKeyPressed( 49 )
#constant KEY_2_PRESSED GetRawKeyPressed( 50 )
#constant KEY_3_PRESSED GetRawKeyPressed( 51 )
#constant KEY_4_PRESSED GetRawKeyPressed( 52 )
#constant KEY_5_PRESSED GetRawKeyPressed( 53 )
#constant KEY_6_PRESSED GetRawKeyPressed( 54 )
#constant KEY_7_PRESSED GetRawKeyPressed( 55 )
#constant KEY_8_PRESSED GetRawKeyPressed( 56 )
#constant KEY_9_PRESSED GetRawKeyPressed( 57 )
#constant KEY_A_PRESSED GetRawKeyPressed( 65 )
#constant KEY_B_PRESSED GetRawKeyPressed( 66 )
#constant KEY_C_PRESSED GetRawKeyPressed( 67 )
#constant KEY_D_PRESSED GetRawKeyPressed( 68 )
#constant KEY_E_PRESSED GetRawKeyPressed( 69 )
#constant KEY_F_PRESSED GetRawKeyPressed( 70 )
#constant KEY_G_PRESSED GetRawKeyPressed( 71 )
#constant KEY_H_PRESSED GetRawKeyPressed( 72 )
#constant KEY_I_PRESSED GetRawKeyPressed( 73 )
#constant KEY_J_PRESSED GetRawKeyPressed( 74 )
#constant KEY_K_PRESSED GetRawKeyPressed( 75 )
#constant KEY_L_PRESSED GetRawKeyPressed( 76 )
#constant KEY_M_PRESSED GetRawKeyPressed( 77 )
#constant KEY_N_PRESSED GetRawKeyPressed( 78 )
#constant KEY_O_PRESSED GetRawKeyPressed( 79 )
#constant KEY_P_PRESSED GetRawKeyPressed( 80 )
#constant KEY_Q_PRESSED GetRawKeyPressed( 81 )
#constant KEY_R_PRESSED GetRawKeyPressed( 82 )
#constant KEY_S_PRESSED GetRawKeyPressed( 83 )
#constant KEY_T_PRESSED GetRawKeyPressed( 84 )
#constant KEY_U_PRESSED GetRawKeyPressed( 85 )
#constant KEY_V_PRESSED GetRawKeyPressed( 86 )
#constant KEY_W_PRESSED GetRawKeyPressed( 87 )
#constant KEY_X_PRESSED GetRawKeyPressed( 88 )
#constant KEY_Y_PRESSED GetRawKeyPressed( 89 )
#constant KEY_Z_PRESSED GetRawKeyPressed( 90 )
#constant KEY_CONTEXT_PRESSED GetRawKeyPressed( 93 )
#constant KEY_ASTERISK_PRESSED GetRawKeyPressed( 106 )
#constant KEY_PLUS_PRESSED GetRawKeyPressed( 107 )
#constant KEY_F1_PRESSED GetRawKeyPressed( 112 )
#constant KEY_F2_PRESSED GetRawKeyPressed( 113 )
#constant KEY_F3_PRESSED GetRawKeyPressed( 114 )
#constant KEY_F4_PRESSED GetRawKeyPressed( 115 )
#constant KEY_F5_PRESSED GetRawKeyPressed( 116 )
#constant KEY_F6_PRESSED GetRawKeyPressed( 117 )
#constant KEY_F7_PRESSED GetRawKeyPressed( 118 )
#constant KEY_F8_PRESSED GetRawKeyPressed( 119 )
#constant KEY_SEMICOLON_PRESSED GetRawKeyPressed( 186 )
#constant KEY_EQUAL_PRESSED GetRawKeyPressed( 187 )
#constant KEY_COMMA_PRESSED GetRawKeyPressed( 188 )
#constant KEY_HYPHEN_PRESSED GetRawKeyPressed( 189 )
#constant KEY_PERIOD_PRESSED GetRawKeyPressed( 190 )
#constant KEY_FORSLASH_PRESSED GetRawKeyPressed( 191 )
#constant KEY_DIVIDE_PRESSED GetRawKeyPressed( 192 )
#constant KEY_GRAVE_PRESSED GetRawKeyPressed( 192 )
#constant KEY_LEFTBRACKET_PRESSED GetRawKeyPressed( 219 )
#constant KEY_BAR_PRESSED GetRawKeyPressed( 220 )
#constant KEY_RIGHTBRACKET_PRESSED GetRawKeyPressed( 221 )
#constant KEY_APOSTROPHE_PRESSED GetRawKeyPressed( 222 )

#constant KEY_BACKSPACE_RELEASED GetRawKeyReleased( 8 )
#constant KEY_TAB_RELEASED GetRawKeyReleased( 9 )
#constant KEY_ENTER_RELEASED GetRawKeyReleased( 13 )
#constant KEY_SHIFT_RELEASED GetRawKeyReleased( 16 )
#constant KEY_CONTROL_RELEASED GetRawKeyReleased( 17 )
#constant KEY_ALT_RELEASED GetRawKeyReleased( 18 )
#constant KEY_ESCAPE_RELEASED GetRawKeyReleased( 27 )
#constant KEY_SPACE_RELEASED GetRawKeyReleased( 32 )
#constant KEY_PAGEUP_RELEASED GetRawKeyReleased( 33 )
#constant KEY_PAGEDOWN_RELEASED GetRawKeyReleased( 34 )
#constant KEY_END_RELEASED GetRawKeyReleased( 35 )
#constant KEY_HOME_RELEASED GetRawKeyReleased( 36 )
#constant KEY_LEFT_RELEASED GetRawKeyReleased( 37 )
#constant KEY_UP_RELEASED GetRawKeyReleased( 38 )
#constant KEY_RIGHT_RELEASED GetRawKeyReleased( 39 )
#constant KEY_DOWN_RELEASED GetRawKeyReleased( 40 )
#constant KEY_INSERT_RELEASED GetRawKeyReleased( 45 )
#constant KEY_DELETE_RELEASED GetRawKeyReleased( 46 )
#constant KEY_0_RELEASED GetRawKeyReleased( 48 )
#constant KEY_1_RELEASED GetRawKeyReleased( 49 )
#constant KEY_2_RELEASED GetRawKeyReleased( 50 )
#constant KEY_3_RELEASED GetRawKeyReleased( 51 )
#constant KEY_4_RELEASED GetRawKeyReleased( 52 )
#constant KEY_5_RELEASED GetRawKeyReleased( 53 )
#constant KEY_6_RELEASED GetRawKeyReleased( 54 )
#constant KEY_7_RELEASED GetRawKeyReleased( 55 )
#constant KEY_8_RELEASED GetRawKeyReleased( 56 )
#constant KEY_9_RELEASED GetRawKeyReleased( 57 )
#constant KEY_A_RELEASED GetRawKeyReleased( 65 )
#constant KEY_B_RELEASED GetRawKeyReleased( 66 )
#constant KEY_C_RELEASED GetRawKeyReleased( 67 )
#constant KEY_D_RELEASED GetRawKeyReleased( 68 )
#constant KEY_E_RELEASED GetRawKeyReleased( 69 )
#constant KEY_F_RELEASED GetRawKeyReleased( 70 )
#constant KEY_G_RELEASED GetRawKeyReleased( 71 )
#constant KEY_H_RELEASED GetRawKeyReleased( 72 )
#constant KEY_I_RELEASED GetRawKeyReleased( 73 )
#constant KEY_J_RELEASED GetRawKeyReleased( 74 )
#constant KEY_K_RELEASED GetRawKeyReleased( 75 )
#constant KEY_L_RELEASED GetRawKeyReleased( 76 )
#constant KEY_M_RELEASED GetRawKeyReleased( 77 )
#constant KEY_N_RELEASED GetRawKeyReleased( 78 )
#constant KEY_O_RELEASED GetRawKeyReleased( 79 )
#constant KEY_P_RELEASED GetRawKeyReleased( 80 )
#constant KEY_Q_RELEASED GetRawKeyReleased( 81 )
#constant KEY_R_RELEASED GetRawKeyReleased( 82 )
#constant KEY_S_RELEASED GetRawKeyReleased( 83 )
#constant KEY_T_RELEASED GetRawKeyReleased( 84 )
#constant KEY_U_RELEASED GetRawKeyReleased( 85 )
#constant KEY_V_RELEASED GetRawKeyReleased( 86 )
#constant KEY_W_RELEASED GetRawKeyReleased( 87 )
#constant KEY_X_RELEASED GetRawKeyReleased( 88 )
#constant KEY_Y_RELEASED GetRawKeyReleased( 89 )
#constant KEY_Z_RELEASED GetRawKeyReleased( 90 )
#constant KEY_CONTEXT_RELEASED GetRawKeyReleased( 93 )
#constant KEY_ASTERISK_RELEASED GetRawKeyReleased( 106 )
#constant KEY_PLUS_RELEASED GetRawKeyReleased( 107 )
#constant KEY_F1_RELEASED GetRawKeyReleased( 112 )
#constant KEY_F2_RELEASED GetRawKeyReleased( 113 )
#constant KEY_F3_RELEASED GetRawKeyReleased( 114 )
#constant KEY_F4_RELEASED GetRawKeyReleased( 115 )
#constant KEY_F5_RELEASED GetRawKeyReleased( 116 )
#constant KEY_F6_RELEASED GetRawKeyReleased( 117 )
#constant KEY_F7_RELEASED GetRawKeyReleased( 118 )
#constant KEY_F8_RELEASED GetRawKeyReleased( 119 )
#constant KEY_SEMICOLON_RELEASED GetRawKeyReleased( 186 )
#constant KEY_EQUAL_RELEASED GetRawKeyReleased( 187 )
#constant KEY_COMMA_RELEASED GetRawKeyReleased( 188 )
#constant KEY_HYPHEN_RELEASED GetRawKeyReleased( 189 )
#constant KEY_PERIOD_RELEASED GetRawKeyReleased( 190 )
#constant KEY_FORSLASH_RELEASED GetRawKeyReleased( 191 )
#constant KEY_DIVIDE_RELEASED GetRawKeyReleased( 192 )
#constant KEY_GRAVE_RELEASED GetRawKeyReleased( 192 )
#constant KEY_LEFTBRACKET_RELEASED GetRawKeyReleased( 219 )
#constant KEY_BAR_RELEASED GetRawKeyReleased( 220 )
#constant KEY_RIGHTBRACKET_RELEASED GetRawKeyReleased( 221 )
#constant KEY_APOSTROPHE_RELEASED GetRawKeyReleased( 222 )
