setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100

mkxminer.exe -a lyra2z --exitsick -o stratum+tcp://lyra2z.eu.nicehash.com:3365 -u 1N2vf6Jm9jmScDUfwPeiicHNsXRSmvnjpL -p x -I 17

pause