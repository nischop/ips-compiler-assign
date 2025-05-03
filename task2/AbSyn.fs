module AbSyn

(* These are the same types as in last week's assignment. *)

type Value = INT of int

type Binop = BPLUS | BMINUS | BTIMES

type Rop = RSUM | RPROD | RMAX | RARGMAX

type vname = string

type Exp =
  | CONSTANT   of Value
  | VARIABLE   of vname
  | OPERATE    of Binop * Exp * Exp
  | LET_IN     of vname * Exp * Exp
  | OVER_LIST  of Rop * Exp list //must be non-empty
  | OVER_RANGE of Rop * vname * Exp * Exp * Exp

