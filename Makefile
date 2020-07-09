main: main.o somemodule.o
	gfortran -o main main.o somemodule.o -g

main.o: main.f90 somemodule.o
	gfortran -c main.f90 -g

somemodule.o: somemodule.f90
	gfortran -c somemodule.f90 -g

clean:
	rm main main.o somemodule.o somemodule.mod