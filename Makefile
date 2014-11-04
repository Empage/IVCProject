OUTNAME := generated/`date +%Y%m%d%H%M%S`.png
INNAME  := main.pov

all :
	povray Width=600 Height=480 +I$(INNAME) +O$(OUTNAME)

run :
	povray Debug_Console=On Debug_File=On Width=600 Height=480 +I$(INNAME) +P +O$(OUTNAME) 

clean :
	rm -f generated/*.png
