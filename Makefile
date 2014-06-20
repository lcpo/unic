CC=gcc
LIBCOMP=ranlib
LIBCOMPA=ar rc
LIBS=
EXECUTABLE=unicc
SOURCES=main.c unicc.c
OBJECTS=main.o
OBJECTSLIB=unicc.o
SOPTS= -nostdinc -fverbose-asm -fno-builtin -nostartfiles -nostdlib #-lpcre  `pcre-config --libs` -lcurl -lmysqlclient # -w 

all:
	$(CC) -c -w -D __NO_DEBUG -D __NO_START $(SOURCES)
	$(LIBCOMPA) lib$(EXECUTABLE).a $(OBJECTSLIB)
	$(LIBCOMP) lib$(EXECUTABLE).a
	make break
	$(CC) -fPIC -c -w -D __NO_DEBUG -D __NO_START $(SOURCES)
	$(CC) -shared -nostdlib -o $(EXECUTABLE).so $(OBJECTSLIB)	
	make break
	$(CC) -c -w -D __NO_DEBUG -D __NO_START $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	make break
test:
	make clear
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	strip -s ./$(EXECUTABLE)
	strip ./$(EXECUTABLE) -R .dtors            
	strip ./$(EXECUTABLE) -R .jcr 
	strip ./$(EXECUTABLE) -R .got 
	strip ./$(EXECUTABLE) -R .data
	strip ./$(EXECUTABLE) -R .comment          
	strip ./$(EXECUTABLE) -R .debug_aranges    
	strip ./$(EXECUTABLE) -R .debug_pubnames   
	strip ./$(EXECUTABLE) -R .debug_info       
	strip ./$(EXECUTABLE) -R .debug_abbrev     
	strip ./$(EXECUTABLE) -R .debug_line       
	strip ./$(EXECUTABLE) -R .debug_str        
	strip ./$(EXECUTABLE) -R .debug_loc        
	strip ./$(EXECUTABLE) -R .debug_pubtypes   
	strip ./$(EXECUTABLE) -R .shstrtab         
	strip ./$(EXECUTABLE) -R .symtab           
	strip ./$(EXECUTABLE) -R .strtab
	strip ./$(EXECUTABLE) -R .note.ABI-tag     
	strip ./$(EXECUTABLE) -R .gnu.hash
	strip ./$(EXECUTABLE) -R .gnu.version  
	strip ./$(EXECUTABLE) -R .rel.dyn 
	./$(EXECUTABLE)

testlog:
	make clear
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	strace ./$(EXECUTABLE)
testasm:
	make clear
	$(CC) -c $(SOURCES)
	$(CC) $(SOPTS) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)
	./$(EXECUTABLE)
	strip -s ./$(EXECUTABLE)
	strip ./$(EXECUTABLE) -R .dtors            
	strip ./$(EXECUTABLE) -R .jcr 
	strip ./$(EXECUTABLE) -R .got 
	strip ./$(EXECUTABLE) -R .data
	strip ./$(EXECUTABLE) -R .comment          
	strip ./$(EXECUTABLE) -R .debug_aranges    
	strip ./$(EXECUTABLE) -R .debug_pubnames   
	strip ./$(EXECUTABLE) -R .debug_info       
	strip ./$(EXECUTABLE) -R .debug_abbrev     
	strip ./$(EXECUTABLE) -R .debug_line       
	strip ./$(EXECUTABLE) -R .debug_str        
	strip ./$(EXECUTABLE) -R .debug_loc        
	strip ./$(EXECUTABLE) -R .debug_pubtypes   
	strip ./$(EXECUTABLE) -R .shstrtab         
	strip ./$(EXECUTABLE) -R .symtab           
	strip ./$(EXECUTABLE) -R .strtab
	strip ./$(EXECUTABLE) -R .note.ABI-tag     
	strip ./$(EXECUTABLE) -R .gnu.hash
	strip ./$(EXECUTABLE) -R .gnu.version  
	strip ./$(EXECUTABLE) -R .rel.dyn 
	objdump -d ./$(EXECUTABLE)

	
clear:
	clear
	rm -rf *.o $(EXECUTABLE)

clearall:
	rm -rf *.o $(EXECUTABLE) lib$(EXECUTABLE).a $(EXECUTABLE).so 
break:
	rm -rf *.o
index:
	make clearall
	git config --global user.email "lcpo.net@yandex.com"
	git config --global user.name  "S.S.Korotaev"
	git add -A
	git add *.c
	git add *.h
	git commit -a -m `date +%Y-%m-%d_%H:%M:%S`
	git push origin master

	
