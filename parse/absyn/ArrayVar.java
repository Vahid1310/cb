/*
 * ArrayVar.java -- abstract syntax for array variable
 */


package absyn;

import sym.Sym;


public class ArrayVar extends Var {

  public Var var;
  public Exp index;

  public ArrayVar(int r, int c, Var v, Exp i) {
    row = r;
    col = c;
    var = v;
    index = i;
  }

  public void show(int n) {
    indent(n);
    say("ArrayVar(\n");
    var.show(n + 1);
    say(",\n");
    index.show(n + 1);
    say(")");
  }

}
