typedef union {
	long itype;
	double rtype;
	char *str;
	TREE *tree;
	SYMTAB *sym;
	EXPR *expr;
	BOUND *bound;
	LHELM *lhelm;
	MINDEX *mindex;
	FORELM *forelm;
	FORSTMT *forstmt;
	OWNTYPE otype;
	ENUM type_tag typ;
} YYSTYPE;
#define	TCOMMENT	257
#define	TTEN	258
#define	TBEGIN	259
#define	TEND	260
#define	TGOTO	261
#define	TFOR	262
#define	TDO	263
#define	TWHILE	264
#define	TSTEP	265
#define	TUNTIL	266
#define	TIF	267
#define	TTHEN	268
#define	TELSE	269
#define	TSWITCH	270
#define	TPROC	271
#define	TVALUE	272
#define	TCODE	273
#define	TTRUE	274
#define	TFALSE	275
#define	TINTEGER	276
#define	TREAL	277
#define	TBOOL	278
#define	TLABEL	279
#define	TOWN	280
#define	TARRAY	281
#define	TSTRING	282
#define	TPOW	283
#define	TDIV	284
#define	TASSIGN	285
#define	TLESS	286
#define	TNOTGREATER	287
#define	TEQUAL	288
#define	TNOTLESS	289
#define	TGREATER	290
#define	TNOTEQUAL	291
#define	TAND	292
#define	TOR	293
#define	TNOT	294
#define	TIMPL	295
#define	TEQUIV	296
#define	INUM	297
#define	RNUM	298
#define	NAME	299
#define	STRING	300
#define	UNARY	301


extern YYSTYPE yylval;
