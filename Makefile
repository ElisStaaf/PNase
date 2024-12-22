# Generated automatically from Makefile.in by configure.
##
## Makefile for the NASE A60 interpreter.
## Copyright (C) 1991-1999 Erik Schoenfelder (schoenfr@ibr.cs.tu-bs.de)
##
## This file is part of NASE A60.
## 
## NASE A60 is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## NASE A60 is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with NASE A60; see the file COPYING.  If not, write to the Free
## Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
##
##
## Makefile.unx:				aug '90
##
## Makefile for the a60 interpreter (un*x version)
##

## Default top-level directories in which to install architecture-
## specific files (exec_prefix) and machine-independent files such
## as scripts (prefix).  The values specified here may be overridden
## at configure-time with the --exec-prefix and --prefix options
## to the "configure" script.

prefix =	/usr/local
exec_prefix =	${prefix}

BINDIR = $(exec_prefix)/bin
LIBDIR = $(prefix)/lib
MANDIR = $(prefix)/man/man1
MANSUFF = 1

##
## Libdirpath is used in mkc.c; comment to exclude:
##
LIBDIRPATH = -DLIBDIRPATH=\"$(LIBDIR)\"

##
## Compiler environment:
##
## CC describes the compiler.
## (add -mnognu-stdarg for a gcc on a pyramid)
## XCC is the compiler used for X11. choose $(CC) for default.
##
CC = cc
XCC = cc

##
## warn flags for gcc compiler:
##
# GWARN = -W -Wcomment -Wpointer-arith -Wcast-qual
# GWAR2 = -Wall
WARN = $(GWARN) $(GWAR2)

##
## system dependent flags:
##
DEFS = -DHAVE_CONFIG_H
##

##
## Flags for debugging and production:
##
# FLAGS = -g
FLAGS = -g -O -DDEBUG
# LDFLAGS = -g
LDFLAGS =

## Uncomment for profiling:
# PROF = -pg

##
## library for math stuff:
##
LIBS = -lm

##
## Mainly used parser generator:
## (if you use bison, your compiler/libc should provide alloca)
##
YACCFLAGS = -v
YACC = bison -y
# YACC = byacc
# YACC = yacc

##
## installation commands:
##
INSTALL =		/usr/bin/install -c
INSTALL_PROGRAM =	${INSTALL}
INSTALL_DATA =		${INSTALL} -m 644

##
## commonly used binaries:
##
SHELL = /bin/sh
RM = rm

##
## Flags for lint:
##
LINTFLAGS = -q

##
## The target:
##
PRG = pnase

##
## And more:
##
## Anything else below here should be independent.
##
IOBJS = main.o util.o tree.o symtab.o type.o stmt.o check.o expr.o\
	err.o run.o eval.o bltin.o doeval.o mkc.o a60-scan.o
ISRCS = main.c util.c tree.c symtab.c type.c stmt.c check.c expr.c\
	err.c run.c eval.c bltin.c doeval.c mkc.c a60-scan.c
MOBJS = a60-ptab.o ## a60-ltab.o
MSRCS = a60-ptab.c ## a60-ltab.c
EXTRA = a60-parse.y
MHDRS = a60-ptab.h
MPEXT = a60-pbis.c a60-pyac.c a60-pbya.c a60-pbis.h a60-pyac.h a60-pbya.h
IHDRS = a60.h block.h symtab.h tree.h type.h util.h version.h expr.h\
	run.h eval.h bltin.h conv.h comm.h a60-scan.h mkc.h\
	a60-mkc.inc config.h

MAKF = Makefile Makefile.in Makefile.unx configure.in configure\
	config.h.in install-sh
MICR = micro/*
UTIL = README ENUM.README $(MAKF) $(MICR) TODO a60.man xa60.man\
	chenums.c xa60.c ChangeLog COPYING a60-lex.l INSTALL make-dist.sh\
	extrerrm.l make-errmsgs.sh
TDOC = RRA60.texinfo a60.texinfo
TEXT = texinfo.tex
DOCS = $(TDOC)
MDOC = RRA60.info a60.info RRA60.ps RRA60-a4.ps RRA60-us.ps a60.ps a60.html
TESA = test examples

OBJS = $(IOBJS) $(MOBJS)
SRCS = $(ISRCS) $(MSRCS)
HDRS = $(IHDRS) $(MHDRS)

CFLAGS = $(FLAGS) $(PROF) $(WARN) $(DEFS) $(LIBDIRPATH)
XCFLAGS = $(FLAGS) $(PROF) $(DEFS) $(LIBDIRPATH)

##
## How to build the target:
##
all:		$(PRG)

$(PRG):		$(OBJS)
	$(CC) $(LDFLAGS) $(PROF) -o $(PRG) $(OBJS) $(LIBS)

a60-ptab.c:	a60-parse.y
	$(RM) -f y.tab.c y.tab.h
	@echo '## expect 1 reduce/reduce conflict:'
	$(YACC) $(YACCFLAGS) -d a60-parse.y
	if [ -f y.tab.c ] ; then mv y.tab.c a60-ptab.c ; fi
	if [ -f y.tab.h ] ; then mv y.tab.h a60-ptab.h ; fi

##
## make the standalone xa60:
##

XINCLUDE =  -INONE
XLIB = -LNONE -lXaw -lXt -lSM -lICE -lXext -lXmu -lX11

xa60:		xa60.c
	$(XCC) $(XCFLAGS) $(XINCLUDE) -o xa60 xa60.c $(XLIB)

##
## the 'const' substitution prevents a 'keyword redefined' (for flex).
## the 'YYLMAX' is increased (for lex).
##
## *** NOTE: a60-lex.l is replaced by a60-scan.c
##           and not used anymore.
##
LEX = flex
# LEX = lex
#
a60-ltab.c:		a60-lex.l
	$(LEX) a60-lex.l
	sed -e '1,$$s/^#define const/\/* #define const *\//'\
		-e '1,$$s/ const / /g'\
		-e '1,$$s/# define YYLMAX.*/# define YYLMAX 8192/'\
		< lex.yy.c > a60-ltab.c
	$(RM) -f lex.yy.c

a60-ptab.h:	a60-ptab.c
a60-scan.o:	a60-ptab.h
msrc:		$(MSRCS)

##
## this was for testing; create the parser with bison/yacc/byacc:
##
mpext:		$(MPEXT)

a60-pbis.c:	a60-parse.y
	bison -l -d a60-parse.y
	mv a60-parse.tab.c a60-pbis.c
	mv a60-parse.tab.h a60-pbis.h

a60-pbis.h:	a60-pbis.c

a60-pyac.c:	a60-parse.y
	yacc -l -d a60-parse.y
	mv y.tab.c a60-pyac.c
	mv y.tab.h a60-pyac.h

a60-pyac.h:	 a60-pyac.c

a60-pbya.c:	a60-parse.y
	byacc -l -d a60-parse.y
	mv y.tab.c a60-pbya.c
	mv y.tab.h a60-pbya.h

a60-pbya.h:	a60-pbya.c

##
## installation:
##
inst-bin:	$(PRG)
	$(INSTALL_PROGRAM) $(PRG) $(BINDIR)

inst-man:
	$(INSTALL_DATA) a60.man $(MANDIR)/$(PRG).$(MANSUFF)

inst-lib:
	-$(INSTALL_DATA) a60-mkc.inc $(LIBDIR)

install:	inst-man inst-bin inst-lib

xa60-install:	xa60
	$(INSTALL_PROGRAM) xa60 $(BINDIR)
	$(INSTALL_DATA) xa60.man $(MANDIR)/xa60.$(MANSUFF)

##
## test suite:
##
test:		$(PRG) maketest

maketest:	$(PRG)
	(cd test; ./runtest.sh)

##
## And more stuff:
##
gp:		pg

pg:
	gprof -b $(PRG) | sed -e '1,/^.$$/d' | head -22

TAGS:	tags

tags:
	etags $(EXTRA) $(ISRCS) $(IHDRS)

lint:
	lint $(LINTFLAGS) $(DEFS) $(SRCS)

##
## extract error messages (internal use - my fun):
##
extrerrm:	extrerrm.l
	-rm extrerrm.c
	lex -t extrerrm.l > extrerrm.c
	$(CC) -o extrerrm extrerrm.c -ll
	rm extrerrm.c
	

errmsgs:	extrerrm
	make-errmsgs.sh $(SRCS)

##
## some possible ``clean'' targets:
## 
shady:
	$(RM) -f *.cp *.fn *.ky *.pg *.log *.toc *.tp *.vr *.aux

clean:		shady
	$(RM) -f $(OBJS) gmon.out *.output *.TMP extrerrm \
	extrerrm.c *~

clobber:	clean
	$(RM) -f $(PRG) $(PRG).bak core Makefile.bak a60.zoo \
		RRA60.aux RRA60.log RRA60.toc \
	a60.tar.Z chenums RRA60.dvi a60.dvi \
		*.output xa60 */core */a.out a.out \
	config.status config.log config.h config.cache

realclean:	clobber init-Makefile
	$(RM) -f err $(MPEXT) TAGS a60-*.tar*

init-Makefile:
	echo 'all:' > Makefile
	echo '	./configure' >> Makefile
	echo '	@echo now run make again' >> Makefile

distclean:	realclean

docclean:
	rm -f RRA60*.ps a60.ps

##
## make a distribution
##
dist:	clean init-Makefile
	
	./make-dist.sh $(UTIL) $(EXTRA) $(SRCS) $(HDRS) \
		$(DOCS) $(MDOC) test/* examples/* \
		micro/* $(TEXT)

##
## save targets:
##
zoo:		$(MDOC) msrc
	$(RM) -f $(PRG).zoo
	zoo a $(PRG).zoo $(UTIL) $(EXTRA) $(SRCS) $(HDRS) $(DOCS) \
		$(MDOC) *.a60 test/* examples/* micro/*
	$(RM) -f $(PRG).bak

tar:		$(MDOC) msrc
	gtar -cvzf $(PRG).tar.Z $(UTIL) $(EXTRA) $(SRCS) $(HDRS) \
		$(DOCS) $(MDOC) *.a60 $(TESA) $(TEXT) 

save:		tar
	mv $(PRG).tar.Z ../TAR

##
## text-formatting fun:
##
doc:	docclean
	latex RRA60.texinfo
	dvips -t a4 -o RRA60-a4.ps RRA60.dvi
	ln RRA60-a4.ps RRA60.ps
	dvips -t letter -o RRA60-us.ps RRA60.dvi
	rm -f RRA60.dvi RRA60.log RRA60.aux
	tex a60.texinfo
	dvips a60.dvi
	texi2html a60.texinfo
	rm -f a60.dvi a60.log 
	rm -f a60.aux a60.toc a60.cp a60.fn a60.vr a60.tp a60.ky a60.pg
##
## depend:
##	makedepend -- $(FLAGS) -- $(SRCS)
##
depend:
	cp Makefile Makefile.bak
	sed -e '/^# DO NOT DELETE THIS LINE/,$$d' < Makefile.bak > Makefile
	echo '# DO NOT DELETE THIS LINE' >> Makefile
	echo ' ' >> Makefile
	$(CC) -MM $(FLAGS) $(DEFS) $(SRCS) >> Makefile

# DO NOT DELETE THIS LINE

