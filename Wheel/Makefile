# DO NOT DELETE: Beginning of Haskell dependencies
Wheel.o : Wheel.hs
WheelCheck.o : WheelCheck.hs
WheelCheck.o : Wheel.hi
Main.o : Main.hs
Main.o : WheelCheck.hi
# DO NOT DELETE: End of Haskell dependencies

# These lines below will not be purged if ghc -M is re-run.
his = `ls *.hi`
os = `ls *.o`
targets = $(his) $(os)
clean :
	rm $(targets) Main
