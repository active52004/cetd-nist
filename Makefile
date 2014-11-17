CC := /usr/bin/gcc

ROOTDIR = .

MAINDIR = $(ROOTDIR)/main 
MAINSRCDIR = $(MAINDIR)/src
MAINOBJDIR = $(MAINDIR)/obj

CETDDIR = $(ROOTDIR)/cetd
CETDSRCDIR = $(CETDDIR)/src
CETDOBJDIR = $(CETDDIR)/obj

SUBDIRS := $(MAINDIR) \
		   $(CETDDIR)

INCLUDE_DIR := -I$(MAINDIR)/include \
			   -I$(CETDDIR)/include 

GCCFLAGS = $(INCLUDE_DIR) -c -Wall -g --std=c99

OBJS := $(MAINOBJDIR)/run.o \
	   $(wildcard $(CETDOBJDIR)/*.o) 

export CC \
	   GCCFLAGS \
	   MAINDIR \
	   CETDDIR \
	   OBJS 

all:$(SUBDIRS)
$(SUBDIRS):ECHO
	make -C $@

ECHO:
	@echo $(SUBDIRS)
	@echo begin compile

clean:
	rm -f $(MAINOBJDIR)/*.o \
		  $(CETDOBJDIR)/*.o
rebuild: clean run

