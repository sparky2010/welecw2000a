GRLIB=../..
TOP=leon3mini
BOARD=ge-hpe-mini
include $(GRLIB)/boards/$(BOARD)/Makefile.inc
DEVICE=$(PART)-$(PACKAGE)$(SPEED)
UCF=$(GRLIB)/boards/$(BOARD)/$(TOP).ucf
QSF=$(GRLIB)/boards/$(BOARD)/$(TOP).qsf
EFFORT=1
XSTOPT=
VHDLSYNFILES=config.vhd ahbrom.vhd leon3mini.vhd
VHDLSIMFILES=testbench.vhd
SIMTOP=testbench
SDCFILE=$(GRLIB)/boards/$(BOARD)/default.sdc
BITGEN=$(GRLIB)/boards/$(BOARD)/default.ut
CLEAN=soft-clean

# Select your cable type here.
# Make sure it has been installed via the programmer GUI
# in Quartus.
#
# Examples:
#   USB-Blaster
#   ByteBlasterMV
CABLE=ByteBlasterMV

TECHLIBS = altera altera_mf 
LIBSKIP = core1553bbc core1553brm core1553brt gr1553 corePCIF \
	tmtc openchip hynix cypress ihp stratixii usbhc spw
DIRSKIP = b1553 pcif leon2 leon2ft crypto satcan pci leon3ft ambatest ddr \
	grusbhc spacewire
FILESKIP = ../../grlib-W2000A/designs/leon3-w2000a/DSOConfig-p.vhd \
	   ADC-ea.vhd SignalSelector-ea.vhd



include $(GRLIB)/bin/Makefile
include $(GRLIB)/software/leon3/Makefile

DSO_TARGET=SBX
DSO_BOARD=BOARD_COMPILATION
include $(GRLIB)/software/dso/Makefile


##################  project specific targets ##########################

quartus-pgm:
	quartus_pgm -c $(CABLE) -m JTAG -o p\;$(TOP).sof

hello.exe: hello.c
	$(XCC) $(CFLAGS) $< -o hello.exe

W2000SREC:
	cp sram.srec ../../../Scope/simSandboxX/sram.srec

