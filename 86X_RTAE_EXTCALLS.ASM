
 format PE console 3.1; at $10000

 entry start

 include 'win32a.inc'

 section 'xprmnt' code data readable executable writeable shareable discardable notpageable
  start:
   db  $FB  dup (90h) ; edit code here
   jmp start
 b db  200h dup (0)
   invoke Sleep, 1000
   invoke ExitProcess, 256
   invoke GetTickCount
   invoke printf, xmpstr
   invoke putchar, xmpstr
   invoke puts, xmpstr
   invoke system, xmpstr
   invoke strlen, xmpstr
   invoke memset, b, 64, 5
   invoke memcpy, b, xmpstr, 10
   ret
   xmpstr db 'example string'

 section 'extn' import data readable writeable
   library kernel,'KERNEL32.DLL',\
           msvcrt,'msvcrt.dll'
   import kernel,\
          Sleep,'Sleep',\
          ExitProcess,'ExitProcess',\
          GetModuleHandle,'GetModuleHandleA',\
          GetTickCount,'GetTickCount';,\
          ;SetConsoleCP,'SetConsoleCP',\
          ;SetConsoleOutputCP,'SetConsoleOutputCP'
   import msvcrt,\
          printf,'printf',\
          putchar,'putchar',\
          puts,'puts',\
          system,'system',\
          strlen,'strlen',\
          memset,'memset',\
          memcpy,'memcpy'
