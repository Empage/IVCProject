.PHONY:all tmp tmp2 clean animation3 animation4 animation5

OUTNAME := generated/`date +%Y%m%d-%H-%M-%S`.png
OUTNAME2:= generated/`date +%Y%m%d-%H-%M-%S`_.png

all : animation3 animation4 animation5
	
INNAME  := animation10.pov
tmp :
	povray Clock=1.850 Debug_Console=On Debug_File=On Width=600 Height=480 +I$(INNAME) +P +O$(OUTNAME) 

tmp2 :
	povray animation10.ini +O$(OUTNAME2)

clean :
	rm -f generated/*.png generated/*.pov-state generated/debug.out

animation3 : 
	povray animation3.ini +O$(OUTNAME2)
animation4 : 
	povray animation4.ini +O$(OUTNAME2)
animation5 : 
	povray animation5.ini +O$(OUTNAME2)

poster :
	povray Width=3508 Height=4960 +Iposter.pov +P +Oposter.png 

