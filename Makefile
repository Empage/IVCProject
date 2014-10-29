OUTNAME := generated/`date +%Y%m%d%H%M%S`.png
INNAME  := main.pov

all :
	povray Width=600 Height=480 +I$(INNAME) +O$(OUTNAME)

run :
	povray Width=600 Height=480 +I$(INNAME) +P +O$(OUTNAME)

clean :
	rm -f generated/*.png
