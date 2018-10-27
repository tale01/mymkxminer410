mkxminer: Assembler-optimized Lyra2Z miner for AMD GPUs (ZCoin, GINcoin, Vertcoin, Monacoin, Verge)

!!! Only works with AMD videocards. No NVidia, Intel, CPU or ASICs !!!


=== List of Lyra2Z coins
ZCoin [XZC] - https://bitcointalk.org/index.php?topic=1638450.0
GINcoin [GIN] - https://bitcointalk.org/index.php?topic=2998031.0
Gentarium [GTM] - https://bitcointalk.org/index.php?topic=4707019.0
ZCore - https://bitcointalk.org/index.php?topic=3188172.0
MANO - https://bitcointalk.org/index.php?topic=4328146.0
MCT - https://bitcointalk.org/index.php?topic=4315891.0




=== Usage (Windows)
Try running example.cmd (change -u option value to your login and -p option to your password).
If it works ok, then try running best.cmd (it uses assembler kernels).
If it is working, then you may want to tweak some settings, see Options section below.

If you are getting errors about unsupported videocard or if you have an Intel CPU and AMD GPUs, try running example2platforms.cmd.

You can also check out bestfarm.cmd for a useful script, which will name your miners according to their local IP address.

Press 'q' to exit the app.



=== Usage (Linux)
It is recommended to use mkxminer under Windows. It also usually gives better hashrate. But if you have to use Linux,
then ./example.sh is your starting point. Command line parameters are the same for Linux and Windows.

Error: Frontend phase failed compilation.
Error: Compilation from LLVMIR binary to IL text failed!
Reason: the AMD driver is not compatible with mkxminer. Try another driver. You can see AMD GPU-PRO version by executing:
dpkg -l amdgpu-pro

For example, amdgpu-pro-17.40-492261.tar.xz and amdgpu-pro-17.40-483984.tar.xz show this problem on RX480, but work fine on R9 390.

If you have some problems - please report via PM in bitcointalk.

Known issue: once you quit mkxminer, the current terminal window becomes unusable. Close terminal and open a new one.

Press 'q' to exit the app. Do NOT press Ctrl+C or you'll get a zombie process.

Tested on Ubuntu 16.04 x64 with RX580.



=== Options
--algorithm or -a - Selected mining algorithm. One option currently: lyra2z [because lyra2rev2 support was removed]
-o or --url - URL of the stratum server (ex: stratum+tls://stak.suprnova.cc:7710)
    You can currently only specify one pool, no backups supported.
-u or --user - Username for stratum server
-p or --pass -  Password for stratum server
-d or --device - Select device to use, one value, range and/or comma separated (e.g. 0-2,4) default: all
-I or --intensity - Intensity of GPU scanning (19 or 20 for high end cards, 17 or 18 for low end)
--exitsick - Exit miner if one of GPUs becomes sick (so that you can create a script to restart app / reboot PC)

--platform - Select OpenCL platform ID to use for GPU mining. Default is autodetect.
--engine - GPU engine (over)clock range in Mhz - one value, range and/or comma separated list (e.g. 1050-1100,900,750-850)
--fan - GPU fan percentage range - one value, range and/or comma separated list (e.g. 0-85,100,100). Fan 100% recommended for pro mining.
--map - Map OpenCL to ADL device order manually, paired CSV (e.g. 1:0,2:1 maps OpenCL 1 to ADL 0, 2 to 1)
--memclock - Set the GPU memory (over)clock in Mhz - one value for all or separate by commas for per card
--powertune - Set the GPU powertune percentage - one value for all or separate by commas for per card
--reorder - Attempt to reorder GPU devices according to PCI Bus ID
--vddc - Set the GPU voltage in Volts - one value for all or separate by commas for per card

--auto-fan - Automatically adjust all GPU fan speeds to maintain a target temperature
--auto-gpu - Automatically adjust all GPU engine clock speeds to maintain a target temperature
--temp-cutoff - Temperature which a device will be automatically disabled at, one value or comma separated list
--temp-overheat - Temperature which a device will be throttled at while automanaging fan and/or GPU, one value or comma separated list
--temp-target - Temperature which a device should stay at while automanaging fan and/or GPU, one value or comma separated list


=== Speeds Lyra2z (no overclocking)
Vega64: 7.4MHs
RX 580: 3.7MHs
RX 480: 3.5MHs
R9 390: 1.8MHs


* Note: the actual mining speed is a bit higher as some of the hashrate is used as devfee. The above values are what you (the miner) gets.
Other miners with devfee show you the total hashrate and then you have to reduce it by devfee: for example,
if you have 30MHs with 5% devfee, then effectively it is 28.5MHs for you (30 * (1.0 - 0.05)).
This miner shows you exactly the MHs that you earn, so devfee value is irrelevant.

You do not have to use this miner. For a free open-source option, please use https://miner.nicehash.com/ or https://github.com/sgminer-dev/sgminer.


=== Tweaking
There are pretty much only two things to tweak:
1) Increase GPU frequency. Memory frequency is not important.
2) Increase intensity. 19 or 20 is recommended for 4GB+ videocards.



=== Version history
v1.0.0 - v3.1.0:
    These versions only had Lyra2rev2 support, which is now removed because of ASICs.
    It just does not make sense to mine Lyra2rev2 with a GPU, because the profit is at least 3 times less than on other algorithms.
    4.0 is first version with Lyra2Z.

v4.0 beta: 9 September 2018
    - Added Lyra2z
    - Now 64 bit binaries only, no more 32 bit
    - Now only asm optimized kernels (removed --asm parameter)
    - Removed support for legacy Cards (prior to R9 290)
    - Reduced distribution size
    - Beta release: only windows and only lyra2z

v4.1: 27 October 2018
    - Linux build + Windows build
    - About 5% speed increase

* Coming soon *
    - API support