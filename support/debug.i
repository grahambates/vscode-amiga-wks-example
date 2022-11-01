BARTO_CMD_CLEAR = 0
BARTO_CMD_RECT = 1
BARTO_CMD_FILLED_RECT = 2
BARTO_CMD_TEXT = 3
BARTO_CMD_REGISTER_RESOURCE = 4
BARTO_CMD_SET_IDLE = 5
BARTO_CMD_UNREGISTER_RESOURCE = 6
BARTO_CMD_LOAD = 7
BARTO_CMD_SAVE = 8

debug_cmd	macro
		ifd DEBUG
		move.l	\4,-(sp)
		move.l	\3,-(sp)
		move.l	\2,-(sp)
		pea	\1
		pea	88
		jsr	$f0ff60
		lea	20(sp),sp
		endc
		endm

debug_start_idle macro
		debug_cmd BARTO_CMD_SET_IDLE,#1,#0,#0
		endm

debug_stop_idle	macro
		debug_cmd BARTO_CMD_SET_IDLE,#0,#0,#0
		endm

debug_clear	macro
		debug_cmd BARTO_CMD_CLEAR,#0,#0,#0
		endm

debug_rect	macro
		debug_cmd BARTO_CMD_RECT,#(\1<<16)!\2,#(\3<<16)!\4,#\5
		endm

debug_filled_rect macro
		debug_cmd BARTO_CMD_FILLED_RECT,#(\1<<16)!\2,#(\3<<16)!\4,#\5
		endm

debug_text	macro
		debug_cmd BARTO_CMD_TEXT,#(\1<<16)!\2,#\3,#\4
		endm