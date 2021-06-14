
 format PE console 3.1; at $10000

 entry start

 include 'win32a.inc'

 ; use this in cheat engine or whatever can edit memory including code
 section 'xprmnt' code data readable executable writeable shareable discardable notpageable
  start:
   db  $FB  dup (90h) ; edit code here
   jmp start
   db  100h dup (0)

 ;section 'extn' import data readable writeable
 ;  library kernel,'KERNEL32.DLL',\
 ;          msvcrt,'msvcrt.dll'
 ;  import kernel,\
 ;         Sleep,'Sleep',\
 ;         ExitProcess,'ExitProcess';,\
 ;         ;SetConsoleCP,'SetConsoleCP',\
 ;         ;SetConsoleOutputCP,'SetConsoleOutputCP'
 ;  import msvcrt,\
 ;         putchar,'putchar'
