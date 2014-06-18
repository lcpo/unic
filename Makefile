CC=gcc
LIBCOMP=ranlib
LIBCOMPA=ar rc
LIBS=
EXECUTABLE=unic
SOURCES=main.c unic.c
OBJECTS=main.o
OBJECTSLIB=unic.o
SOPTS= -nostdlib -nostartfiles # -fno-builtin -fverbose-asm -ansi -w

all:
	$(CC) -c $(SOURCES)
	$(LIBCOMPA) lib$(EXECUTABLE).a $(OBJECTSLIB)
	$(LIBCOMP) lib$(EXECUTABLE).a
	make break
	$(CC) -fPIC -c $(SOURCES)
	$(CC) -shared -nostdlib -o $(EXECUTABLE).so $(OBJECTSLIB)	
	make break
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	make break
test:
	make clear
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	./$(EXECUTABLE)

testlog:
	make clear
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	strace ./$(EXECUTABLE)	
	
clear:
	clear
	rm -rf *.o $(EXECUTABLE)

clearall:
	rm -rf *.o $(EXECUTABLE) lib$(EXECUTABLE).a $(EXECUTABLE).so 
break:
	rm -rf *.o
index:
	git config --global user.email "lcpo.net@yandex.com"
	git config --global user.name  "S.Korotaev"
	git add -A
	git add *.c
	git add *.h
	git commit -a -m `date +%Y-%m-%d`
	git push origin master

	
