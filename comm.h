/*
 * Copyright (C) 1991-1996 Erik Schoenfelder (schoenfr@ibr.cs.tu-bs.de)
 *
 * This file is part of NASE A60.
 * 
 * NASE A60 is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * NASE A60 is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with NASE A60; see the file COPYING.  If not, write to the Free
 * Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * comm.h:					oct '90
 *
 * Erik Schoenfelder (schoenfr@ibr.cs.tu-bs.de)
 *
 * some common stuff for the sources.
 */

#ifndef COMM_H_HOOK
#define COMM_H_HOOK

#include <stdio.h>
#include <math.h>

/*
 * config.h is created bu configure from config.h.in.
 */
#ifdef HAVE_CONFIG_H
# include "config.h"
#else
# ifdef _POSIX_SOURCE
#  define HAVE_UNISTD_H
#  define HAVE_STRING_H
#  define HAVE_STDLIB_H
# endif
#endif

#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#ifdef HAVE_STRING_H
#include <string.h>
#endif
#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif

#ifdef AMIGA
/* not in stdio.h: */
extern FILE *freopen ();
#endif

/*
 * define NO_ENUMS, if the header files are changed (see ENUM.README).
 */

#ifdef NO_ENUMS
#define ENUM
#else /* ! NO_ENUMS */
#define ENUM enum
#endif /* ! NO_ENUMS */


/*
 * which C compiler for mkc-compilation:
 * (un*x choice)
 */

#ifndef CC_TO_USE
# define CC_TO_USE	"gcc"		/* love that engine */
# define MKC_GNUC_TARGET		/* Warp 9, Mr. Chekov */
#endif

#ifndef CC_OPTS
# ifdef MKC_GNUC_TARGET
#  define CC_OPTS		"-w"	/* ignore quentionable conversions */
# else
#  define CC_OPTS		""	/* none */
# endif
#endif


#endif /* COMM_H_HOOK */
