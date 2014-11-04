OUTNAME := generated/`date +%Y%m%d%H%M%S`.png
OUTNAME2:= generated/`date +%Y%m%d%H%M%S`_.png
INNAME  := main.pov

all :
	povray Width=600 Height=480 +I$(INNAME) +O$(OUTNAME)

run :
	povray Debug_Console=On Debug_File=On Width=600 Height=480 +I$(INNAME) +P +O$(OUTNAME) 

run2 :
	povray main.ini +O$(OUTNAME2)

clean :
	rm -f generated/*.png generated/*.pov-state generated/debug.out
