OUTNAME := generated/`date +%Y%m%d-%H-%M-%S`.png
OUTNAME2:= generated/`date +%Y%m%d-%H-%M-%S`_.png
INNAME  := animation2.pov

all :
	povray Width=600 Height=480 +I$(INNAME) +O$(OUTNAME)

tmp :
	povray Debug_Console=On Debug_File=On Width=600 Height=480 +I$(INNAME) +P +O$(OUTNAME) 

tmp2 :
	povray animation2.ini +O$(OUTNAME2)

clean :
	rm -f generated/*.png generated/*.pov-state generated/debug.out
