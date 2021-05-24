/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 2 "oxout.y" /* yacc.c:339  */

#line 9 "oxout.y" /* yacc.c:339  */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "list.h"
#include "tree.h"

#include "code_injection.h"

#include "code_generator.h"

#include "implemented_meth_list.h"

void yyerror(char const*);

extern int yylex();

extern void burm_reduce(NODEPTR_TYPE, int);
extern void burm_label(NODEPTR_TYPE);

char* lastIfLabelName = "label";
long varCounter = 0;

char* prepareLabelString(char* classname, char* functionname, long counter)
{
    char *ifName = calloc(strlen(lastIfLabelName) + strlen(classname) + strlen(functionname) + 25 + counter, sizeof(char));
    sprintf(ifName, "%s_%s_%s_%d", lastIfLabelName, classname, functionname, counter);
    return ifName;
}

#line 88 "oxout.y" /* yacc.c:339  */



struct yyyT1 { long value; }; 
typedef struct yyyT1 *yyyP1; 


struct yyyT2 { char *name; int lineNr; }; 
typedef struct yyyT2 *yyyP2; 


struct yyyT3 { node_t* in; node_t* out; meth_node_t* inImplList; meth_node_t* outImplList; }; 
typedef struct yyyT3 *yyyP3; 


struct yyyT4 { node_t* in; node_t* out; }; 
typedef struct yyyT4 *yyyP4; 


struct yyyT5 { node_t* in; }; 
typedef struct yyyT5 *yyyP5; 


struct yyyT6 { node_t* ids; }; 
typedef struct yyyT6 *yyyP6; 


struct yyyT7 { node_t* in; char* currentClassName; char* currentFunctionName; long ifcounter; }; 
typedef struct yyyT7 *yyyP7; 


struct yyyT8 { node_t* in; node_t* out; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; code_injection_t* injection; }; 
typedef struct yyyT8 *yyyP8; 


struct yyyT9 { node_t* in; node_t* out; tree_t* tree; char* currentClassName; char* currentFunctionName; long ifcounterIn; long ifcounterOut; }; 
typedef struct yyyT9 *yyyP9; 


struct yyyT10 { node_t* in; node_t* out; char* currentClassName; meth_node_t* inImplList; meth_node_t* outImplList; }; 
typedef struct yyyT10 *yyyP10; 


struct yyyT11 { node_t* ids; tree_t *tree; }; 
typedef struct yyyT11 *yyyP11; 
                                                      /*custom*/  
typedef unsigned char yyyWAT; 
typedef unsigned char yyyRCT; 
typedef unsigned short yyyPNT; 
typedef unsigned char yyyWST; 

#include <limits.h>
#define yyyR UCHAR_MAX  

 /* funny type; as wide as the widest of yyyWAT,yyyWST,yyyRCT  */ 
typedef unsigned short yyyFT;

                                                      /*stock*/  




struct yyyGenNode {void *parent;  
                   struct yyyGenNode **cL; /* child list */ 
                   yyyRCT *refCountList; 
                   yyyPNT prodNum;                      
                   yyyWST whichSym; /* which child of parent? */ 
                  }; 

typedef struct yyyGenNode yyyGNT; 



struct yyyTB {int isEmpty; 
              int typeNum; 
              int nAttrbs; 
              char *snBufPtr; 
              yyyWAT *startP,*stopP; 
             };  




extern struct yyyTB yyyTermBuffer; 
extern yyyWAT yyyLRCIL[]; 
extern void yyyGenLeaf(); 


#line 178 "oxout.y" /* yacc.c:339  */

#include <stdio.h>

int yyyYok = 1;
int yyyInitDone = 0;
char *yyySTsn;
yyyGNT *yyySTN;
int yyyGNSz = sizeof(yyyGNT);
int yyyProdNum,yyyRHSlength,yyyNattrbs,yyyTypeNum; 

extern yyyFT yyyRCIL[];

void yyyExecuteRRsection();
void yyyYoxInit();
void yyyYoxReset();
void yyyDecorate();
void yyyGenIntNode();
void yyyAdjustINRC();
void yyyPrune();
void yyyUnsolvedInstSearchTrav();
void yyyUnsolvedInstSearchTravAux();
void yyyerror();
void yyyShift();



#define yyyRSU(NUM1,NUM2,NUM3,NUM4) \
   yyyProdNum=NUM1;yyyRHSlength=NUM2;yyyNattrbs=NUM3;yyyTypeNum=NUM4;\
   if ((yychar <= 0) && (!yyyTermBuffer.isEmpty)) yyyShift(); 

#line 221 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTERFACE = 258,
    CLASS = 259,
    IMPLEMENTS = 260,
    VAR = 261,
    METHOD = 262,
    INT = 263,
    RETURN = 264,
    IF = 265,
    THEN = 266,
    ELSE = 267,
    WHILE = 268,
    DO = 269,
    NOT = 270,
    AND = 271,
    NEW = 272,
    THIS = 273,
    NULL_VAL = 274,
    END = 275,
    NUM = 276,
    ID = 277,
    ASSIGNOP = 278
  };
#endif
/* Tokens.  */
#define INTERFACE 258
#define CLASS 259
#define IMPLEMENTS 260
#define VAR 261
#define METHOD 262
#define INT 263
#define RETURN 264
#define IF 265
#define THEN 266
#define ELSE 267
#define WHILE 268
#define DO 269
#define NOT 270
#define AND 271
#define NEW 272
#define THIS 273
#define NULL_VAL 274
#define END 275
#define NUM 276
#define ID 277
#define ASSIGNOP 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 318 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   158

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  35
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  30
/* YYNRULES -- Number of rules.  */
#define YYNRULES  72
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  148

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   278

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      24,    25,    30,    29,    26,    31,    28,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    23,    27,
      32,    33,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    34
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   213,   213,   213,   224,   233,   239,   245,   250,   257,
     266,   272,   278,   283,   290,   295,   302,   307,   314,   324,
     334,   342,   352,   357,   364,   369,   376,   381,   389,   399,
     403,   410,   415,   422,   427,   434,   441,   449,   457,   463,
     468,   475,   480,   487,   492,   497,   505,   510,   515,   520,
     525,   530,   535,   540,   548,   553,   560,   565,   572,   577,
     584,   589,   596,   601,   607,   613,   619,   624,   630,   638,
     642,   648,   652
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INTERFACE", "CLASS", "IMPLEMENTS",
  "VAR", "METHOD", "INT", "RETURN", "IF", "THEN", "ELSE", "WHILE", "DO",
  "NOT", "AND", "NEW", "THIS", "NULL_VAL", "END", "NUM", "ID", "':'",
  "'('", "')'", "','", "';'", "'.'", "'+'", "'*'", "'-'", "'<'", "'='",
  "ASSIGNOP", "$accept", "yyyAugNonterm", "$@1", "Start", "Programm",
  "ProgrammStart", "Interface", "AbstraktMethodsLoop", "AbstraktMethod",
  "ParamTypesLoop", "TypesLoop", "Class", "MemeberLoop", "ImplementsLoop",
  "Member", "Type", "Pars", "ParsLoop", "Par", "StatsMethode", "Stats",
  "Stat", "Expr", "OptionaNotTerm", "OptionalPlusTerm", "OptionalMalTerm",
  "OptionalAndTerm", "Term", "ParamsExpr", "ParamsExprLoop", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,    58,    40,    41,    44,    59,    46,    43,
      42,    45,    60,    61,   278
};
# endif

#define YYPACT_NINF -92

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-92)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -92,     5,    67,   -92,    -8,    -6,   -92,   -92,    67,    -2,
      25,    22,    79,   -92,   -92,   -92,    65,    55,    71,    80,
      65,   -92,    49,    93,    36,   -92,   -92,    69,    81,   -92,
      53,    86,   -92,    56,   -92,   -92,    87,    94,    -7,    95,
      97,    82,   -92,    96,   -92,   -92,    60,    -7,    99,    98,
     -92,    -7,    32,   -92,   -92,   -92,    -7,   -92,   -92,   102,
      11,   101,   105,   103,   -92,    -7,   106,    75,    75,    75,
      83,   108,   -92,   109,   -92,   100,    75,   112,   -92,   110,
     -92,   -92,    18,    11,   107,   -92,   -92,   113,   -92,   -92,
     124,   125,   -92,   114,   -92,   -92,    75,   115,   -92,    11,
      90,   116,    90,    90,    90,    90,    90,   -92,   -92,   -92,
     121,   -92,    -7,    11,    11,   -92,   -92,   -92,    -9,   119,
      89,   -18,   114,   114,   114,   -92,   111,    52,   126,   -92,
      64,   -92,   -92,    75,    11,   -92,   -92,   -92,   118,   122,
      75,   -92,   128,   -92,   -92,   123,   -92,   -92
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,     0,     6,     1,     0,     0,     3,     4,     6,     0,
       0,     0,     0,     5,     7,     8,    11,     0,     0,     0,
      11,    25,     0,     0,     0,     9,    10,     0,     0,    21,
       0,     0,    24,     0,    29,    30,     0,     0,     0,    15,
       0,     0,    19,     0,    23,    20,     0,     0,     0,    14,
      17,     0,     0,    22,    18,    13,     0,    16,    26,     0,
      38,     0,     0,    32,    12,     0,     0,     0,     0,     0,
       0,     0,    64,     0,    63,    66,     0,     0,    36,     0,
      45,    46,    54,    38,    31,    34,    35,     0,    66,    39,
       0,     0,    55,    54,    53,    65,     0,     0,    27,    38,
       0,     0,     0,     0,     0,     0,     0,    47,    48,    49,
       0,    33,     0,    38,    38,    44,    62,    37,    61,     0,
      57,    59,    50,    51,    52,    28,     0,     0,     0,    60,
       0,    56,    58,     0,    38,    40,    42,    67,    69,     0,
       0,    43,     0,    71,    68,    70,    41,    72
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -92,   -92,   -92,   -92,   142,   -92,   -92,   131,   -92,   -92,
     -92,   -92,   120,   -92,     7,   -38,   -92,   -92,    92,    72,
     -91,   -92,   -65,    88,    37,    31,    38,   -64,   -92,   -92
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     6,     7,     8,     9,    19,    20,    37,
      38,    10,    30,    23,    31,    39,    61,    62,    63,    77,
      78,    79,    80,    81,   107,   108,   109,    82,   139,   140
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      49,    34,    89,    90,    91,     3,    93,   100,   117,    55,
     101,    97,   103,    58,    11,    35,    12,    66,    64,   101,
      67,    68,   127,   128,    69,    14,    70,    86,    71,    72,
      73,   115,    74,    75,   100,    76,   118,    43,   120,   121,
     122,   123,   124,   142,    34,    16,   101,   102,   103,   104,
     105,   106,    15,    43,    59,    27,    28,    60,    35,    27,
      28,    36,    27,    28,   134,   138,    27,    28,   141,    29,
       4,     5,   135,    42,   126,   145,    45,    21,    22,    70,
      54,    71,    72,    73,    17,    74,    88,    18,    76,   137,
      70,    40,    71,    72,    73,    24,    74,    88,    70,    76,
      25,    72,    73,    41,    74,    88,    52,    76,    72,    73,
      47,    74,    88,    44,    76,    32,    33,   101,   102,    48,
      51,    50,    56,    53,    57,    65,    83,    59,    87,    85,
      94,    95,    98,   111,    96,   113,   112,    99,   119,   114,
     116,   125,   101,   130,   143,   133,   136,   144,   146,   147,
      13,    26,   132,    46,    84,   110,   129,   131,    92
};

static const yytype_uint8 yycheck[] =
{
      38,     8,    67,    68,    69,     0,    70,    16,    99,    47,
      28,    76,    30,    51,    22,    22,    22,     6,    56,    28,
       9,    10,   113,   114,    13,    27,    15,    65,    17,    18,
      19,    96,    21,    22,    16,    24,   100,    30,   102,   103,
     104,   105,   106,   134,     8,    23,    28,    29,    30,    31,
      32,    33,    27,    46,    22,     6,     7,    25,    22,     6,
       7,    25,     6,     7,    12,   130,     6,     7,   133,    20,
       3,     4,    20,    20,   112,   140,    20,    22,    23,    15,
      20,    17,    18,    19,     5,    21,    22,    22,    24,    25,
      15,    22,    17,    18,    19,    24,    21,    22,    15,    24,
      20,    18,    19,    22,    21,    22,    24,    24,    18,    19,
      23,    21,    22,    27,    24,    22,    23,    28,    29,    25,
      23,    26,    23,    27,    26,    23,    25,    22,    22,    26,
      22,    22,    20,    26,    34,    11,    23,    27,    22,    14,
      25,    20,    28,    24,    26,    34,    20,    25,    20,    26,
       8,    20,   121,    33,    62,    83,   118,   120,    70
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    36,    37,     0,     3,     4,    38,    39,    40,    41,
      46,    22,    22,    39,    27,    27,    23,     5,    22,    42,
      43,    22,    23,    48,    24,    20,    42,     6,     7,    20,
      47,    49,    22,    23,     8,    22,    25,    44,    45,    50,
      22,    22,    20,    49,    27,    20,    47,    23,    25,    50,
      26,    23,    24,    27,    20,    50,    23,    26,    50,    22,
      25,    51,    52,    53,    50,    23,     6,     9,    10,    13,
      15,    17,    18,    19,    21,    22,    24,    54,    55,    56,
      57,    58,    62,    25,    53,    26,    50,    22,    22,    57,
      57,    57,    58,    62,    22,    22,    34,    57,    20,    27,
      16,    28,    29,    30,    31,    32,    33,    59,    60,    61,
      54,    26,    23,    11,    14,    57,    25,    55,    62,    22,
      62,    62,    62,    62,    62,    20,    50,    55,    55,    61,
      24,    59,    60,    34,    12,    20,    20,    25,    57,    63,
      64,    57,    55,    26,    25,    57,    20,    26
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    35,    37,    36,    38,    39,    39,    40,    40,    41,
      42,    42,    43,    43,    44,    44,    45,    45,    46,    46,
      46,    46,    47,    47,    48,    48,    49,    49,    49,    50,
      50,    51,    51,    52,    52,    53,    54,    55,    55,    56,
      56,    56,    56,    56,    56,    56,    57,    57,    57,    57,
      57,    57,    57,    57,    58,    58,    59,    59,    60,    60,
      61,    61,    62,    62,    62,    62,    62,    62,    62,    63,
      63,    64,    64
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     2,     1,     2,     0,     2,     2,     5,
       2,     0,     6,     5,     2,     1,     3,     2,     7,     6,
       6,     5,     3,     2,     2,     1,     4,     6,     7,     1,
       1,     2,     1,     3,     2,     3,     1,     3,     0,     2,
       5,     7,     5,     6,     3,     1,     1,     2,     2,     2,
       3,     3,     3,     2,     1,     2,     3,     2,     3,     2,
       3,     2,     3,     1,     1,     2,     1,     5,     6,     1,
       2,     2,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 213 "oxout.y" /* yacc.c:1646  */
    {if (!yyyInitDone) 
		    {yyyYoxInit(); 
		     yyyInitDone = 1;
		    }
		 yyyYoxReset();
		}
#line 1498 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 220 "oxout.y" /* yacc.c:1646  */
    {
		 yyyDecorate(); yyyExecuteRRsection();
		}
#line 1506 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 225 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(1,1,0,0);
yyyGenIntNode();
 (((yyyP3)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->in) = newList();
                             (((yyyP3)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->inImplList) = newImplList();
                            yyyAdjustINRC(yyyRCIL+0,yyyRCIL+6);/*yyyPrune(1);*/}}
#line 1517 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 234 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(2,2,4,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+6,yyyRCIL+24);}}
#line 1526 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 239 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(3,0,4,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+24,yyyRCIL+30);}}
#line 1535 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 246 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(4,2,4,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+30,yyyRCIL+39);}}
#line 1544 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 251 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(5,2,4,3);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+39,yyyRCIL+51);}}
#line 1553 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 260 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(6,5,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+51,yyyRCIL+57);}}
#line 1562 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 267 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(7,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+57,yyyRCIL+66);}}
#line 1571 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 272 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(8,0,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+66,yyyRCIL+69);}}
#line 1580 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 279 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(9,6,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+69,yyyRCIL+78);}}
#line 1589 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 284 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(10,5,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+78,yyyRCIL+84);}}
#line 1598 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 291 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(11,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+84,yyyRCIL+90);}}
#line 1607 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 296 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(12,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+90,yyyRCIL+93);}}
#line 1616 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 303 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(13,3,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+93,yyyRCIL+99);}}
#line 1625 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 308 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(14,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+99,yyyRCIL+102);}}
#line 1634 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 318 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(15,7,4,3);
yyyGenIntNode();
 (((yyyP10)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->currentClassName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name) ;

                            yyyAdjustINRC(yyyRCIL+102,yyyRCIL+120);}}
#line 1645 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 328 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(16,6,4,3);
yyyGenIntNode();
 (((yyyP10)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->currentClassName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name) ;

                            yyyAdjustINRC(yyyRCIL+120,yyyRCIL+135);}}
#line 1656 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 337 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(17,6,4,3);
yyyGenIntNode();
 (((yyyP3)yyySTsn)->outImplList) = (((yyyP3)yyySTsn)->outImplList) ;
                        yyyAdjustINRC(yyyRCIL+135,yyyRCIL+144);}}
#line 1666 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 345 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(18,5,4,3);
yyyGenIntNode();
 (((yyyP3)yyySTsn)->outImplList) = (((yyyP3)yyySTsn)->outImplList) ;
                        yyyAdjustINRC(yyyRCIL+144,yyyRCIL+150);}}
#line 1676 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 353 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(19,3,5,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+150,yyyRCIL+174);}}
#line 1685 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 358 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(20,2,5,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+174,yyyRCIL+189);}}
#line 1694 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 365 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(21,2,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+189,yyyRCIL+192);}}
#line 1703 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 370 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(22,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+192,yyyRCIL+192);/*yyyPrune(22);*/}}
#line 1712 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 377 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(23,4,5,10);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+192,yyyRCIL+201);}}
#line 1721 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 382 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(24,6,5,10);
yyyGenIntNode();
 (((yyyP7)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->ifcounter) = 0;

                             (((yyyP7)(((char *)((yyySTN->cL)[4]))+yyyGNSz))->currentFunctionName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name);
                            yyyAdjustINRC(yyyRCIL+201,yyyRCIL+219);}}
#line 1733 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 390 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(25,7,5,10);
yyyGenIntNode();
 (((yyyP7)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->ifcounter) = 0;

                             (((yyyP7)(((char *)((yyySTN->cL)[5]))+yyyGNSz))->currentFunctionName) = (((yyyP2)(((char *)((yyySTN->cL)[1]))+yyyGNSz))->name);
                            yyyAdjustINRC(yyyRCIL+219,yyyRCIL+240);}}
#line 1745 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 400 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(26,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+240,yyyRCIL+240);/*yyyPrune(26);*/}}
#line 1754 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 404 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(27,1,1,5);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+240,yyyRCIL+240);/*yyyPrune(27);*/}}
#line 1763 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 411 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(28,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+240,yyyRCIL+249);}}
#line 1772 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 416 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(29,1,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+249,yyyRCIL+255);}}
#line 1781 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 423 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(30,3,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+255,yyyRCIL+264);}}
#line 1790 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 428 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(31,2,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+264,yyyRCIL+270);}}
#line 1799 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 435 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(32,3,2,4);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+270,yyyRCIL+276);}}
#line 1808 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 442 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(33,1,4,7);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->injection) = NULL;
                        yyyAdjustINRC(yyyRCIL+276,yyyRCIL+291);}}
#line 1818 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 450 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(34,3,7,8);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[2]))+yyyGNSz))->injection) = NULL;

                            yyyAdjustINRC(yyyRCIL+291,yyyRCIL+324);}}
#line 1829 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 457 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(35,0,7,8);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+324,yyyRCIL+330);}}
#line 1838 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 464 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(36,2,7,9);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+330,yyyRCIL+342);}}
#line 1847 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 469 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(37,5,7,9);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[3]))+yyyGNSz))->injection) = NULL;
                            
                            yyyAdjustINRC(yyyRCIL+342,yyyRCIL+369);}}
#line 1858 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 476 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(38,7,7,9);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+369,yyyRCIL+411);}}
#line 1867 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 481 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(39,5,7,9);
yyyGenIntNode();
 (((yyyP8)(((char *)((yyySTN->cL)[3]))+yyyGNSz))->injection) = NULL; /* TODO change later */
                             (((yyyP9)yyySTsn)->tree) = NULL; /*TODO change later */
                        yyyAdjustINRC(yyyRCIL+411,yyyRCIL+438);}}
#line 1878 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 488 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(40,6,7,9);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+438,yyyRCIL+453);}}
#line 1887 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 493 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(41,3,7,9);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+453,yyyRCIL+465);}}
#line 1896 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 498 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(42,1,7,9);
yyyGenIntNode();
 (((yyyP9)yyySTsn)->tree) = NULL; /*TODO change later check if this is really ok! */
                        yyyAdjustINRC(yyyRCIL+465,yyyRCIL+477);}}
#line 1906 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 506 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(43,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+477,yyyRCIL+483);}}
#line 1915 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 511 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(44,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+483,yyyRCIL+492);}}
#line 1924 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 516 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(45,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+492,yyyRCIL+501);}}
#line 1933 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 521 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(46,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+501,yyyRCIL+510);}}
#line 1942 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 526 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(47,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+510,yyyRCIL+519);}}
#line 1951 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 531 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(48,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+519,yyyRCIL+528);}}
#line 1960 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 536 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(49,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+528,yyyRCIL+537);}}
#line 1969 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 541 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(50,2,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = NULL; /*TODO change later */
                        yyyAdjustINRC(yyyRCIL+537,yyyRCIL+540);/*yyyPrune(50);*/}}
#line 1979 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 549 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(51,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+540,yyyRCIL+546);}}
#line 1988 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 554 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(52,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+546,yyyRCIL+552);}}
#line 1997 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 561 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(53,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+552,yyyRCIL+561);}}
#line 2006 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 566 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(54,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+561,yyyRCIL+567);}}
#line 2015 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 573 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(55,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+567,yyyRCIL+576);}}
#line 2024 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 578 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(56,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+576,yyyRCIL+582);}}
#line 2033 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 585 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(57,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+582,yyyRCIL+591);}}
#line 2042 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 590 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(58,2,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+591,yyyRCIL+597);}}
#line 2051 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 597 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(59,3,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+597,yyyRCIL+603);}}
#line 2060 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 602 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(60,1,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = createNumericalLeaf((((yyyP1)(((char *)((yyySTN->cL)[0]))+yyyGNSz))->value)); 
                        yyyAdjustINRC(yyyRCIL+603,yyyRCIL+606);/*yyyPrune(60);*/}}
#line 2070 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 608 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(61,1,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = createThisLeaf(); 
                        yyyAdjustINRC(yyyRCIL+606,yyyRCIL+609);/*yyyPrune(61);*/}}
#line 2080 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 614 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(62,2,2,11);
yyyGenIntNode();
/* check what ´NULL ID` does */ (((yyyP11)yyySTsn)->tree) = createNULLLeaf();
                            yyyAdjustINRC(yyyRCIL+609,yyyRCIL+612);/*yyyPrune(62);*/}}
#line 2090 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 620 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(63,1,2,11);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+612,yyyRCIL+615);}}
#line 2099 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 625 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(64,5,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = NULL; /*TODO change later */
                        yyyAdjustINRC(yyyRCIL+615,yyyRCIL+621);}}
#line 2109 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 631 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(65,6,2,11);
yyyGenIntNode();
 (((yyyP11)yyySTsn)->tree) = NULL; /*TODO change later */
                        yyyAdjustINRC(yyyRCIL+621,yyyRCIL+630);}}
#line 2119 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 639 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(66,1,1,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+630,yyyRCIL+633);}}
#line 2128 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 643 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(67,2,1,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+633,yyyRCIL+639);}}
#line 2137 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 649 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(68,2,1,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+639,yyyRCIL+642);}}
#line 2146 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 653 "oxout.y" /* yacc.c:1646  */
    {if(yyyYok){
yyyRSU(69,3,1,6);
yyyGenIntNode();
yyyAdjustINRC(yyyRCIL+642,yyyRCIL+648);}}
#line 2155 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2159 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 659 "oxout.y" /* yacc.c:1906  */

int main(void) {
        yyparse();
        return 0;
}
                                                      /*custom*/  
long yyyMaxNbytesNodeStg = 2000000; 
long yyyMaxNrefCounts =    500000; 
long yyyMaxNchildren =     60000; 
long yyyMaxStackSize =     2000; 
long yyySSALspaceSize =    20000; 
long yyyRSmaxSize =        1000; 
long yyyTravStackMaxSize = 2000; 


struct yyyTB yyyTermBuffer; 

char *yyyNodeAndStackSpace; 

char *yyyNodeSpace;
char *yyyNextNodeSpace; 
char *yyyAfterNodeSpace; 


 
struct yyyGenNode **yyyChildListSpace;  
struct yyyGenNode **yyyNextCLspace; 
struct yyyGenNode **yyyAfterChildListSpace; 



yyyRCT *yyyRefCountListSpace;
yyyRCT *yyyNextRCLspace;  
yyyRCT *yyyAfterRefCountListSpace;   



struct yyySolvedSAlistCell {yyyWAT attrbNum; 
                            long next; 
                           }; 
#define yyyLambdaSSAL 0 
long yyySSALCfreeList = yyyLambdaSSAL; 
long yyyNewSSALC = 1; 
 
struct yyySolvedSAlistCell *yyySSALspace; 


 
struct yyyStackItem {struct yyyGenNode *node; 
                     long solvedSAlist; 
                     struct yyyGenNode *oldestNode; 
                    };  

long yyyNbytesStackStg; 
struct yyyStackItem *yyyStack; 
struct yyyStackItem *yyyAfterStack; 
struct yyyStackItem *yyyStackTop; 



struct yyyRSitem {yyyGNT *node; 
                  yyyWST whichSym; 
                  yyyWAT wa;  
                 };  

struct yyyRSitem *yyyRS;  
struct yyyRSitem *yyyRSTop;  
struct yyyRSitem *yyyAfterRS;  
 





yyyFT yyyRCIL[] = {
0,0,0, 0,2,0, yyyR,1,1, yyyR,3,1, 0,0,1, 0,2,1, 
1,0,1, 1,2,1, yyyR,1,1, yyyR,3,1, yyyR,1,1, yyyR,3,1, 
0,0,1, yyyR,1,1, yyyR,3,1, 0,0,1, 0,2,1, yyyR,1,1, 
3,0,1, yyyR,1,1, 0,0,1, 1,0,1, yyyR,1,1, yyyR,1,1, 
2,0,1, 5,0,1, yyyR,1,1, 4,0,1, 0,0,1, 1,0,1, 
0,0,1, 0,0,1, 1,0,1, 0,0,1, yyyR,1,1, yyyR,3,1, 
3,0,1, 5,0,1, 5,2,0, 5,3,1, yyyR,1,1, yyyR,3,1, 
4,0,1, 4,2,0, 4,3,1, yyyR,1,1, yyyR,3,0, 3,0,1, 
yyyR,1,1, yyyR,3,0, yyyR,1,1, yyyR,4,1, 0,0,1, 0,2,1, 
0,3,1, 1,0,1, 1,2,1, 1,3,1, yyyR,1,1, yyyR,4,1, 
0,0,1, 0,2,1, 0,3,1, 0,0,1, yyyR,1,1, yyyR,4,1, 
3,0,1, yyyR,1,1, yyyR,4,2, 4,0,1, 4,1,1, 4,2,0, 
4,3,0, yyyR,1,1, yyyR,4,2, 3,0,1, 5,0,1, 5,1,1, 
5,2,0, 5,3,0, yyyR,1,1, 0,0,1, 1,0,1, yyyR,1,1, 
0,0,1, yyyR,1,1, 0,0,1, 1,0,1, yyyR,1,1, 0,0,1, 
yyyR,1,1, 2,0,1, 0,0,1, 0,2,1, 0,3,1, 0,4,1, 
0,6,0, yyyR,1,1, yyyR,5,1, 0,0,1, 0,3,1, 0,4,1, 
0,5,1, 2,0,1, 2,2,1, 2,3,1, 2,4,1, 2,6,0, 
yyyR,1,1, yyyR,5,1, yyyR,1,1, yyyR,2,1, yyyR,6,1, 1,0,1, 
yyyR,1,1, yyyR,2,4, yyyR,6,1, 1,0,1, 3,0,1, 3,2,1, 
3,3,1, 3,4,1, 3,6,0, yyyR,1,1, yyyR,2,4, yyyR,6,1, 
1,0,1, 3,0,1, 3,2,1, 3,3,1, 3,4,1, 3,6,3, 
5,0,1, 5,2,1, 5,3,1, 5,4,1, 5,6,3, yyyR,1,1, 
yyyR,2,0, yyyR,6,1, 1,0,1, 3,0,1, 3,2,1, 3,3,1, 
3,4,1, 3,6,0, yyyR,1,1, yyyR,2,2, yyyR,6,1, 3,0,1, 
5,0,1, yyyR,1,1, yyyR,2,2, yyyR,6,1, 2,0,1, yyyR,1,1, 
yyyR,2,0, yyyR,6,1, 0,0,1, yyyR,1,1, 0,0,1, yyyR,1,2, 
0,0,1, 1,0,1, yyyR,1,2, 0,0,1, 1,0,1, yyyR,1,2, 
0,0,1, 1,0,1, yyyR,1,2, 0,0,1, 2,0,1, yyyR,1,2, 
0,0,1, 2,0,1, yyyR,1,2, 0,0,1, 2,0,1, yyyR,1,0, 
yyyR,1,1, 0,0,1, yyyR,1,1, 1,0,1, yyyR,1,2, 1,0,1, 
2,0,1, yyyR,1,1, 1,0,1, yyyR,1,2, 1,0,1, 2,0,1, 
yyyR,1,1, 1,0,1, yyyR,1,2, 1,0,1, 2,0,1, yyyR,1,1, 
1,0,1, yyyR,1,1, 1,0,1, yyyR,1,0, yyyR,1,0, yyyR,1,0, 
yyyR,1,1, yyyR,1,0, 0,0,1, yyyR,1,0, 0,0,1, 4,0,1, 
0,0,1, 0,0,1, 1,0,1, 0,0,1, 0,0,1, 1,0,1, 

};

short yyyIIIEL[] = {0,
0,2,5,6,9,12,18,21,22,29,
35,38,40,44,47,55,62,69,75,79,
82,85,87,92,99,107,109,111,114,116,
120,123,127,129,133,134,137,143,151,157,
164,168,170,172,175,178,181,185,189,193,
196,198,201,205,208,212,215,219,222,226,
228,230,233,235,241,248,250,253,256,
};

long yyyIIEL[] = {
0,0,4,8,12,16,20,24,26,26,30,34,
34,36,36,38,38,40,40,42,44,46,48,50,
52,52,53,53,53,54,56,58,58,58,58,59,
60,61,62,63,64,65,66,67,67,68,69,69,
73,73,75,75,76,76,81,81,85,85,87,87,
87,92,92,96,96,98,98,99,99,99,103,103,
105,105,105,105,110,115,120,120,125,130,130,131,
132,134,135,137,142,142,144,144,145,150,150,152,
152,152,156,156,161,161,163,163,165,165,169,169,
170,170,171,173,175,177,179,181,183,185,187,189,
189,191,193,193,195,197,197,198,202,209,216,223,
223,230,237,244,244,246,253,253,255,255,262,262,
269,269,271,271,278,278,285,285,292,292,294,294,
301,301,308,308,310,310,311,311,313,320,322,322,
324,331,333,335,337,339,341,343,345,347,349,351,
353,355,357,359,359,361,363,365,365,367,369,371,
371,373,375,375,377,379,381,383,383,385,387,387,
389,391,393,393,395,397,397,399,401,403,403,405,
407,407,409,411,413,413,415,417,417,419,419,421,
422,424,424,426,426,428,430,432,434,436,436,438,
438,438,440,442,442,444,444,445,445,446,448,449,
450,452,453,455,455,456,457,459,
};

long yyyIEL[] = {
0,0,0,0,0,2,2,4,
4,4,6,6,8,8,10,10,
12,14,14,16,16,18,18,20,
20,20,22,24,24,26,26,26,
28,28,30,32,32,34,36,36,
38,40,40,40,42,42,44,46,
46,52,52,54,56,56,56,60,
60,62,64,64,68,68,68,70,
70,74,74,74,76,76,82,82,
84,84,90,94,94,94,94,94,
94,96,100,100,102,102,108,112,
112,112,112,112,114,118,118,118,
118,120,122,122,124,124,124,124,
126,128,130,130,134,136,136,136,
138,138,138,140,140,142,142,142,
144,146,146,148,150,150,150,152,
152,152,154,156,156,156,156,156,
156,156,160,160,160,162,162,164,
166,166,170,170,174,176,176,180,
180,180,180,180,180,184,184,188,
190,190,194,194,194,196,196,196,
196,196,196,196,196,196,198,198,
198,200,200,202,204,204,204,206,
208,208,208,210,210,212,214,214,
214,216,220,220,222,224,224,226,
228,230,232,232,232,232,232,232,
232,232,234,234,238,242,244,244,
244,244,246,246,246,246,246,248,
248,250,250,250,250,252,252,254,
254,254,254,256,256,256,260,260,
260,260,260,262,262,262,264,270,
270,270,272,274,278,278,278,280,
280,280,282,284,284,286,286,294,
294,294,298,302,310,310,310,312,
312,312,318,324,324,326,326,326,
326,326,326,326,328,328,334,334,
334,336,338,340,340,340,340,340,
340,340,340,340,342,342,350,350,
350,350,350,352,352,356,358,358,
358,360,366,366,366,366,366,368,
368,370,370,370,372,376,376,376,
376,376,378,378,378,378,380,380,
380,382,386,386,386,388,388,390,
394,394,394,396,396,398,402,402,
402,404,404,406,410,410,410,412,
412,414,418,418,418,420,420,422,
426,426,426,428,428,430,430,430,
430,430,432,432,432,434,436,436,
436,438,442,442,442,444,444,446,
448,448,448,450,454,454,454,456,
456,458,460,460,460,462,466,466,
466,468,468,470,472,472,472,474,
476,476,476,478,478,478,480,480,
480,480,480,480,480,482,482,484,
484,486,486,486,486,486,486,490,
490,490,490,490,490,490,492,492,
492,496,496,496,496,498,498,498,
502,502,502,502,
};

yyyFT yyyEntL[] = {
1,0,1,2,2,0,2,2,0,1,0,3,0,1,0,3,
1,0,0,3,0,1,1,0,1,2,0,1,0,3,4,0,
4,0,4,0,0,1,1,0,2,0,0,1,0,1,0,1,
6,0,3,0,0,1,0,1,0,1,5,0,0,1,0,1,
2,0,1,0,1,0,2,0,1,0,1,0,0,1,4,0,
6,0,6,3,0,1,6,2,6,0,0,1,6,0,0,3,
0,1,5,0,5,3,0,1,5,2,5,0,0,1,5,0,
0,3,0,1,4,0,0,1,0,1,0,1,0,1,0,1,
1,0,2,2,1,2,1,3,2,0,2,3,0,1,0,4,
1,0,1,2,1,3,0,1,0,4,1,0,0,1,4,0,
0,4,0,1,0,1,0,1,5,0,0,4,5,1,0,4,
0,4,5,2,0,1,4,0,0,4,6,1,0,4,0,4,
6,2,6,0,1,0,2,0,0,1,1,0,0,1,1,0,
2,0,0,1,1,0,0,1,0,1,3,0,0,1,0,1,
1,0,1,2,1,3,1,4,1,0,3,2,1,3,3,3,
1,4,1,5,3,0,3,4,0,1,0,5,0,1,0,5,
0,1,2,0,0,6,0,2,0,1,4,0,2,0,4,2,
4,3,0,2,4,4,0,2,0,2,0,2,0,6,0,1,
6,0,4,0,2,0,6,2,4,2,6,3,4,3,0,2,
6,6,4,6,4,4,0,2,0,2,6,6,4,6,0,2,
6,6,4,6,6,4,0,6,0,1,4,0,2,0,4,2,
4,3,4,4,0,6,0,1,0,2,4,0,6,0,0,6,
0,1,0,2,0,1,0,2,0,1,0,2,3,0,0,6,
0,2,0,2,0,1,1,0,0,6,1,0,0,1,2,0,
1,0,0,1,0,1,2,0,1,0,0,1,0,1,2,0,
1,0,0,1,0,1,3,0,1,0,0,1,0,1,3,0,
1,0,0,1,0,1,3,0,1,0,0,1,0,1,1,0,
0,1,2,0,0,1,3,0,2,0,0,1,0,1,2,0,
0,1,3,0,2,0,0,1,0,1,2,0,0,1,3,0,
2,0,0,1,0,1,2,0,0,1,2,0,0,1,0,1,
0,1,0,1,1,0,5,0,1,0,1,0,2,0,1,0,
1,0,2,0,1,0,
};

#define yyyPermitUserAlloc  0 


void yyyfatal(msg)
  char *msg; 
{fprintf(stderr,msg);exit(-1);} 



#define yyyNSof   'n' 
#define yyyRCof   'r' 
#define yyyCLof   'c' 
#define yyySof    's' 
#define yyySSALof 'S' 
#define yyyRSof   'q' 
#define yyyTSof   't' 



void yyyHandleOverflow(which) 
  char which; 
  {char *msg1,*msg2; 
   long  oldSize,newSize; 
   switch(which) 
     {
      case yyyNSof   : 
           msg1 = "node storage overflow: ";
           oldSize = yyyMaxNbytesNodeStg; 
           break; 
      case yyyRCof   : 
           msg1 = "dependee count overflow: ";
           oldSize = yyyMaxNrefCounts; 
           break; 
      case yyyCLof   : 
           msg1 = "child list overflow: ";
           oldSize = yyyMaxNchildren; 
           break; 
      case yyySof    : 
           msg1 = "parse-tree stack overflow: ";
           oldSize = yyyMaxStackSize; 
           break; 
      case yyySSALof : 
           msg1 = "SSAL overflow: ";
           oldSize = yyySSALspaceSize; 
           break; 
      case yyyRSof   : 
           msg1 = "ready set overflow: ";
           oldSize = yyyRSmaxSize; 
           break; 
      case yyyTSof   : 
           msg1 = "traversal stack overflow: ";
           oldSize = yyyTravStackMaxSize; 
           break; 
      default        :;  
     }
   newSize = (3*oldSize)/2; 
   if (newSize < 100) newSize = 100; 
   fprintf(stderr,msg1); 
   fprintf(stderr,"size was %d.\n",oldSize); 
   if (yyyPermitUserAlloc) 
      msg2 = "     Try -Y%c%d option.\n"; 
      else 
      msg2 = "     Have to modify evaluator:  -Y%c%d.\n"; 
   fprintf(stderr,msg2,which,newSize); 
   exit(-1); 
  }



void yyySignalEnts(node,startP,stopP) 
  register yyyGNT *node; 
  register yyyFT *startP,*stopP;  
  {register yyyGNT *dumNode; 

   while (startP < stopP)  
     {
      if (!(*startP)) dumNode = node;  
         else dumNode = (node->cL)[(*startP)-1];   
      if (!(--((dumNode->refCountList)[*(startP+1)]
              ) 
           )
         ) 
         { 
          if (++yyyRSTop == yyyAfterRS) 
             {yyyHandleOverflow(yyyRSof); 
              break; 
             }
          yyyRSTop->node = dumNode; 
          yyyRSTop->whichSym = *startP;  
          yyyRSTop->wa = *(startP+1);  
         }  
      startP += 2;  
     }  
  } 




#define yyyCeiling(num,inc) (((inc) * ((num)/(inc))) + (((num)%(inc))?(inc):0)) 



int yyyAlignSize = 8;
int yyyNdSz[12];

int yyyNdPrSz[12];

typedef int yyyCopyType;

int yyyNdCopySz[12];
long yyyBiggestNodeSize = 0;

void yyyNodeSizeCalc()
  {int i;
   yyyGNSz = yyyCeiling(yyyGNSz,yyyAlignSize); 
   yyyNdSz[0] = 0;
   yyyNdSz[1] = sizeof(struct yyyT1);
   yyyNdSz[2] = sizeof(struct yyyT2);
   yyyNdSz[3] = sizeof(struct yyyT3);
   yyyNdSz[4] = sizeof(struct yyyT4);
   yyyNdSz[5] = sizeof(struct yyyT5);
   yyyNdSz[6] = sizeof(struct yyyT6);
   yyyNdSz[7] = sizeof(struct yyyT7);
   yyyNdSz[8] = sizeof(struct yyyT8);
   yyyNdSz[9] = sizeof(struct yyyT9);
   yyyNdSz[10] = sizeof(struct yyyT10);
   yyyNdSz[11] = sizeof(struct yyyT11);
   for (i=0;i<12;i++) 
       {yyyNdSz[i] = yyyCeiling(yyyNdSz[i],yyyAlignSize); 
        yyyNdPrSz[i] = yyyNdSz[i] + yyyGNSz;
        if (yyyBiggestNodeSize < yyyNdSz[i])
           yyyBiggestNodeSize = yyyNdSz[i];
        yyyNdCopySz[i] = yyyCeiling(yyyNdSz[i],sizeof(yyyCopyType)) / 
                         sizeof(yyyCopyType); 
       }
  }




void yyySolveAndSignal() {
register long yyyiDum,*yyypL;
register int yyyws,yyywa;
register yyyGNT *yyyRSTopN,*yyyRefN; 
register void *yyyRSTopNp; 


yyyRSTopNp = (yyyRSTopN = yyyRSTop->node)->parent;
yyyRefN= (yyyws = (yyyRSTop->whichSym))?((yyyGNT *)yyyRSTopNp):yyyRSTopN;
yyywa = yyyRSTop->wa; 
yyyRSTop--;
switch(yyyRefN->prodNum) {
case 1:  /***yacc rule 1***/
  switch (yyyws) {
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 2:  /***yacc rule 2***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outImplList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;
                                break;
    }
  break;
  }
break;
case 3:  /***yacc rule 3***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                            break;
    }
  break;
  }
break;
case 4:  /***yacc rule 4***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                    break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                    break;
    }
  break;
  }
break;
case 5:  /***yacc rule 5***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP3)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    }
  break;
  }
break;
case 6:  /***yacc rule 6***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),INTERFACE_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Interface Id hinzufuegen");
                                break;
    }
  break;
  }
break;
case 7:  /***yacc rule 7***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                    break;
    }
  break;
  }
break;
case 8:  /***yacc rule 8***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 9:  /***yacc rule 9***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"AbstrakteMethod methoden ID hinzufuegen (Mit params)");
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 10:  /***yacc rule 10***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),ABSTRACT_METH,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"AbstrakteMethod methoden ID hinzufuegen (ohne params)");
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 11:  /***yacc rule 11***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                            break;
    }
  break;
  }
break;
case 12:  /***yacc rule 12***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 13:  /***yacc rule 13***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 14:  /***yacc rule 14***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;   
                            break;
    }
  break;
  }
break;
case 15:  /***yacc rule 15***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id");
                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->outImplList) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev(duplicate((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"CLass Id hinzufuegen für Member");
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    }
  break;
  }
break;
case 16:  /***yacc rule 16***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id2");

                                break;
    case 3:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[4]))+yyyGNSz))->outImplList) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = addDev(duplicate((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"CLass Id hinzufuegen für Member2");
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                                break;
    }
  break;
  }
break;
case 17:  /***yacc rule 17***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id3");
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    }
  break;
  }
break;
case 18:  /***yacc rule 18***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP3)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP3)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_DING,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Add von Class out der Class id4");

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 19:  /***yacc rule 19***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->outImplList) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;
                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList);
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;

                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;
                                break;
    }
  break;
  }
break;
case 20:  /***yacc rule 20***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->outImplList) ;

                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                                break;
    case 2:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName) ;

                                break;
    case 3:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->inImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList);
                                break;
    }
  break;
  }
break;
case 21:  /***yacc rule 21***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP5)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 22:  /***yacc rule 22***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 23:  /***yacc rule 23***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),CLASS_VAR,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Id von member hinzfuegen");
                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ; 

                                break;
    }
  break;
  }
break;
case 24:  /***yacc rule 24***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in);

                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = addImpl((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList), (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name));
                            
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 1:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    }
  break;
  }
break;
case 25:  /***yacc rule 25***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->out) = duplicate((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in));
                                break;
    case 4:
 (((yyyP10)(((char *)yyyRSTopN)+yyyGNSz))->outImplList) = addImpl((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->inImplList), (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name));

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = duplicate((((yyyP10)(((char *)yyyRefN)+yyyGNSz))->in));
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->out) ;

                                break;
    case 1:
 (((yyyP7)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP10)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    }
  break;
  }
break;
case 26:  /***yacc rule 26***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 27:  /***yacc rule 27***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 28:  /***yacc rule 28***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  }
break;
case 29:  /***yacc rule 29***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 30:  /***yacc rule 30***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    }
  break;
  }
break;
case 31:  /***yacc rule 31***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP4)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 32:  /***yacc rule 32***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP4)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev((((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name),PARAMETER,(((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->lineNr),"Paramter id hinzufuegen");
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP4)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                            break;
    }
  break;
  }
break;
case 33:  /***yacc rule 33***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP7)(((char *)yyyRefN)+yyyGNSz))->ifcounter);

                                break;
    }
  break;
  }
break;
case 34:  /***yacc rule 34***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP8)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->out);

                                break;
    case 5:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 3:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 4:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 5:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->out) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);
                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  }
break;
case 35:  /***yacc rule 35***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 5:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  }
break;
case 36:  /***yacc rule 36***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_RETURN, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), NULL);

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 37:  /***yacc rule 37***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_IF, createIfLabelLeaf(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn))), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree));
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                yyySignalEnts(yyyRefN,yyyEntL+280,yyyEntL+282);
    break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                yyySignalEnts(yyyRefN,yyyEntL+282,yyyEntL+284);
    break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    }
  break;
  }
break;
case 38:  /***yacc rule 38***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_IF_ELSE, createIfLabelLeaf(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn))), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree));
                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ; 
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                yyySignalEnts(yyyRefN,yyyEntL+312,yyyEntL+318);
    break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                yyySignalEnts(yyyRefN,yyyEntL+318,yyyEntL+324);
    break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    case 6:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->injection) = createEndJMP_injection(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn)));
                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut) + 1;
                                break;
    case 6:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->injection) = createElseJMP_injection(prepareLabelString((((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn)));

                                break;
    }
  break;
  }
break;
case 39:  /***yacc rule 39***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP8)(((char *)((yyyRefN->cL)[3]))+yyyGNSz))->ifcounterOut);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    case 2:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentClassName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentClassName);
                                break;
    case 3:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->currentFunctionName) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->currentFunctionName);

                                break;
    case 4:
 (((yyyP8)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterIn) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn) + 1;
                                break;
    }
  break;
  }
break;
case 40:  /***yacc rule 40***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = addDev(duplicate((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in)),(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name),VARIABLE,(((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->lineNr),"Var assignment in stat"); varCounter++;
                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ASSIGN, createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->name), VARIABLE, -1, calcCurrentLocalVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in))), (((yyyP11)(((char *)((yyyRefN->cL)[5]))+yyyGNSz))->tree));

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  case 4:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP5)(((char *)yyyRSTopN)+yyyGNSz))->in) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    }
  break;
  case 6:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 41:  /***yacc rule 41***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 2:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ASSIGN, createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name), getTypeOfName((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getParameterIndex((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getTypeOfName((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) == CLASS_VAR ? getClassVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) : getLocalVarOffset((((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name))), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree));

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 42:  /***yacc rule 42***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->out) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;

                                break;
    case 6:
 (((yyyP9)(((char *)yyyRSTopN)+yyyGNSz))->ifcounterOut) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->ifcounterIn);

                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP9)(((char *)yyyRefN)+yyyGNSz))->in) ;
                                break;
    }
  break;
  }
break;
case 43:  /***yacc rule 43***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree) ; 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 44:  /***yacc rule 44***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ADD, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 45:  /***yacc rule 45***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MUL, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 46:  /***yacc rule 46***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_AND, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 47:  /***yacc rule 47***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MINUS, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 48:  /***yacc rule 48***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_LESS, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 49:  /***yacc rule 49***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_EQUAL, (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 50:  /***yacc rule 50***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 51:  /***yacc rule 51***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->tree) ; 
                                break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 52:  /***yacc rule 52***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_NOT, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), NULL); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 53:  /***yacc rule 53***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_ADD, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 54:  /***yacc rule 54***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 55:  /***yacc rule 55***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_MUL, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 56:  /***yacc rule 56***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 57:  /***yacc rule 57***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createNode(OP_AND, (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree), (((yyyP11)(((char *)((yyyRefN->cL)[2]))+yyyGNSz))->tree)); 
                                break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 58:  /***yacc rule 58***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ;
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 59:  /***yacc rule 59***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = (((yyyP11)(((char *)((yyyRefN->cL)[1]))+yyyGNSz))->tree) ; 
                            break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 60:  /***yacc rule 60***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 61:  /***yacc rule 61***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 62:  /***yacc rule 62***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 63:  /***yacc rule 63***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    case 1:
 (((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->tree) = createComplexIdentifierLeaf((((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name), getTypeOfName((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getParameterIndex((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)), getTypeOfName((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) == CLASS_VAR ? getClassVarOffset((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)) : getLocalVarOffset((((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids), (((yyyP2)(((char *)((yyyRefN->cL)[0]))+yyyGNSz))->name)));
                            break;
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 64:  /***yacc rule 64***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  }
break;
case 65:  /***yacc rule 65***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 3:  /**/
    switch (yyywa) {
    }
  break;
  case 5:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP11)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 66:  /***yacc rule 66***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 67:  /***yacc rule 67***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 68:  /***yacc rule 68***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
case 69:  /***yacc rule 69***/
  switch (yyyws) {
  case 0:  /**/
    switch (yyywa) {
    }
  break;
  case 1:  /**/
    switch (yyywa) {
    case 0:
(((yyyP6)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  case 2:  /**/
    switch (yyywa) {
    case 0:
(((yyyP11)(((char *)yyyRSTopN)+yyyGNSz))->ids) = (((yyyP6)(((char *)yyyRefN)+yyyGNSz))->ids);
    break;
    }
  break;
  }
break;
} /* switch */ 

if (yyyws)  /* the just-solved instance was inherited. */ 
   {if (yyyRSTopN->prodNum) 
       {yyyiDum = yyyIIEL[yyyIIIEL[yyyRSTopN->prodNum]] + yyywa;
        yyySignalEnts(yyyRSTopN,yyyEntL + yyyIEL[yyyiDum],
                                yyyEntL + yyyIEL[yyyiDum+1]
                     );
       }
   } 
   else     /* the just-solved instance was synthesized. */ 
   {if ((char *)yyyRSTopNp >= yyyNodeSpace) /* node has a parent. */ 
       {yyyiDum = yyyIIEL[yyyIIIEL[((yyyGNT *)yyyRSTopNp)->prodNum] + 
                          yyyRSTopN->whichSym 
                         ] + 
                  yyywa;
        yyySignalEnts((yyyGNT *)yyyRSTopNp,
                      yyyEntL + yyyIEL[yyyiDum],
                      yyyEntL + yyyIEL[yyyiDum+1] 
                     );
       } 
       else   /* node is still on the stack--it has no parent yet. */ 
       {yyypL = &(((struct yyyStackItem *)yyyRSTopNp)->solvedSAlist); 
        if (yyySSALCfreeList == yyyLambdaSSAL) 
           {yyySSALspace[yyyNewSSALC].next = *yyypL; 
            if ((*yyypL = yyyNewSSALC++) == yyySSALspaceSize) 
               yyyHandleOverflow(yyySSALof); 
           }  
           else
           {yyyiDum = yyySSALCfreeList; 
            yyySSALCfreeList = yyySSALspace[yyySSALCfreeList].next; 
            yyySSALspace[yyyiDum].next = *yyypL; 
            *yyypL = yyyiDum;  
           } 
        yyySSALspace[*yyypL].attrbNum = yyywa; 
       } 
   }

} /* yyySolveAndSignal */ 






#define condStg unsigned int conds;
#define yyyClearConds {yyyTST->conds = 0;}
#define yyySetCond(n) {yyyTST->conds += (1<<(n));}
#define yyyCond(n) ((yyyTST->conds & (1<<(n)))?1:0)



struct yyyTravStackItem {yyyGNT *node; 
                         char isReady;
                         condStg
                        };



void yyyDoTraversals()
{struct yyyTravStackItem *yyyTravStack,*yyyTST,*yyyAfterTravStack;
 register yyyGNT *yyyTSTn,**yyyCLptr1,**yyyCLptr2; 
 register int yyyi,yyyRL,yyyPass;

 if (!yyyYok) return;
 if ((yyyTravStack = 
                 ((struct yyyTravStackItem *) 
                  malloc((yyyTravStackMaxSize * 
                                  sizeof(struct yyyTravStackItem)
                                 )
                        )
                 )
     )
     == 
     (struct yyyTravStackItem *)NULL
    ) 
    {fprintf(stderr,"malloc error in traversal stack allocation\n"); 
     exit(-1); 
    } 

yyyAfterTravStack = yyyTravStack + yyyTravStackMaxSize; 
yyyTravStack++; 


for (yyyi=0; yyyi<6; yyyi++) {
yyyTST = yyyTravStack; 
yyyTST->node = yyyStack->node;
yyyTST->isReady = 0;
yyyClearConds

while(yyyTST >= yyyTravStack)
  {yyyTSTn = yyyTST->node;
   if (yyyTST->isReady)  
      {yyyPass = 1;
       goto yyyTravSwitch;
yyyTpop:
       yyyTST--;
      } 
      else 
      {yyyPass = 0;
       goto yyyTravSwitch;
yyyTpush:
       yyyTST->isReady = 1;  
       if (yyyTSTn->prodNum)
          if (yyyRL)
             {yyyCLptr2 = yyyTSTn->cL; 
              while 
                ((yyyCLptr2 != yyyNextCLspace)
                 &&
                 ((*yyyCLptr2)->parent == yyyTSTn) 
                )  
                {if (++yyyTST == yyyAfterTravStack)
                    yyyHandleOverflow(yyyTSof);
                    else
                    {yyyTST->node = *yyyCLptr2; 
                     yyyTST->isReady = 0; 
                     yyyClearConds
                    }
                 yyyCLptr2++; 
                } 
             } /* right to left */
             else  /* left to right */
             {yyyCLptr1 = yyyCLptr2 = yyyTSTn->cL; 
              while 
                ((yyyCLptr2 != yyyNextCLspace)
                 &&
                 ((*yyyCLptr2)->parent == yyyTSTn) 
                )  
                yyyCLptr2++; 
              while (yyyCLptr2-- > yyyCLptr1)
                if (++yyyTST == yyyAfterTravStack)
                   yyyHandleOverflow(yyyTSof);
                   else
                   {yyyTST->node = *yyyCLptr2; 
                    yyyTST->isReady = 0; 
                    yyyClearConds
                   }
             } /* left to right */
      } /* else */
   continue;
yyyTravSwitch:
				switch(yyyTSTn->prodNum)	{
case 1:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { generateClassTable((((yyyP3)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->out),(((yyyP3)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->outImplList));
                        }
				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 2:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 3:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 4:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 5:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 6:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 7:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 8:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 9:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 10:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 11:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 12:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 13:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 14:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 15:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 16:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 17:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 18:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 19:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 20:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 21:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 22:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 23:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 24:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { generateMethodeLabel((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), varCounter);
                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 25:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { generateMethodeLabel((((yyyP10)(((char *)yyyTSTn)+yyyGNSz))->currentClassName), (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name),varCounter);
                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 26:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 27:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP5)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 28:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 29:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 30:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 31:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 32:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 33:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 34:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { /* print2D(@Stat.tree@); */

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

if ( (1)) yyySetCond(4)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_ELSE_LABEL) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }
                            }
if (yyyCond(2) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_END_JUMP) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }

                            }
if (yyyCond(3) != yyyPass) { }
if (yyyCond(4) != yyyPass) { if((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree) != NULL) { burm_label((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)); burm_reduce((((yyyP9)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree), 1); } 
                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 35:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
if ( (1)) yyySetCond(1)

				case 1:

if (yyyCond(0) != yyyPass) { }
if (yyyCond(1) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_ELSE_LABEL) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }
                            }
if (yyyCond(2) != yyyPass) { if((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection) != NULL && (((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)->op == OP_END_JUMP) { processInjection((((yyyP8)(((char *)yyyTSTn)+yyyGNSz))->injection)); }

                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 36:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 37:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                            
                            }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { writeIfEndLabel(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));

                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 38:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;

                            }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { writeIfEndLabel(prepareLabelString((((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentClassName),(((yyyP8)(((char *)((yyyTSTn->cL)[3]))+yyyGNSz))->currentFunctionName),(((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->ifcounterIn)));

                        }
				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 39:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 40:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[5]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                            
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 41:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisibleForZuweisungOrZugriff((((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->in),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor = getFirstRegister(); (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = (((yyyP9)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 42:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 43:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor ;
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 44:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 45:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 46:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 47:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 48:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 49:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 50:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), CLASS_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 51:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor ;
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 52:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor;
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 53:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 54:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 55:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 56:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 57:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;yyySetCond(0)

				case 1:

if (yyyCond(0) != yyyPass) { (((yyyP11)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->tree)->regStor = (((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor; (((yyyP11)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->tree)->regStor = getNextRegister((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->tree)->regStor);
                        }
				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 58:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 59:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 60:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 61:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 62:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->name), INTERFACE_DING, (((yyyP2)(((char *)((yyyTSTn->cL)[1]))+yyyGNSz))->lineNr));
                        }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 63:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisibleForZuweisungOrZugriff((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->name),(((yyyP2)(((char *)((yyyTSTn->cL)[0]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 64:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 65:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

if (yyyCond(0) != yyyPass) { isVisible((((yyyP11)(((char *)yyyTSTn)+yyyGNSz))->ids),(((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->name), ABSTRACT_METH, (((yyyP2)(((char *)((yyyTSTn->cL)[2]))+yyyGNSz))->lineNr));

                            }
				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 66:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 67:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 68:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
case 69:
	switch(yyyi)	{ 
		case 0:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 1:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 2:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 3:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 4:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
		case 5:
			switch(yyyPass)	{
				case 0:
yyyRL = 0;
				case 1:

				break;
					}
		break;
			}

break;
								} /* switch */ 
   if (yyyPass) goto yyyTpop; else goto yyyTpush; 
  } /* while */ 
 } /* for */ 
} /* yyyDoTraversals */ 

void yyyExecuteRRsection()  {
   int yyyi; 
   long yyynRefCounts; 
   long cycleSum = 0;
   long nNZrc = 0;

   if (!yyyYok) return; 
   yyynRefCounts = yyyNextRCLspace - yyyRefCountListSpace; 
   for (yyyi=0;yyyi<yyynRefCounts;yyyi++) 
     if (yyyRefCountListSpace[yyyi])
        {cycleSum += yyyRefCountListSpace[yyyi]; nNZrc++;} 
   if (nNZrc) 
      {
       fprintf(stderr,"\n\n\n**********\n");
       fprintf(stderr,
               "cycle detected in completed parse tree");
       fprintf(stderr,
               " after decoration.\n");
       fprintf(stderr,
         "searching parse tree for %d unsolved instances:\n",
               nNZrc
              );
       yyyUnsolvedInstSearchTravAux(yyyStackTop->node);
      }
   yyyDoTraversals();
} /* yyyExecuteRRsection */ 



yyyWAT yyyLRCIL[3] = {0,1,0,
};



void yyyYoxInit()                                  /*stock*/  
  { 

   yyyNodeSizeCalc(); 

   if ((yyyTermBuffer.snBufPtr = 
        (char *) malloc((yyyBiggestNodeSize + sizeof(yyyCopyType)))
       )  
       == 
       ((char *) NULL) 
      )   
      yyyfatal("malloc error in yyyTermBuffer allocation\n");  
  
  
   yyyNbytesStackStg = yyyMaxStackSize*sizeof(struct yyyStackItem); 
   yyyNbytesStackStg = ((yyyNbytesStackStg/yyyAlignSize)+1)*yyyAlignSize;  
   if ((yyyNodeAndStackSpace = 
        (char *) malloc((yyyNbytesStackStg + 
                                 yyyMaxNbytesNodeStg + 
                                 yyyGNSz + 
                                 yyyBiggestNodeSize + 
                                 sizeof(yyyCopyType) 
                                )
                       )
       )  
       == 
       ((char *) NULL) 
      )   
      yyyfatal("malloc error in ox node and stack space allocation\n");
   yyyStack = (struct yyyStackItem *) yyyNodeAndStackSpace; 
   yyyAfterStack = yyyStack + yyyMaxStackSize;  
   yyyNodeSpace = yyyNodeAndStackSpace + yyyNbytesStackStg;
   yyyAfterNodeSpace = yyyNodeSpace + yyyMaxNbytesNodeStg;
 
 
   if ((yyyRS = (struct yyyRSitem *) 
         malloc(((yyyRSmaxSize+1)*sizeof(struct yyyRSitem)))
       )  
       == 
       ((struct yyyRSitem *) NULL) 
      )   
      yyyfatal("malloc error in ox ready set space allocation\n");  
   yyyRS++; 
   yyyAfterRS = yyyRS + yyyRSmaxSize; 

 
   if ((yyyChildListSpace = 
        (yyyGNT **) malloc((yyyMaxNchildren*sizeof(yyyGNT *)))
       )  
       == 
       ((yyyGNT **) NULL) 
      )   
      yyyfatal("malloc error in ox child list space allocation\n");  
   yyyAfterChildListSpace = yyyChildListSpace + yyyMaxNchildren; 

 
   if ((yyyRefCountListSpace = 
        (yyyRCT *) malloc((yyyMaxNrefCounts * sizeof(yyyRCT)))
       )  
       == 
       ((yyyRCT *) NULL) 
      )   
      yyyfatal("malloc error in ox reference count list space allocation\n");  
   yyyAfterRefCountListSpace = yyyRefCountListSpace + yyyMaxNrefCounts;  
  
 
   if ((yyySSALspace = (struct yyySolvedSAlistCell *) 
          malloc(((yyySSALspaceSize+1) * 
                          sizeof(struct yyySolvedSAlistCell))
                         ) 
       ) 
       == 
       ((struct yyySolvedSAlistCell *) NULL) 
      ) 
      yyyfatal("malloc error in stack solved list space allocation\n"); 
  } /* yyyYoxInit */ 



void yyyYoxReset() 
  { 
   yyyTermBuffer.isEmpty = 1; 
   yyyStackTop = yyyStack; 
   while (yyyStackTop != yyyAfterStack) 
     (yyyStackTop++)->solvedSAlist = yyyLambdaSSAL; 
   yyyStackTop = yyyStack - 1; 
   yyyNextNodeSpace = yyyNodeSpace; 
   yyyRSTop = yyyRS - 1; 
   yyyNextCLspace = yyyChildListSpace;
   yyyNextRCLspace = yyyRefCountListSpace; 
  }  



void yyyDecorate() 
  { 
   while (yyyRSTop >= yyyRS) 
      yyySolveAndSignal();  
  } 



void yyyShift() 
  {yyyRCT *rcPdum; 
   register yyyCopyType *CTp1,*CTp2,*CTp3; 
   register yyyWAT *startP,*stopP;  

   if ((++yyyStackTop) == yyyAfterStack) 
      yyyHandleOverflow(yyySof);
   CTp2 = (yyyCopyType *)(yyyStackTop->oldestNode = 
                          yyyStackTop->node = 
                          (yyyGNT *)yyyNextNodeSpace 
                         ); 
   yyyTermBuffer.isEmpty = 1;
   ((yyyGNT *)CTp2)->parent = (void *)yyyStackTop; 
   ((yyyGNT *)CTp2)->cL = yyyNextCLspace;  
   rcPdum = ((yyyGNT *)CTp2)->refCountList = yyyNextRCLspace;  
   ((yyyGNT *)CTp2)->prodNum = 0; 
   if ((yyyNextRCLspace += yyyTermBuffer.nAttrbs) 
       > 
       yyyAfterRefCountListSpace 
      ) 
      yyyHandleOverflow(yyyRCof); 
   startP = yyyTermBuffer.startP;  
   stopP = yyyTermBuffer.stopP;  
   while (startP < stopP) rcPdum[*(startP++)] = 0; 
   if ((yyyNextNodeSpace += yyyNdPrSz[yyyTermBuffer.typeNum]) 
       > 
       yyyAfterNodeSpace 
      ) 
      yyyHandleOverflow(yyyNSof);  
   CTp1 = (yyyCopyType *)(yyyTermBuffer.snBufPtr); 
   CTp2 = (yyyCopyType *)(((char *)CTp2) + yyyGNSz); 
   CTp3 = CTp2 + yyyNdCopySz[yyyTermBuffer.typeNum]; 
   while (CTp2 < CTp3) *CTp2++ = *CTp1++; 
  } 



void yyyGenIntNode() 
  {register yyyWST i;
   register struct yyyStackItem *stDum;  
   register yyyGNT *gnpDum; 

   if ((stDum = (yyyStackTop -= (yyyRHSlength-1))) >= yyyAfterStack) 
      yyyHandleOverflow(yyySof);
   yyySTsn = ((char *)(yyySTN = (yyyGNT *)yyyNextNodeSpace)) + yyyGNSz; 
   yyySTN->parent       =  (void *)yyyStackTop;  
   yyySTN->cL           =  yyyNextCLspace; 
   yyySTN->refCountList =  yyyNextRCLspace; 
   yyySTN->prodNum      =  yyyProdNum; 
   if ((yyyNextCLspace+yyyRHSlength) > yyyAfterChildListSpace) 
      yyyHandleOverflow(yyyCLof); 
   for (i=1;i<=yyyRHSlength;i++) 
     {gnpDum = *(yyyNextCLspace++) = (stDum++)->node;  
      gnpDum->whichSym = i;  
      gnpDum->parent = (void *)yyyNextNodeSpace; 
     } 
   if ((yyyNextRCLspace += yyyNattrbs) > yyyAfterRefCountListSpace) 
      yyyHandleOverflow(yyyRCof); 
   if ((yyyNextNodeSpace += yyyNdPrSz[yyyTypeNum]) > yyyAfterNodeSpace) 
      yyyHandleOverflow(yyyNSof);  
  } 



#define yyyDECORfREQ 50 



void yyyAdjustINRC(startP,stopP) 
  register yyyFT *startP,*stopP;
  {yyyWST i;
   long SSALptr,SSALptrHead,*cPtrPtr; 
   long *pL; 
   struct yyyStackItem *stDum;  
   yyyGNT *gnpDum; 
   long iTemp;
   register yyyFT *nextP;
   static unsigned short intNodeCount = yyyDECORfREQ;

   nextP = startP;
   while (nextP < stopP) 
     {if ((*nextP) == yyyR)  
         {(yyySTN->refCountList)[*(nextP+1)] = *(nextP+2);
         } 
         else 
         {(((yyySTN->cL)[*nextP])->refCountList)[*(nextP+1)] = *(nextP+2);
         } 
      nextP += 3;  
     }
   pL = yyyIIEL + yyyIIIEL[yyyProdNum]; 
   stDum = yyyStackTop;  
   for (i=1;i<=yyyRHSlength;i++) 
     {pL++; 
      SSALptrHead = SSALptr = *(cPtrPtr = &((stDum++)->solvedSAlist)); 
      if (SSALptr != yyyLambdaSSAL) 
         {*cPtrPtr = yyyLambdaSSAL; 
          do 
            {
             iTemp = (*pL+yyySSALspace[SSALptr].attrbNum);
             yyySignalEnts(yyySTN,
                           yyyEntL + yyyIEL[iTemp],
                           yyyEntL + yyyIEL[iTemp+1]
                          );  
             SSALptr = *(cPtrPtr = &(yyySSALspace[SSALptr].next)); 
            } 
            while (SSALptr != yyyLambdaSSAL);  
          *cPtrPtr = yyySSALCfreeList;  
          yyySSALCfreeList = SSALptrHead;  
         } 
     } 
   nextP = startP + 2;
   while (nextP < stopP) 
     {if (!(*nextP))
         {if ((*(nextP-2)) == yyyR)  
             {pL = &(yyyStackTop->solvedSAlist); 
              if (yyySSALCfreeList == yyyLambdaSSAL) 
                 {yyySSALspace[yyyNewSSALC].next = *pL; 
                  if ((*pL = yyyNewSSALC++) == yyySSALspaceSize) 
                     yyyHandleOverflow(yyySSALof); 
                 }  
                 else
                 {iTemp = yyySSALCfreeList; 
                  yyySSALCfreeList = yyySSALspace[yyySSALCfreeList].next; 
                  yyySSALspace[iTemp].next = *pL; 
                  *pL = iTemp;  
                 } 
              yyySSALspace[*pL].attrbNum = *(nextP-1); 
             } 
             else 
             {if ((gnpDum = (yyySTN->cL)[*(nextP-2)])->prodNum != 0)
                 {
                  iTemp = yyyIIEL[yyyIIIEL[gnpDum->prodNum]] + *(nextP-1);
                  yyySignalEnts(gnpDum, 
                                yyyEntL + yyyIEL[iTemp],  
                                yyyEntL + yyyIEL[iTemp+1] 
                               );    
                 }  
             } 
         } 
      nextP += 3; 
     } 
   yyyStackTop->node = yyySTN;
   if (!yyyRHSlength) yyyStackTop->oldestNode = yyySTN; 
   if (!--intNodeCount) 
      {intNodeCount = yyyDECORfREQ; 
       yyyDecorate(); 
      } 
  } 



void yyyPrune(prodNum) 
  long prodNum;
  {  
   int i,n; 
   register char *cp1,*cp2;  
   register yyyRCT *rcp1,*rcp2,*rcp3;  
   long cycleSum = 0;
   long nNZrc = 0;
   yyyRCT *tempNextRCLspace;
   
   yyyDecorate();
   tempNextRCLspace = yyyNextRCLspace;
   yyyNextRCLspace = 
     (rcp1 = rcp2 = (yyyStackTop->oldestNode)->refCountList) + yyyNattrbs;
   rcp3 = (yyyStackTop->node)->refCountList; 
   while (rcp2 < rcp3) 
     if (*rcp2++) {cycleSum += *(rcp2 - 1); nNZrc++;} 
   if (nNZrc) 
      {
       fprintf(stderr,"\n\n\n----------\n");
       fprintf(stderr,
         "cycle detected during pruning of a subtree\n");
       fprintf(stderr,
         "  at whose root production %d is applied.\n",prodNum);
       yyyNextRCLspace = tempNextRCLspace; 
       fprintf(stderr,
         "prune aborted: searching subtree for %d unsolved instances:\n",
               nNZrc
              );
       yyyUnsolvedInstSearchTrav(yyyStackTop->node);
       return; 
      }
   for (i=0;i<yyyNattrbs;i++) rcp1[i] = rcp3[i]; 
   yyyNextCLspace = (yyyStackTop->oldestNode)->cL; 
   yyyNextNodeSpace = (char *)(yyyStackTop->oldestNode) + 
                      (n = yyyNdPrSz[yyyTypeNum]);
   cp1 = (char *)yyyStackTop->oldestNode; 
   cp2 = (char *)yyyStackTop->node; 
   for (i=0;i<n;i++) *cp1++ = *cp2++; 
   yyyStackTop->node = yyyStackTop->oldestNode; 
   (yyyStackTop->node)->refCountList = rcp1; 
   (yyyStackTop->node)->cL = yyyNextCLspace; 
  } 



void yyyGenLeaf(nAttrbs,typeNum,startP,stopP) 
  int nAttrbs,typeNum; 
  yyyWAT *startP,*stopP; 
  {
   if  (!(yyyTermBuffer.isEmpty)) yyyShift(); 
   yyyTermBuffer.isEmpty = 0;
   yyyTermBuffer.typeNum = typeNum; 
   yyyTermBuffer.nAttrbs = nAttrbs; 
   yyyTermBuffer.startP = startP; 
   yyyTermBuffer.stopP = stopP; 
   
  } 



void yyyerror()
  {yyyYok = 0; 
  } 



/* read the command line for changes in sizes of 
                  the evaluator's data structures */
void yyyCheckForResizes(argc,argv) 
  int argc; 
  char *argv[]; 
  {int i; 
   long dum; 
 
   if (!yyyPermitUserAlloc) return; 
   for (i=1;i<argc;i++) 
     { 
      if ((argv[i][0] != '-') || (argv[i][1] != 'Y')) continue; 
      if (strlen(argv[i]) < 4) goto yyyErrO1; 
      if (sscanf(argv[i]+3,"%d",&dum) != 1) goto yyyErrO1;
      if (dum < 2) dum = 2;
      switch (argv[i][2]) 
        {case yyyNSof:   yyyMaxNbytesNodeStg = dum; break; 
         case yyyRCof:   yyyMaxNrefCounts    = dum; break; 
         case yyyCLof:   yyyMaxNchildren     = dum; break; 
         case yyySof:    yyyMaxStackSize     = dum; break; 
         case yyySSALof: yyySSALspaceSize    = dum; break; 
         case yyyRSof:   yyyRSmaxSize        = dum; break; 
         case yyyTSof:   yyyTravStackMaxSize = dum; break; 
         default : goto yyyErrO1; 
        }
      continue;  
   yyyErrO1 : fprintf(stderr,"invalid command line option: %s\n",
                             argv[i] 
                     ); 
     } 
  } 
   
   
   


#define yyyLastProdNum 69


#define yyyNsorts 11


int yyyProdsInd[] = {
   0,
   0,   2,   5,   6,   9,  12,  18,  21,  22,  29,
  35,  38,  40,  44,  47,  55,  62,  69,  75,  79,
  82,  85,  87,  92,  99, 107, 109, 111, 114, 116,
 120, 123, 127, 129, 133, 134, 137, 143, 151, 157,
 164, 168, 170, 172, 175, 178, 181, 185, 189, 193,
 196, 198, 201, 205, 208, 212, 215, 219, 222, 226,
 228, 230, 233, 235, 241, 248, 250, 253, 256,
 260,
};


int yyyProds[][2] = {
{ 334,   0},{1003,   3},{1003,   3},{ 323,   3},{1003,   3},
{1003,   3},{ 323,   3},{ 257,   4},{ 548,   0},{ 323,   3},
{ 703,   3},{ 548,   0},{ 257,   4},{  34,   0},{ 619,   2},
{ 540,   0},{ 856,   4},{ 124,   0},{ 856,   4},{  83,   4},
{ 856,   4},{ 856,   4},{  83,   4},{ 619,   2},{ 396,   0},
{ 858,   5},{ 404,   0},{ 540,   0},{ 853,   5},{  83,   4},
{ 619,   2},{ 396,   0},{ 404,   0},{ 540,   0},{ 853,   5},
{ 858,   5},{1049,   5},{ 853,   5},{ 858,   5},{ 853,   5},
{1049,   5},{1049,   5},{ 853,   5},{ 428,   0},{1049,   5},
{ 853,   5},{ 428,   0},{ 703,   3},{ 479,   0},{ 619,   2},
{1010,   0},{ 947,   5},{ 540,   0},{ 884,  10},{ 124,   0},
{ 703,   3},{ 479,   0},{ 619,   2},{1010,   0},{ 540,   0},
{ 884,  10},{ 124,   0},{ 703,   3},{ 479,   0},{ 619,   2},
{1010,   0},{ 947,   5},{ 540,   0},{ 124,   0},{ 703,   3},
{ 479,   0},{ 619,   2},{1010,   0},{ 540,   0},{ 124,   0},
{ 884,  10},{ 884,  10},{ 811,  10},{ 548,   0},{ 884,  10},
{ 811,  10},{ 548,   0},{ 947,   5},{ 947,   5},{ 619,   2},
{ 947,   5},{ 619,   2},{ 811,  10},{ 933,   0},{ 619,   2},
{ 540,   0},{ 853,   5},{ 811,  10},{1119,   0},{ 619,   2},
{ 396,   0},{ 404,   0},{ 830,   7},{ 124,   0},{ 811,  10},
{1119,   0},{ 619,   2},{ 396,   0},{ 114,   4},{ 404,   0},
{ 830,   7},{ 124,   0},{ 853,   5},{1152,   0},{ 853,   5},
{ 619,   2},{ 114,   4},{ 852,   4},{ 769,   4},{ 114,   4},
{ 769,   4},{ 852,   4},{ 852,   4},{ 769,   4},{ 428,   0},
{ 852,   4},{ 769,   4},{ 428,   0},{ 769,   4},{ 619,   2},
{ 540,   0},{ 853,   5},{ 830,   7},{  63,   8},{  63,   8},
{ 246,   9},{ 548,   0},{  63,   8},{  63,   8},{ 246,   9},
{ 838,   0},{ 430,  11},{ 246,   9},{ 635,   0},{ 430,  11},
{ 361,   0},{  63,   8},{ 124,   0},{ 246,   9},{ 635,   0},
{ 430,  11},{ 361,   0},{  63,   8},{ 815,   0},{  63,   8},
{ 124,   0},{ 246,   9},{ 911,   0},{ 430,  11},{ 702,   0},
{  63,   8},{ 124,   0},{ 246,   9},{ 933,   0},{ 619,   2},
{ 540,   0},{ 853,   5},{ 758,   0},{ 430,  11},{ 246,   9},
{ 619,   2},{ 758,   0},{ 430,  11},{ 246,   9},{ 430,  11},
{ 430,  11},{1090,  11},{ 430,  11},{ 997,  11},{1092,  11},
{ 430,  11},{ 997,  11},{1091,  11},{ 430,  11},{ 997,  11},
{1093,  11},{ 430,  11},{ 997,  11},{ 436,   0},{ 997,  11},
{ 430,  11},{ 997,  11},{ 556,   0},{ 997,  11},{ 430,  11},
{ 997,  11},{ 564,   0},{ 997,  11},{ 430,  11},{  46,   0},
{ 619,   2},{1090,  11},{ 997,  11},{1090,  11},{1165,   0},
{1090,  11},{1092,  11},{ 420,   0},{ 997,  11},{1092,  11},
{1092,  11},{ 420,   0},{ 997,  11},{1091,  11},{ 412,   0},
{ 997,  11},{1091,  11},{1091,  11},{ 412,   0},{ 997,  11},
{1093,  11},{ 120,   0},{ 997,  11},{1093,  11},{1093,  11},
{ 120,   0},{ 997,  11},{ 997,  11},{ 396,   0},{ 430,  11},
{ 404,   0},{ 997,  11},{ 765,   1},{ 997,  11},{ 267,   0},
{ 997,  11},{ 749,   0},{ 619,   2},{ 997,  11},{ 619,   2},
{ 997,  11},{ 997,  11},{ 444,   0},{ 619,   2},{ 396,   0},
{ 404,   0},{ 997,  11},{ 997,  11},{ 444,   0},{ 619,   2},
{ 396,   0},{ 263,   6},{ 404,   0},{ 263,   6},{ 430,  11},
{ 263,   6},{ 859,   6},{ 430,  11},{ 859,   6},{ 430,  11},
{ 428,   0},{ 859,   6},{ 859,   6},{ 430,  11},{ 428,   0},
};


int yyySortsInd[] = {
  0,
  0,  1,  3,  7,  9, 10, 11, 15, 22, 29,
 34,
 36,
};


int yyySorts[] = {
  793,  381,  177,  987, 1088,  825,  888,  987, 1088,  987,
  882,  987,  542,  545,  850,  987, 1088,  542,  545, 1032,
  557,  854,  987, 1088,  121,  542,  545, 1032,  557,  987,
 1088,  542,  825,  888,  882,  121,
};



char *yyyStringTab[] = {
0,"getParameterIndex",0,0,0,
0,0,0,0,0,
0,0,0,"isVisible",0,
0,0,0,0,0,
"createEndJMP","createElseJMP",0,0,0,
0,0,0,0,0,
0,0,0,0,"INTERFACE",
0,0,0,0,0,
"ADD",0,0,0,0,
0,"NEW",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"Stats",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"AbstraktMethod",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"Pars",
0,0,0,0,0,
"AND","tree","y",0,"END",
0,0,0,0,0,
0,"reg",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"strtoul",0,0,0,
0,0,0,0,0,
"LABEL",0,0,0,0,
0,0,"lineNr",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"NULL","reduce",0,
"ASSIGN",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"METH",0,0,0,0,
0,"Stat",0,0,0,
0,0,0,0,0,
0,0,"Interface","MINUS",0,
0,0,0,"ParamsExpr",0,
0,0,"THIS",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"ProgrammStart",0,
0,0,0,0,0,
0,0,0,0,"Start",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"THEN",0,0,0,
0,"meth_node_t",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"name",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"'('",0,0,0,
0,0,0,0,"')'",
0,0,0,0,0,
0,0,"'*'",0,0,
"getTypeOfName","strdup",0,0,0,
"'+'",0,0,0,0,
"label",0,"duplicate","','",0,
"Expr","LESS",0,0,0,
0,"'-'",0,0,0,
0,"code_injection_t","node_t",0,"'.'",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"generateMethodeLabel",0,0,
0,0,"tree_t",0,0,
0,0,0,0,"CLASS",
0,0,0,0,0,
0,0,0,0,0,
0,0,"genMeth",0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"yylineno",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"endLabel",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"':'",0,"currentClassName",0,0,
"currentFunctionName",0,0,"';'",0,
0,0,0,0,0,
0,"'<'","ifcounterOut",0,0,
0,0,"PARAMETER",0,"'='",
0,0,0,"gen",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"writeIfEndLabel",0,0,
0,0,0,0,0,
0,"createThisLeaf","createNULLLeaf",0,"createIfLabelLeaf",
0,"createNumericalLeaf",0,0,0,
0,0,0,0,"createComplexIdentifierLeaf",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"ID",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"IF",0,0,0,0,
0,0,0,0,0,
"visCheck",0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
"MUL",0,"DO","Class",0,
"EQUAL",0,0,0,0,
0,0,0,0,0,
0,0,0,0,"isVisibleForZuweisungOrZugriff",
0,"OP",0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"NULL_VAL",
0,0,0,0,0,
"newList",0,0,"ASSIGNOP","newImplList",
0,0,0,0,0,
"NUM",0,0,0,"Par",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,"value",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"Member",0,0,0,
"ELSE",0,0,0,0,
"DING",0,0,0,"varCounter",
"inImplList",0,0,"createNode",0,
"StatsMethode",0,0,0,0,
0,0,0,"RETURN",0,
0,0,0,0,0,
0,"getNextRegister","getFirstRegister",0,0,
"ifcounter",0,"ParsLoop","Type","injection",
0,"AbstraktMethodsLoop","VARIABLE","ParamTypesLoop","ParamsExprLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ids",0,"MemeberLoop",
0,0,0,"outImplList","ABSTRACT",
0,0,0,0,0,
0,0,0,0,0,
"processInjection",0,0,0,0,
0,0,0,0,0,
0,"WHILE",0,0,0,
0,0,0,0,0,
0,0,0,"if",0,
0,0,0,0,0,
0,0,0,"VAR",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,"ImplementsLoop","calcCurrentLocalVarOffset",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,"getClassVarOffset","getLocalVarOffset",0,0,
0,0,0,0,0,
0,"JUMP","in",0,0,
0,0,0,0,0,
0,0,"Term",0,0,
0,0,0,"Programm",0,
0,0,0,0,"op",
"IMPLEMENTS",0,0,0,0,
0,0,0,0,0,
0,0,0,"yytext",0,
0,0,0,0,0,
0,0,"ifcounterIn",0,0,
0,0,0,0,0,
0,0,0,0,0,
"regStor",0,0,0,"TypesLoop",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"addDev",
0,0,0,0,0,
0,0,0,"out",0,
"OptionaNotTerm","OptionalMalTerm","OptionalPlusTerm","OptionalAndTerm",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"METHOD",
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,"burm",
"generateClassTable",0,0,0,0,
0,0,0,"addImpl",0,
0,0,"INT",0,0,
0,0,0,0,0,
0,0,0,0,0,
"NOT",0,0,0,0,
0,0,0,"prepareLabelString",0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,
};



#define yyySizeofProd(num) (yyyProdsInd[(num)+1] - yyyProdsInd[(num)])

#define yyyGSoccurStr(prodNum,symPos) \
   (yyyStringTab[yyyProds[yyyProdsInd[(prodNum)] + (symPos)][0]])

#define yyySizeofSort(num) (yyySortsInd[(num)+1] - yyySortsInd[(num)])

#define yyySortOf(prodNum,symPos) \
  (yyyProds[yyyProdsInd[(prodNum)] + (symPos)][1]) 

#define yyyAttrbStr(prodNum,symPos,attrbNum)                      \
  (yyyStringTab[yyySorts[yyySortsInd[yyySortOf(prodNum,symPos)] + \
                         (attrbNum)                               \
                        ]                                         \
               ]                                                  \
  )



void yyyShowProd(i)
  int i;
  {int j,nSyms;

   nSyms = yyySizeofProd(i);
   for (j=0; j<nSyms; j++)
     {
      fprintf(stderr,"%s",yyyGSoccurStr(i,j));
      if (j == 0) fprintf(stderr," : "); else fprintf(stderr," ");
     }
   fprintf(stderr,";\n");
  }



void yyyShowProds()
  {int i; for (i=1; i<=yyyLastProdNum; i++) yyyShowProd(i);}



void yyyShowSymsAndSorts()
  {int i; 

   for (i=1; i<=yyyLastProdNum; i++) 
     {int j, nSyms;

      fprintf(stderr,
              "\n\n\n---------------------------------- %3.1d\n",i);
      /* yyyShowProd(i); */ 
      nSyms = yyySizeofProd(i); 
      for (j=0; j<nSyms; j++) 
        {int k, sortSize;

         fprintf(stderr,"%s\n",yyyGSoccurStr(i,j));
         sortSize = yyySizeofSort(yyySortOf(i,j));
         for (k=0; k<sortSize; k++) 
            fprintf(stderr,"  %s\n",yyyAttrbStr(i,j,k));
         if (j == 0) fprintf(stderr,"->\n"); 
              else 
              fprintf(stderr,"\n"); 
        }
     }
  }



void yyyCheckNodeInstancesSolved(np)
  yyyGNT *np;
  {int mysort,sortSize,i,prodNum,symPos,inTerminalNode;
   int nUnsolvedInsts = 0;

   if (np->prodNum != 0)
     {inTerminalNode = 0;
      prodNum = np->prodNum;
      symPos = 0;
     }
   else
     {inTerminalNode = 1;
      prodNum = ((yyyGNT *)(np->parent))->prodNum;
      symPos = np->whichSym;
     }
   mysort = yyySortOf(prodNum,symPos);
   sortSize = yyySizeofSort(mysort);
   for (i=0; i<sortSize; i++)
     if ((np->refCountList)[i] != 0) nUnsolvedInsts += 1;
   if (nUnsolvedInsts)
     {fprintf(stderr,
      "\nFound node that has %d unsolved attribute instance(s).\n",
              nUnsolvedInsts
             );
      fprintf(stderr,"Node is labeled \"%s\".\n",
             yyyGSoccurStr(prodNum,symPos));
      if (inTerminalNode)
        {fprintf(stderr,
                 "Node is terminal.  Its parent production is:\n  ");
         yyyShowProd(prodNum);
        }
      else
        {fprintf(stderr,"Node is nonterminal.  ");
         if (((char *)(np->parent)) >= yyyNodeSpace)
           {fprintf(stderr,
                    "Node is %dth child in its parent production:\n  ",
                   np->whichSym
                  );
            yyyShowProd(((yyyGNT *)(np->parent))->prodNum);
           }
         fprintf(stderr,
                 "Node is on left hand side of this production:\n  ");
         yyyShowProd(np->prodNum);
        }
      fprintf(stderr,"The following instances are unsolved:\n");
      for (i=0; i<sortSize; i++)
        if ((np->refCountList)[i] != 0)
          fprintf(stderr,"     %-16s still has %1d dependencies.\n",
                  yyyAttrbStr(prodNum,symPos,i),(np->refCountList)[i]);
     }
  }



void yyyUnsolvedInstSearchTravAux(pNode)
  yyyGNT *pNode;
  {yyyGNT **yyyCLpdum;
   int i;
  
   yyyCheckNodeInstancesSolved(pNode); 
   yyyCLpdum = pNode->cL;
   while
     ((yyyCLpdum != yyyNextCLspace) && ((*yyyCLpdum)->parent == pNode))
     {
      yyyUnsolvedInstSearchTravAux(*yyyCLpdum);
      yyyCLpdum++;
     }
  }



void yyyUnsolvedInstSearchTrav(pNode)
  yyyGNT *pNode;
  {yyyGNT **yyyCLpdum;
   int i;
  
   yyyCLpdum = pNode->cL;
   while
     ((yyyCLpdum != yyyNextCLspace) && ((*yyyCLpdum)->parent == pNode))
     {
      yyyUnsolvedInstSearchTravAux(*yyyCLpdum);
      yyyCLpdum++;
     }
  }



