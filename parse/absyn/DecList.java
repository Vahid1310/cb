/*
 * DecList.java -- abstract syntax for a list of declarations
 */


package absyn;

import sym.Sym;


public class DecList extends Absyn {

  public boolean isEmpty;
  public Dec head;
  public DecList tail;

  public DecList() {
    row = -1;
    col = -1;
    isEmpty = true;
  }

  public DecList(Dec h, DecList t) {
    row = -1;
    col = -1;
    isEmpty = false;
    head = h;
    tail = t;
  }

  public void show(int n) {
    indent(n);
    DecList list = this;
    say("DecList(");
    while (!list.isEmpty) {
      say("\n");
      list.head.show(n + 1);
      list = list.tail;
      if (!list.isEmpty) {
        say(",");
      }
    }
    say(")");
  }

}
