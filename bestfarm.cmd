setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100

FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set localIp=%%i

Set PCNAME=%localIp%
Set PCNAME=%PCNAME:192.168.1.=000%
Set PCNAME=%PCNAME:~-3%
Set PCID=%PCNAME:~1,1%

:RUNAGAIN
mkxminer.exe -a lyra2z --exitsick -o stratum+tcp://lyra2z.mine.zpool.ca:4553 -u 1N2vf6Jm9jmScDUfwPeiicHNsXRSmvnjpL -p %PCNAME% -I 18 --engine 1100 --memclock 300 --auto-fan --temp-cutoff 90 --temp-overheat 80 --temp-target 62 --fan 100 --powertune 20
GOTO RUNAGAIN


pause