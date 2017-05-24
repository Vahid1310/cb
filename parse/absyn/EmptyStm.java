/*
 * EmptyStm.java -- abstract syntax for empty statement
 */


package absyn;

import sym.Sym;


public class EmptyStm extends Stm {

  public EmptyStm(int r, int c) {
    row = r;
    col = c;
  }

  public void show(int n) {
    indent(n);
    say("EmptyStm()");
  }

}
