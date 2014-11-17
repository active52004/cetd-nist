#makefile run.c
ROOTDIR = . 

MAINDIR = $(ROOTDIR)/main 
MAINSRCDIR = $(MAINDIR)/src
MAINOBJDIR = $(MAINDIR)/obj

CETDDIR = $(ROOTDIR)/cetd
CETDSRCDIR = $(CETDDIR)/src
CETDOBJDIR = $(CETDDIR)/obj

INCLUDE_DIR := -I$(MAINDIR)/include \
			   -I$(CETDDIR)/include 

GCCFLAGS = $(INCLUDE_DIR) -c -Wall -g --std=c99

OBJ := $(MAINOBJDIR)/run.o \
	   $(wildcard $(CETDOBJDIR)/*.o) 

run: $(OBJ)
	$(CC) -o $@ $(OBJ) -lm

$(MAINOBJDIR)/run.o: $(MAINSRCDIR)/run.c config.h show.h input.h CETD.h \
 aes.h cipher.h LL_arr_gen.h math_func.h 
	$(CC) -o $@ $(GCCFLAGS) $(MAINSRCDIR)/run.c 

.PHONY:cetd

cetd:
	$(MAKE) -C $(CETDDIR)

clean:
	rm -f run $(MAINOBJDIR)/*.o 
rebuild: clean run
