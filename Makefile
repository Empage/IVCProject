.PHONY:all tmp tmp2 clean animation3 animation4

OUTNAME := generated/`date +%Y%m%d-%H-%M-%S`.png
OUTNAME2:= generated/`date +%Y%m%d-%H-%M-%S`_.png
INNAME  := animation3.pov

all : animation3 animation4
	
#600*480
tmp :
	povray Clock=0.10 Debug_Console=On Debug_File=On Width=1024 Height=768 +I$(INNAME) +P +O$(OUTNAME) 

tmp2 :
	povray animation4.ini +O$(OUTNAME2)

clean :
	rm -f generated/*.png generated/*.pov-state generated/debug.out

animation3 : 
	povray animation3.ini +O$(OUTNAME2)
animation4 : 
	povray animation4.ini +O$(OUTNAME2)
