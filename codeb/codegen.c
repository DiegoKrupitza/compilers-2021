typedef struct burm_state *STATEPTR_TYPE;

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "tree.h"
#include "code_generator.h"
#ifndef ALLOC
#define ALLOC(n) malloc(n)
#endif

#ifndef burm_assert
#define burm_assert(x,y) if (!(x)) { extern void abort(void); y; abort(); }
#endif

#define burm_stat_NT 1
#define burm_ret_NT 2
#define burm_assign_NT 3
#define burm_expr_NT 4
#define burm_if_NT 5
#define burm_loop_NT 6
#define burm_const_NT 7
int burm_max_nt = 7;

struct burm_state {
	int op;
	STATEPTR_TYPE left, right;
	short cost[8];
	struct {
		unsigned burm_stat:3;
		unsigned burm_ret:1;
		unsigned burm_assign:4;
		unsigned burm_expr:5;
		unsigned burm_if:2;
		unsigned burm_loop:1;
		unsigned burm_const:3;
	} rule;
};

static short burm_nts_0[] = { burm_ret_NT, 0 };
static short burm_nts_1[] = { burm_assign_NT, 0 };
static short burm_nts_2[] = { burm_expr_NT, 0 };
static short burm_nts_3[] = { burm_if_NT, 0 };
static short burm_nts_4[] = { burm_loop_NT, 0 };
static short burm_nts_5[] = { burm_const_NT, 0 };
static short burm_nts_6[] = { burm_expr_NT, burm_expr_NT, 0 };
static short burm_nts_7[] = { burm_const_NT, burm_expr_NT, 0 };
static short burm_nts_8[] = { burm_expr_NT, burm_const_NT, 0 };
static short burm_nts_9[] = { burm_const_NT, burm_const_NT, 0 };
static short burm_nts_10[] = { 0 };

short *burm_nts[] = {
	0,	/* 0 */
	burm_nts_0,	/* 1 */
	burm_nts_1,	/* 2 */
	burm_nts_2,	/* 3 */
	burm_nts_3,	/* 4 */
	burm_nts_4,	/* 5 */
	burm_nts_2,	/* 6 */
	burm_nts_5,	/* 7 */
	burm_nts_6,	/* 8 */
	burm_nts_7,	/* 9 */
	burm_nts_8,	/* 10 */
	burm_nts_6,	/* 11 */
	burm_nts_7,	/* 12 */
	burm_nts_8,	/* 13 */
	burm_nts_6,	/* 14 */
	burm_nts_7,	/* 15 */
	burm_nts_8,	/* 16 */
	burm_nts_6,	/* 17 */
	burm_nts_8,	/* 18 */
	burm_nts_7,	/* 19 */
	burm_nts_9,	/* 20 */
	burm_nts_6,	/* 21 */
	burm_nts_7,	/* 22 */
	burm_nts_8,	/* 23 */
	burm_nts_9,	/* 24 */
	burm_nts_2,	/* 25 */
	burm_nts_5,	/* 26 */
	burm_nts_8,	/* 27 */
	burm_nts_6,	/* 28 */
	burm_nts_7,	/* 29 */
	burm_nts_10,	/* 30 */
	burm_nts_10,	/* 31 */
	burm_nts_10,	/* 32 */
	burm_nts_10,	/* 33 */
	burm_nts_10,	/* 34 */
	burm_nts_10,	/* 35 */
	burm_nts_5,	/* 36 */
	burm_nts_2,	/* 37 */
	burm_nts_10,	/* 38 */
	burm_nts_5,	/* 39 */
	burm_nts_2,	/* 40 */
	burm_nts_10,	/* 41 */
	burm_nts_10,	/* 42 */
	burm_nts_10,	/* 43 */
	burm_nts_5,	/* 44 */
	burm_nts_2,	/* 45 */
	burm_nts_10,	/* 46 */
	burm_nts_2,	/* 47 */
	burm_nts_2,	/* 48 */
	burm_nts_2,	/* 49 */
};

char burm_arity[] = {
	1,	/* 0=OP_RETURN */
	2,	/* 1=OP_ADD */
	2,	/* 2=OP_MUL */
	2,	/* 3=OP_AND */
	2,	/* 4=OP_LESS */
	2,	/* 5=OP_EQUAL */
	1,	/* 6=OP_NOT */
	2,	/* 7=OP_MINUS */
	0,	/* 8=OP_NUMBER */
	0,	/* 9=OP_ID */
	0,	/* 10=OP_PARAM_ID */
	0,	/* 11=OP_CLASS_VAR_ID */
	0,	/* 12=OP_THIS */
	0,	/* 13=OP_NULL */
	2,	/* 14=OP_ASSIGN */
	2,	/* 15=OP_IF */
	0,	/* 16=OP_IF_ID */
	2,	/* 17=OP_IF_ELSE */
	2,	/* 18=OP_LOOP */
	0,	/* 19=OP_LOOP_ID */
};

static short burm_decode_stat[] = {
	0,
	1,
	2,
	3,
	4,
	5,
};

static short burm_decode_ret[] = {
	0,
	6,
};

static short burm_decode_assign[] = {
	0,
	36,
	37,
	38,
	39,
	40,
	41,
	42,
	43,
	44,
	45,
	46,
};

static short burm_decode_expr[] = {
	0,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	21,
	22,
	23,
	25,
	27,
	28,
	29,
	30,
	31,
	32,
	33,
};

static short burm_decode_if[] = {
	0,
	47,
	48,
};

static short burm_decode_loop[] = {
	0,
	49,
};

static short burm_decode_const[] = {
	0,
	20,
	24,
	26,
	34,
	35,
};

int burm_rule(STATEPTR_TYPE state, int goalnt) {
	burm_assert(goalnt >= 1 && goalnt <= 7, PANIC("Bad goal nonterminal %d in burm_rule\n", goalnt));
	if (!state)
		return 0;
	switch (goalnt) {
	case burm_stat_NT:
		return burm_decode_stat[state->rule.burm_stat];
	case burm_ret_NT:
		return burm_decode_ret[state->rule.burm_ret];
	case burm_assign_NT:
		return burm_decode_assign[state->rule.burm_assign];
	case burm_expr_NT:
		return burm_decode_expr[state->rule.burm_expr];
	case burm_if_NT:
		return burm_decode_if[state->rule.burm_if];
	case burm_loop_NT:
		return burm_decode_loop[state->rule.burm_loop];
	case burm_const_NT:
		return burm_decode_const[state->rule.burm_const];
	default:
		burm_assert(0, PANIC("Bad goal nonterminal %d in burm_rule\n", goalnt));
	}
	return 0;
}

static void burm_closure_ret(STATEPTR_TYPE, int);
static void burm_closure_assign(STATEPTR_TYPE, int);
static void burm_closure_expr(STATEPTR_TYPE, int);
static void burm_closure_if(STATEPTR_TYPE, int);
static void burm_closure_loop(STATEPTR_TYPE, int);
static void burm_closure_const(STATEPTR_TYPE, int);

static void burm_closure_ret(STATEPTR_TYPE p, int c) {
	if (c + 0 < p->cost[burm_stat_NT]) {
		p->cost[burm_stat_NT] = c + 0;
		p->rule.burm_stat = 1;
	}
}

static void burm_closure_assign(STATEPTR_TYPE p, int c) {
	if (c + 0 < p->cost[burm_stat_NT]) {
		p->cost[burm_stat_NT] = c + 0;
		p->rule.burm_stat = 2;
	}
}

static void burm_closure_expr(STATEPTR_TYPE p, int c) {
	if (c + 0 < p->cost[burm_stat_NT]) {
		p->cost[burm_stat_NT] = c + 0;
		p->rule.burm_stat = 3;
	}
}

static void burm_closure_if(STATEPTR_TYPE p, int c) {
	if (c + 0 < p->cost[burm_stat_NT]) {
		p->cost[burm_stat_NT] = c + 0;
		p->rule.burm_stat = 4;
	}
}

static void burm_closure_loop(STATEPTR_TYPE p, int c) {
	if (c + 0 < p->cost[burm_stat_NT]) {
		p->cost[burm_stat_NT] = c + 0;
		p->rule.burm_stat = 5;
	}
}

static void burm_closure_const(STATEPTR_TYPE p, int c) {
	if (c + 1 < p->cost[burm_expr_NT]) {
		p->cost[burm_expr_NT] = c + 1;
		p->rule.burm_expr = 1;
		burm_closure_expr(p, c + 1);
	}
}

STATEPTR_TYPE burm_state(int op, STATEPTR_TYPE left, STATEPTR_TYPE right) {
	int c;
	STATEPTR_TYPE p, l = left, r = right;

	if (burm_arity[op] > 0) {
		p = (STATEPTR_TYPE)ALLOC(sizeof *p);
		burm_assert(p, PANIC("ALLOC returned NULL in burm_state\n"));
		p->op = op;
		p->left = l;
		p->right = r;
		p->rule.burm_stat = 0;
		p->cost[1] =
		p->cost[2] =
		p->cost[3] =
		p->cost[4] =
		p->cost[5] =
		p->cost[6] =
		p->cost[7] =
			32767;
	}
	switch (op) {
	case 0: /* OP_RETURN */
		assert(l);
		{	/* ret: OP_RETURN(expr) */
			c = l->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_ret_NT]) {
				p->cost[burm_ret_NT] = c + 0;
				p->rule.burm_ret = 1;
				burm_closure_ret(p, c + 0);
			}
		}
		break;
	case 1: /* OP_ADD */
		assert(l && r);
		{	/* expr: OP_ADD(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 4;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_ADD(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 3;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_ADD(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 2;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 2: /* OP_MUL */
		assert(l && r);
		{	/* expr: OP_MUL(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 7;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_MUL(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 6;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_MUL(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 5;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 3: /* OP_AND */
		assert(l && r);
		{	/* expr: OP_AND(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 10;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_AND(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 9;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_AND(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 8;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 4: /* OP_LESS */
		assert(l && r);
		{	/* const: OP_LESS(const,const) */
			c = l->cost[burm_const_NT] + r->cost[burm_const_NT] + 0;
			if (c + 0 < p->cost[burm_const_NT]) {
				p->cost[burm_const_NT] = c + 0;
				p->rule.burm_const = 1;
				burm_closure_const(p, c + 0);
			}
		}
		{	/* expr: OP_LESS(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 13;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_LESS(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 12;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_LESS(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 11;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 5: /* OP_EQUAL */
		assert(l && r);
		{	/* const: OP_EQUAL(const,const) */
			c = l->cost[burm_const_NT] + r->cost[burm_const_NT] + 0;
			if (c + 0 < p->cost[burm_const_NT]) {
				p->cost[burm_const_NT] = c + 0;
				p->rule.burm_const = 2;
				burm_closure_const(p, c + 0);
			}
		}
		{	/* expr: OP_EQUAL(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 16;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_EQUAL(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 15;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_EQUAL(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 14;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 6: /* OP_NOT */
		assert(l);
		{	/* const: OP_NOT(const) */
			c = l->cost[burm_const_NT] + 0;
			if (c + 0 < p->cost[burm_const_NT]) {
				p->cost[burm_const_NT] = c + 0;
				p->rule.burm_const = 3;
				burm_closure_const(p, c + 0);
			}
		}
		{	/* expr: OP_NOT(expr) */
			c = l->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 17;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 7: /* OP_MINUS */
		assert(l && r);
		{	/* expr: OP_MINUS(const,expr) */
			c = l->cost[burm_const_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 20;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_MINUS(expr,expr) */
			c = l->cost[burm_expr_NT] + r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 19;
				burm_closure_expr(p, c + 0);
			}
		}
		{	/* expr: OP_MINUS(expr,const) */
			c = l->cost[burm_expr_NT] + r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_expr_NT]) {
				p->cost[burm_expr_NT] = c + 0;
				p->rule.burm_expr = 18;
				burm_closure_expr(p, c + 0);
			}
		}
		break;
	case 8: /* OP_NUMBER */
		{
			static struct burm_state z = { 8, 0, 0,
				{	0,
					1,	/* stat: expr */
					32767,
					32767,
					1,	/* expr: const */
					32767,
					32767,
					0,	/* const: OP_NUMBER */
				},{
					3,	/* stat: expr */
					0,
					0,
					1,	/* expr: const */
					0,
					0,
					5,	/* const: OP_NUMBER */
				}
			};
			return &z;
		}
	case 9: /* OP_ID */
		{
			static struct burm_state z = { 9, 0, 0,
				{	0,
					1,	/* stat: expr */
					32767,
					32767,
					1,	/* expr: OP_ID */
					32767,
					32767,
					32767,
				},{
					3,	/* stat: expr */
					0,
					0,
					21,	/* expr: OP_ID */
					0,
					0,
					0,
				}
			};
			return &z;
		}
	case 10: /* OP_PARAM_ID */
		{
			static struct burm_state z = { 10, 0, 0,
				{	0,
					1,	/* stat: expr */
					32767,
					32767,
					1,	/* expr: OP_PARAM_ID */
					32767,
					32767,
					32767,
				},{
					3,	/* stat: expr */
					0,
					0,
					22,	/* expr: OP_PARAM_ID */
					0,
					0,
					0,
				}
			};
			return &z;
		}
	case 11: /* OP_CLASS_VAR_ID */
		{
			static struct burm_state z = { 11, 0, 0,
				{	0,
					1,	/* stat: expr */
					32767,
					32767,
					1,	/* expr: OP_CLASS_VAR_ID */
					32767,
					32767,
					32767,
				},{
					3,	/* stat: expr */
					0,
					0,
					23,	/* expr: OP_CLASS_VAR_ID */
					0,
					0,
					0,
				}
			};
			return &z;
		}
	case 12: /* OP_THIS */
		{
			static struct burm_state z = { 12, 0, 0,
				{	0,
					0,	/* stat: expr */
					32767,
					32767,
					0,	/* expr: OP_THIS */
					32767,
					32767,
					32767,
				},{
					3,	/* stat: expr */
					0,
					0,
					24,	/* expr: OP_THIS */
					0,
					0,
					0,
				}
			};
			return &z;
		}
	case 13: /* OP_NULL */
		{
			static struct burm_state z = { 13, 0, 0,
				{	0,
					1,	/* stat: expr */
					32767,
					32767,
					1,	/* expr: const */
					32767,
					32767,
					0,	/* const: OP_NULL */
				},{
					3,	/* stat: expr */
					0,
					0,
					1,	/* expr: const */
					0,
					0,
					4,	/* const: OP_NULL */
				}
			};
			return &z;
		}
	case 14: /* OP_ASSIGN */
		assert(l && r);
		if (	/* assign: OP_ASSIGN(OP_CLASS_VAR_ID,OP_PARAM_ID) */
			l->op == 11 && /* OP_CLASS_VAR_ID */
			r->op == 10 /* OP_PARAM_ID */
		) {
			c = 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 11;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_CLASS_VAR_ID,expr) */
			l->op == 11 /* OP_CLASS_VAR_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 10;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_CLASS_VAR_ID,const) */
			l->op == 11 /* OP_CLASS_VAR_ID */
		) {
			c = r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 9;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_PARAM_ID,OP_CLASS_VAR_ID) */
			l->op == 10 && /* OP_PARAM_ID */
			r->op == 11 /* OP_CLASS_VAR_ID */
		) {
			c = 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 8;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_PARAM_ID,OP_PARAM_ID) */
			l->op == 10 && /* OP_PARAM_ID */
			r->op == 10 /* OP_PARAM_ID */
		) {
			c = 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 7;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_PARAM_ID,OP_ID) */
			l->op == 10 && /* OP_PARAM_ID */
			r->op == 9 /* OP_ID */
		) {
			c = 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 6;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_PARAM_ID,expr) */
			l->op == 10 /* OP_PARAM_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 5;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_PARAM_ID,const) */
			l->op == 10 /* OP_PARAM_ID */
		) {
			c = r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 4;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_ID,OP_PARAM_ID) */
			l->op == 9 && /* OP_ID */
			r->op == 10 /* OP_PARAM_ID */
		) {
			c = 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 3;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_ID,expr) */
			l->op == 9 /* OP_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 2;
				burm_closure_assign(p, c + 0);
			}
		}
		if (	/* assign: OP_ASSIGN(OP_ID,const) */
			l->op == 9 /* OP_ID */
		) {
			c = r->cost[burm_const_NT] + 1;
			if (c + 0 < p->cost[burm_assign_NT]) {
				p->cost[burm_assign_NT] = c + 0;
				p->rule.burm_assign = 1;
				burm_closure_assign(p, c + 0);
			}
		}
		break;
	case 15: /* OP_IF */
		assert(l && r);
		if (	/* if: OP_IF(OP_IF_ID,expr) */
			l->op == 16 /* OP_IF_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_if_NT]) {
				p->cost[burm_if_NT] = c + 0;
				p->rule.burm_if = 1;
				burm_closure_if(p, c + 0);
			}
		}
		break;
	case 16: /* OP_IF_ID */
		{
			static struct burm_state z = { 16, 0, 0,
				{	0,
					32767,
					32767,
					32767,
					32767,
					32767,
					32767,
					32767,
				},{
					0,
					0,
					0,
					0,
					0,
					0,
					0,
				}
			};
			return &z;
		}
	case 17: /* OP_IF_ELSE */
		assert(l && r);
		if (	/* if: OP_IF_ELSE(OP_IF_ID,expr) */
			l->op == 16 /* OP_IF_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_if_NT]) {
				p->cost[burm_if_NT] = c + 0;
				p->rule.burm_if = 2;
				burm_closure_if(p, c + 0);
			}
		}
		break;
	case 18: /* OP_LOOP */
		assert(l && r);
		if (	/* loop: OP_LOOP(OP_LOOP_ID,expr) */
			l->op == 19 /* OP_LOOP_ID */
		) {
			c = r->cost[burm_expr_NT] + 1;
			if (c + 0 < p->cost[burm_loop_NT]) {
				p->cost[burm_loop_NT] = c + 0;
				p->rule.burm_loop = 1;
				burm_closure_loop(p, c + 0);
			}
		}
		break;
	case 19: /* OP_LOOP_ID */
		{
			static struct burm_state z = { 19, 0, 0,
				{	0,
					32767,
					32767,
					32767,
					32767,
					32767,
					32767,
					32767,
				},{
					0,
					0,
					0,
					0,
					0,
					0,
					0,
				}
			};
			return &z;
		}
	default:
		burm_assert(0, PANIC("Bad operator %d in burm_state\n", op));
	}
	return p;
}

#ifdef STATE_LABEL
static void burm_label1(NODEPTR_TYPE p) {
	burm_assert(p, PANIC("NULL tree in burm_label\n"));
	switch (burm_arity[OP_LABEL(p)]) {
	case 0:
		STATE_LABEL(p) = burm_state(OP_LABEL(p), 0, 0);
		break;
	case 1:
		burm_label1(LEFT_CHILD(p));
		STATE_LABEL(p) = burm_state(OP_LABEL(p),
			STATE_LABEL(LEFT_CHILD(p)), 0);
		break;
	case 2:
		burm_label1(LEFT_CHILD(p));
		burm_label1(RIGHT_CHILD(p));
		STATE_LABEL(p) = burm_state(OP_LABEL(p),
			STATE_LABEL(LEFT_CHILD(p)),
			STATE_LABEL(RIGHT_CHILD(p)));
		break;
	}
}

STATEPTR_TYPE burm_label(NODEPTR_TYPE p) {
	burm_label1(p);
	return STATE_LABEL(p)->rule.burm_stat ? STATE_LABEL(p) : 0;
}

NODEPTR_TYPE *burm_kids(NODEPTR_TYPE p, int eruleno, NODEPTR_TYPE kids[]) {
	burm_assert(p, PANIC("NULL tree in burm_kids\n"));
	burm_assert(kids, PANIC("NULL kids in burm_kids\n"));
	switch (eruleno) {
	case 7: /* expr: const */
	case 5: /* stat: loop */
	case 4: /* stat: if */
	case 3: /* stat: expr */
	case 2: /* stat: assign */
	case 1: /* stat: ret */
		kids[0] = p;
		break;
	case 26: /* const: OP_NOT(const) */
	case 25: /* expr: OP_NOT(expr) */
	case 6: /* ret: OP_RETURN(expr) */
		kids[0] = LEFT_CHILD(p);
		break;
	case 29: /* expr: OP_MINUS(const,expr) */
	case 28: /* expr: OP_MINUS(expr,expr) */
	case 27: /* expr: OP_MINUS(expr,const) */
	case 24: /* const: OP_EQUAL(const,const) */
	case 23: /* expr: OP_EQUAL(expr,const) */
	case 22: /* expr: OP_EQUAL(const,expr) */
	case 21: /* expr: OP_EQUAL(expr,expr) */
	case 20: /* const: OP_LESS(const,const) */
	case 19: /* expr: OP_LESS(const,expr) */
	case 18: /* expr: OP_LESS(expr,const) */
	case 17: /* expr: OP_LESS(expr,expr) */
	case 16: /* expr: OP_AND(expr,const) */
	case 15: /* expr: OP_AND(const,expr) */
	case 14: /* expr: OP_AND(expr,expr) */
	case 13: /* expr: OP_MUL(expr,const) */
	case 12: /* expr: OP_MUL(const,expr) */
	case 11: /* expr: OP_MUL(expr,expr) */
	case 10: /* expr: OP_ADD(expr,const) */
	case 9: /* expr: OP_ADD(const,expr) */
	case 8: /* expr: OP_ADD(expr,expr) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = RIGHT_CHILD(p);
		break;
	case 46: /* assign: OP_ASSIGN(OP_CLASS_VAR_ID,OP_PARAM_ID) */
	case 43: /* assign: OP_ASSIGN(OP_PARAM_ID,OP_CLASS_VAR_ID) */
	case 42: /* assign: OP_ASSIGN(OP_PARAM_ID,OP_PARAM_ID) */
	case 41: /* assign: OP_ASSIGN(OP_PARAM_ID,OP_ID) */
	case 38: /* assign: OP_ASSIGN(OP_ID,OP_PARAM_ID) */
	case 35: /* const: OP_NUMBER */
	case 34: /* const: OP_NULL */
	case 33: /* expr: OP_THIS */
	case 32: /* expr: OP_CLASS_VAR_ID */
	case 31: /* expr: OP_PARAM_ID */
	case 30: /* expr: OP_ID */
		break;
	case 49: /* loop: OP_LOOP(OP_LOOP_ID,expr) */
	case 48: /* if: OP_IF_ELSE(OP_IF_ID,expr) */
	case 47: /* if: OP_IF(OP_IF_ID,expr) */
	case 45: /* assign: OP_ASSIGN(OP_CLASS_VAR_ID,expr) */
	case 44: /* assign: OP_ASSIGN(OP_CLASS_VAR_ID,const) */
	case 40: /* assign: OP_ASSIGN(OP_PARAM_ID,expr) */
	case 39: /* assign: OP_ASSIGN(OP_PARAM_ID,const) */
	case 37: /* assign: OP_ASSIGN(OP_ID,expr) */
	case 36: /* assign: OP_ASSIGN(OP_ID,const) */
		kids[0] = RIGHT_CHILD(p);
		break;
	default:
		burm_assert(0, PANIC("Bad external rule number %d in burm_kids\n", eruleno));
	}
	return kids;
}

int burm_op_label(NODEPTR_TYPE p) {
	burm_assert(p, PANIC("NULL tree in burm_op_label\n"));
	return OP_LABEL(p);
}

STATEPTR_TYPE burm_state_label(NODEPTR_TYPE p) {
	burm_assert(p, PANIC("NULL tree in burm_state_label\n"));
	return STATE_LABEL(p);
}

NODEPTR_TYPE burm_child(NODEPTR_TYPE p, int index) {
	burm_assert(p, PANIC("NULL tree in burm_child\n"));
	switch (index) {
	case 0:	return LEFT_CHILD(p);
	case 1:	return RIGHT_CHILD(p);
	}
	burm_assert(0, PANIC("Bad index %d in burm_child\n", index));
	return 0;
}

#endif
void burm_reduce(NODEPTR_TYPE bnode, int goalnt)
{
  int ruleNo = burm_rule (STATE_LABEL(bnode), goalnt);
  short *nts = burm_nts[ruleNo];
  NODEPTR_TYPE kids[100];
  int i;

  if (ruleNo==0) {
    fprintf(stderr, "tree cannot be derived from start symbol");
    exit(1);
  }
  burm_kids (bnode, ruleNo, kids);
  for (i = 0; nts[i]; i++)
    burm_reduce (kids[i], nts[i]);    /* reduce kids */

#if DEBUG
  printf ("%s", burm_string[ruleNo]);  /* display rule */
#endif

  switch (ruleNo) {
  case 1:

    break;
  case 2:

    break;
  case 3:

    break;
  case 4:

    break;
  case 5:

    break;
  case 6:
   writeReturnWithValue(bnode->regStor);
    break;
  case 7:
   writeMovev(bnode->value, bnode->regStor);
    break;
  case 8:
   writeAdd(bnode->kids[1]->regStor, bnode->kids[0]->regStor);
    break;
  case 9:
   writeAddv(bnode->kids[0]->value, bnode->kids[1]->regStor); writeMove(bnode->kids[1]->regStor, bnode->regStor); 
    break;
  case 10:
   writeAddv(bnode->kids[1]->value, bnode->kids[0]->regStor);
    break;
  case 11:
   writeMul(bnode->kids[1]->regStor, bnode->kids[0]->regStor);
    break;
  case 12:
   writeMulv(bnode->kids[0]->value, bnode->kids[1]->regStor); writeMove(bnode->kids[1]->regStor, bnode->regStor);
    break;
  case 13:
   writeMulv(bnode->kids[1]->value, bnode->kids[0]->regStor);
    break;
  case 14:
   writeAnd(bnode->kids[1]->regStor, bnode->kids[0]->regStor);
    break;
  case 15:
   writeAndv(bnode->kids[0]->value, bnode->kids[1]->regStor); writeMove(bnode->kids[1]->regStor, bnode->regStor); 
    break;
  case 16:
   writeAndv(bnode->kids[1]->value, bnode->kids[0]->regStor);
    break;
  case 17:
   writeRegLessReg(bnode->kids[0]->regStor, bnode->kids[1]->regStor, bnode->regStor);
    break;
  case 18:
   writeRegLessV(bnode->kids[0]->regStor, bnode->kids[1]->value, bnode->regStor);
    break;
  case 19:
   writeVLessReg(bnode->kids[0]->value, bnode->kids[1]->regStor, bnode->regStor);
    break;
  case 20:
   if(bnode->kids[0]->value < bnode->kids[1]->value) { bnode->value = TRUE_VAL; } else { bnode->value = FALSE_VAL; } 
    break;
  case 21:
   writeEquals(bnode->kids[0]->regStor,bnode->kids[1]->regStor,bnode->regStor);
    break;
  case 22:
   writeEqualsv(bnode->kids[0]->value,bnode->kids[1]->regStor,bnode->regStor);
    break;
  case 23:
   writeEqualsv(bnode->kids[1]->value,bnode->kids[0]->regStor,bnode->regStor);
    break;
  case 24:
   if(bnode->kids[0]->value == bnode->kids[1]->value) { bnode->value = TRUE_VAL; } else { bnode->value = FALSE_VAL; }
    break;
  case 25:
   writeNot(bnode->regStor); 
    break;
  case 26:
   bnode->value = ~bnode->kids[0]->value;
    break;
  case 27:
   writeSubv(bnode->kids[1]->value, bnode->kids[0]->regStor);  
    break;
  case 28:
   writeSub(bnode->kids[1]->regStor, bnode->kids[0]->regStor);
    break;
  case 29:
   writeMovev(bnode->kids[0]->value,bnode->regStor); writeSub(bnode->kids[1]->regStor,bnode->regStor);
    break;
  case 30:
   if (bnode->localVarOffset != -1) writeMoveStack(bnode->localVarOffset, bnode->regStor);
    break;
  case 31:
   if (bnode->parameterIndex != -1) writeMove(getParameterRegister(bnode->parameterIndex), bnode->regStor);   
    break;
  case 32:
   if (bnode->classVaroffset != -1) writeMoveForClassVar(bnode->classVaroffset, bnode->regStor);
    break;
  case 33:
   writeThisMovq(bnode->regStor);
    break;
  case 34:
   bnode->value = 0; /*TODO check if this is what they want */
    break;
  case 35:
   /* done */
    break;
  case 36:
   writeMoveVInStack(bnode->kids[1]->value, bnode->kids[0]->localVarOffset);
    break;
  case 37:
   writeMoveRegInStack(bnode->kids[1]->regStor, bnode->kids[0]->localVarOffset);
    break;
  case 38:
   writeMoveRegInStack(getParameterRegister(bnode->kids[1]->parameterIndex), bnode->kids[0]->localVarOffset);
    break;
  case 39:
   writeMovev(bnode->kids[1]->value, getParameterRegister(bnode->kids[0]->parameterIndex));
    break;
  case 40:
   writeMove(bnode->kids[1]->regStor, getParameterRegister(bnode->kids[0]->parameterIndex));
    break;
  case 41:
   writeMoveStack(bnode->kids[1]->localVarOffset, getParameterRegister(bnode->kids[0]->parameterIndex));
    break;
  case 42:
   writeMove(getParameterRegister(bnode->kids[1]->parameterIndex), getParameterRegister(bnode->kids[0]->parameterIndex));
    break;
  case 43:
   writeMoveForClassVar(bnode->kids[1]->classVaroffset, getParameterRegister(bnode->kids[0]->parameterIndex));
    break;
  case 44:
   writeMoveVIntoClassVar(bnode->kids[1]->value, bnode->kids[0]->classVaroffset);
    break;
  case 45:
   writeMoveRegIntoClassVar(bnode->kids[1]->regStor, bnode->kids[0]->classVaroffset);
    break;
  case 46:
   writeMoveRegIntoClassVar(getParameterRegister(bnode->kids[1]->parameterIndex), bnode->kids[0]->classVaroffset);
    break;
  case 47:
   writeJumpEvenIf(bnode->regStor, bnode->kids[0]->identifierName);
    break;
  case 48:
   writeJumpEvenIfElse(bnode->regStor, bnode->kids[0]->identifierName);
    break;
  case 49:
   writeLoopCheck(bnode->kids[0]->identifierName,bnode->kids[1]->regStor);
    break;
  default:    assert (0);
  }
}
