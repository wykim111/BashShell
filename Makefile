CC=gcc
OBJS=StringLib.o main.o  
SRCS=StringLib.c main.c
CFLAGS=-W -Wall
TARGET=CString_exe 
INC=-I/home/ubuntu/Programming/CString/include
all:$(TARGET)
	$(CC)	-o	$(TARGET)   $(OBJS) $(INC)
$(TARGET):
	$(CC)   -c  $(SRCS) $(INC)
clean :
	rm -f $(TARGET) //TAB ctrl + Q, shift
	rm -f *.o
