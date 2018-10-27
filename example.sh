#!/bin/bash

export GPU_FORCE_64BIT_PTR=1
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100

./mkxminer -a lyra2z --exitsick -o stratum+tcp://lyra2z.eu.nicehash.com:3365 -u 1N2vf6Jm9jmScDUfwPeiicHNsXRSmvnjpL -p x -I 17

