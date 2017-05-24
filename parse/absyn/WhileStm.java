/*
 * WhileStm.java -- abstract syntax for while statement
 */


package absyn;

import sym.Sym;


public class WhileStm extends Stm {

  public Exp test;
  public Stm body;

  public WhileStm(int r, int c, Exp t, Stm b) {
    row = r;
    col = c;
    test = t;
    body = b;
  }

  public void show(int n) {
    indent(n);
    say("WhileStm(\n");
    test.show(n + 1);
    say(",\n");
    body.show(n + 1);
    say(")");
  }

}
