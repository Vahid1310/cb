/*
 * ArrayTy.java -- abstract syntax for array type
 */


package absyn;

import sym.Sym;


public class ArrayTy extends Ty {

  public int size;
  public Ty ty;

  public ArrayTy(int r, int c, int s, Ty t) {
    row = r;
    col = c;
    size = s;
    ty = t;
  }

  public void show(int n) {
    indent(n);
    say("ArrayTy(\n");
    indent(n + 1);
    sayInt(size);
    say(",\n");
    ty.show(n + 1);
    say(")");
  }

}
