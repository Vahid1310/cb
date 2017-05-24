/*
 * VarExp.java -- abstract syntax for variable expression
 */


package absyn;

import sym.Sym;


public class VarExp extends Exp {

  public Var var;

  public VarExp(int r, int c, Var v) {
    row = r;
    col = c;
    var = v;
  }

  public void show(int n) {
    indent(n);
    say("VarExp(\n");
    var.show(n + 1);
    say(")");
  }

}
