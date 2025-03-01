/*
 *  -*- c -*-
 * Copyright (C) 1991-1999 Erik Schoenfelder (schoenfr@ibr.cs.tu-bs.de)
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
 * a60-mkc.inc:						oct '90
 *
 * Header for use in automagically generated c-code from NASE A60.
 * Especially here are the routines about output formatting are
 * declared. (Field width, etc.)
 */

#include <string.h>

#ifndef NOT_FOR_MKC_C
/*
 * the large following part is for use in mkc output.
 */
#include <stdio.h>
#include <math.h>

#ifdef __STDC__
#include <stdarg.h>
#else /* ! __STDC__ */
#include <varargs.h>
#endif /* ! __STDC__ */

/*
 * substitution for the output routines:
 */

#define B_OUTSTR(i,str)	b_outstr ((long) i, (char *) str)
#define B_OUTREAL(i,x)	b_outreal ((long) i, (double) x)
#define B_OUTINT(i,j)	b_outint ((long) i, (long) j)
#define B_OUTSYMB(ii,s,j) b_outsym ((long) ii, (char *) s, (long) j)
#define B_INSYMB(ii,s,j) (j = b_insym ((long) ii, (char *) s))
#define B_INREAL(ii,x) (x = b_inreal ((long) ii))
#define B_PRINT(xx,f1,f2) b_print ((double) xx, (long) f1, (long) f2)
#define B_LENGTH(S)	b_length ((char *) S)
#define B_VPRINT	printf
#define B_SIGN		b_sign
#define B_ABS		b_abs
#define B_RAND		b_rand

#define LONG_MIN	(-LONG_MAX-1)
#define LONG_MAX	2147483647L

#define RVALTRUNC(x)	(((x) > (double) LONG_MAX) \
	 ? LONG_MAX : ((x) < (double) LONG_MIN) \
	 ? LONG_MIN : (long) (x))

#define B_ENTIER(x) (b_entier ((double) x))


/*
 * Memory allocation:
 */

#define NTALLOC(T,N) \
	((T *) malloc ((unsigned) (N * sizeof(T))))

extern char *malloc ();


/*
 * array description:
 */

#define MAXBOUND	16

typedef struct {
    long bnd [MAXBOUND][3];
    long siz, dim;
    union { double *d; long *l; } data;
} arrdesc;

#define DUP_DATA(D, SIZ, T) \
	{ char * new = (char *) NTALLOC (T, SIZ); \
	  int i; for (i=0; i<sizeof(T)*(SIZ); i++) \
		  new[i] = ((char *) (D))[i]; \
	  D = (T *) new; }

/*
 * access to the array elements:
 */

/* VARARGS */
static int
#ifdef __STDC__
gidx (arrdesc *ad, ...)
#else
gidx (ad, va_alist)
arrdesc *ad;
va_dcl
#endif
{
	va_list pvar;
	int i, idx = 0;
	long val;
	
#ifdef __STDC__
	va_start (pvar, ad);
#else
	va_start (pvar);
#endif

	for (i=0; i<ad->dim; i++) {

		val = va_arg(pvar, long);
		idx += (val - ad->bnd [i][0]) * ad->bnd [i][2];
	}

#ifdef __STDC__
	va_start (pvar, ad);
#else
	va_end (pvar);
#endif

	return idx;
}

#endif /* NOT_FOR_MKC_C */

/*
 * this is for both mkc and the interpreter:
 */

#ifndef M_E
#define	M_E	((double) 2.718281828459045235)
#endif

#ifndef M_PI
#define	M_PI	((double) 3.141592653589793238)
#endif

#define B_PI()	M_PI


/*
 * the selected output channel. 1 is stdout, 2 is stderr. the other
 * ones are in/outfiles:
 * [** not finished **]
 */
static int outchan = 1;		/* the selected output channel. */

#define OUTFILE		((outchan == 1) ? stdout : \
			 (outchan == 2) ? stderr : \
			 (outchan <= 0) ? stdout : \
			 (outchan >= outf_max) ? stdout : \
			 (outfiles [outchan] == 0) ? stdout : \
			 outfiles [outchan])

/*
 * here the currently active file are stored.
 * [** this is still unused -- not finished **]
 */
#define MAXOUTFILES	16
static FILE *outfiles [MAXOUTFILES];
static int outf_max = 0;


/*
 * general defines and functions:
 */

#define sign(x) ((x) > 0 ? 1 : (x) < 0 ? (-1) : 0)

#ifndef NOT_FOR_MKC_C
static double
b_abs (x)
double x;
{
	return (x < 0) ? -x : x ;
}
#endif /* ! NOT_FOR_MKC_C */


static double
b_sign (x)
double x;
{
	return (x < 0) ? -1 : (x > 0) ? 1 : 0 ;
}

static long
b_entier (x)
double x;
{
	long val;

	if (x < 0) {
		val = - (RVALTRUNC(-x));
		if ((double) val != x)
			val -= 1;
	}
	else
		val = RVALTRUNC(x);

	return val;
}


/*
 * create a random number between 0 and 1;
 * ugly ? don't care. only doit.
 */

static double
b_rand ()
{
	static int first_time = 1;
	static double rnum;
#ifndef NO_TIME_FUNC
	extern long time ();
#endif

	if (first_time) {
		first_time = 0;
#ifdef NO_TIME_FUNC
		/* sorry folks */
		rnum = 1.0;
#else
		rnum = time ((long) 0) & 0xffffffl;
#endif
	}

	/* use anywhat ... (change and truncate) */

	rnum = rnum * M_PI + M_E;
	rnum -= (long) rnum;

#ifdef NOT_FOR_MKC_C
	if (rnum >= 1.0)
		xabort ("INTERNAL: r_rand: rand >= 1.0 !");
#endif

	return rnum;
}

static void
b_outreal (chan, val)
long chan;
double val;
{
	char tmp[80];

	/* choose what format ??? */
#ifdef AMIGA
	/* bad exactness (sp?) of double arithmetic */
	sprintf (tmp, " %.8g ", val);
#else

	/* 
	 * printf ("%g",  - 0.0) gives: -0
	 * (at least for sunos and linux...)
	 * i like to prevent this:
	 */

	if (val == 0.0)
	  strcpy (tmp, " 0 ");
	else
	  sprintf (tmp, " %.12g ", val);
#endif
	
	if (chan == 1) {
		printf ("%s", tmp);
		fflush (stdout);
	}
	else if (chan == 2) {
		fprintf (stderr, "%s", tmp);
		fflush (stderr);
	}
	else {
		printf (" CHANNEL %ld:%s", chan, tmp);
		fflush (stdout);
	}
}

static void
b_outint (chan, val)
long chan, val;
{
	char tmp[80];

	/*
	 * format the integer (check about 0 helps to aviod 
	 * output of -0): 
	 */	
	if (! val)
	  strcpy (tmp, " 0 ");
	else
	  sprintf (tmp, " %ld ", val);
	
	if (chan == 1) {
		printf ("%s", tmp);
		fflush (stdout);
	}
	else if (chan == 2) {
		fprintf (stderr, "%s", tmp);
		fflush (stderr);
	}
	else {
		printf (" CHANNEL %ld:%s", chan, tmp);
		fflush (stdout);
	}
}


static void
b_outstr (chan, val)
long chan;
char *val;
{
	if (chan == 1) {
		printf ("%s", (val) ? val : "");
		fflush (stdout);
	}
	else if (chan == 2) {
		fprintf (stderr, "%s", (val) ? val : "");
		fflush (stderr);
	}
	else {
		printf (" CHANNEL %ld: %s", chan, (val) ? val : "");
		fflush (stdout);
	}
}

static void
b_outsym (chan, val, idx)
long chan;
char *val;
long idx;
{
	char ctmp[2];

	if (! val)
		val = "";
	
	if (idx < 0) {
		ctmp[0] = -idx;
	}
	else {
		if (idx < strlen (val))
			ctmp[0] = val[idx];
		else
			ctmp[0] = 0;
	}
	ctmp[1] = 0;

	val = ctmp;

	if (chan == 1) {
		printf ("%s", val);
		fflush (stdout);
	}
	else if (chan == 2) {
		fprintf (stderr, "%s", val);
		fflush (stderr);
	}
	else {
		printf (" CHANNEL %ld: %s", chan, val);
		fflush (stdout);
	}
}


static long
b_insym (chan, str)
long chan;
char *str;
{
	long idx, val;

	if (chan == 0)
		val = getchar ();
	else {
		/* ignore and read anyway from stdin */
		/* [** should be fixed **] */
		val = getchar ();
	}

	if (val == EOF)
		return (long) 0;

	for (idx = 0; str && *str && *str != val; str++, idx++);

	if (! str || ! *str)
		return -val;
	else
		return idx;
}


static double
b_inreal (chan)
long chan;
{
	double val;
	char *fmt;
	int rc;

#ifdef pyr
	/* don't know why... */
        fmt = "%lf";
#else
	fmt = "%le";
#endif

	if (chan == 0)
		rc = scanf (fmt, &val);
	else {
		/* ignore and read anyway from stdin */
		/* [** should be fixed **] */
		rc = scanf (fmt, &val);
	}

	if (rc != 1)
		return (double) 0;

	return val;
}

/*
 * print the real value, using the format given by f1 and f2. here the
 * c-printf format is used...
 * the real number is followd by two spaces.
 */

static void
b_print (val, f1, f2)
double val;
long f1, f2;
{
	char fmt [20];

	if (f1 <= 0 && f2 <= 0)
		sprintf (fmt, "%%g");
	else {
		sprintf (fmt, "%%");
		if (f1 > 0)
			sprintf (fmt+strlen(fmt), "%ld", f1);
		sprintf (fmt+strlen(fmt), ".");
		if (f2 > 0)
			sprintf (fmt+strlen(fmt), "%ld", f2);
		sprintf (fmt+strlen(fmt), "g  ");
	}
	
	fprintf (OUTFILE, fmt, val);
	fflush (OUTFILE);
}


/*
 * return the length of the given string.
 */

static long
b_length (s)
char *s;
{
	return (s) ? strlen (s) : 0;
}

/* end of a60-mkc.inc */
