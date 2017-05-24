/*
 * scanner.jflex -- SPL scanner specification
 */


package parse;
import java_cup.runtime.*;


%%


%class Scanner
%public
%line
%column
%cup

%{

  private Symbol symbol(int type) {
    return new Symbol(type, yyline + 1, yycolumn + 1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline + 1, yycolumn + 1, value);
  }

  public void showToken(Symbol token) {
    String s;
    switch (token.sym) {
      case sym.EOF:
        s = "-- EOF --";
        break;
      case sym.IF:
	s = "IF";
	break;
      case sym.PROC:
        s = "PROC";
	break;
      case sym.IDENT:
	s = "IDENT";
	break;
      case sym.RPAREN:
	s = "RPAREN";
	break;
      case sym.LPAREN:
	s = "LPAREN";
	break;
      case sym.LCURL:
	s = "LCURL";
	break;
      case sym.RCURL:
	s = "RCURL";
	break;
      case sym.LBRACK:
	s = "LBRACK";
	break;
      case sym.RBRACK:
	s = "RBRACK";
	break;
      case sym.VAR:
	s = "VAR";
	break;
      case sym.COLON:
	s = "COLON";
	break;
      case sym.INTLIT:
	s = "INTLIT";
	break;
      case sym.TYPE:
	s = "TYPE";
	break;
      case sym.SEMIC:
	s = "SEMIC";
	break;
      case sym.ASGN:
	s = "ASGN";
	break;
      case sym.REF:
	s = "REF";
	break;
      case sym.ARRAY:
	s = "ARRAY";
	break;
      case sym.OF:
	s = "OF";
	break;
      case sym.COMMA:
	s = "COMMA";
	break;
      case sym.ELSE:
	s = "ELSE";
	break;
      case sym.PLUS:
	s = "PLUS";
	break;
      case sym.STAR:
	s = "STAR";
	break;
      case sym.MINUS:
	s = "MINUS";
	break;
      case sym.WHILE:
	s = "WHILE";
	break;
      case sym.SLASH:
	s = "SLASH";
	break;
      case sym.EQ:
	s = "EQ";
	break;
      case sym.LT:
	s = "LT";
	break;
      default:
        /* this should never happen */
        throw new RuntimeException(
          "unknown token " + token.sym + " in showToken"
        );
    }
    System.out.println(
      "TOKEN = " + s +
      " in line " + token.left +
      ", column " + token.right
    );
  }

%}

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
Identifier     = [a-zA-Z][a-z_A-Z0-9]*
IntLit         = 0 | [1-9][0-9]* | '[^']*'
Comment        = "//" [^\r\n]* {LineTerminator}?

%%
<YYINITIAL> "if"           { return symbol(sym.IF);    }
<YYINITIAL> "proc"         { return symbol(sym.PROC);  }
"("         		   { return symbol(sym.LPAREN);}
")"          		   { return symbol(sym.RPAREN);}
"{"          		   { return symbol(sym.LCURL); }
"}"          		   { return symbol(sym.RCURL); }
"["          		   { return symbol(sym.LBRACK);}
"]"           		   { return symbol(sym.RBRACK);}
<YYINITIAL> "var"          { return symbol(sym.VAR);   }
":"          		   { return symbol(sym.COLON); }
<YYINITIAL> "type"         { return symbol(sym.TYPE);  }
";"          		   { return symbol(sym.SEMIC); }
":="         		   { return symbol(sym.ASGN);  }
"="          		   { return symbol(sym.EQ);    }
<YYINITIAL> "array"        { return symbol(sym.ARRAY); }
<YYINITIAL> "of"           { return symbol(sym.OF);    }
<YYINITIAL> "ref"          { return symbol(sym.REF);   }
","          		   { return symbol(sym.COMMA); }
<YYINITIAL> "else"         { return symbol(sym.ELSE);  }
"+"          		   { return symbol(sym.PLUS);  }
<YYINITIAL> "while"        { return symbol(sym.WHILE); }
"-"          		   { return symbol(sym.MINUS); }
"*"          		   { return symbol(sym.STAR);  }
"/"           		   { return symbol(sym.SLASH); }
<YYINITIAL> "int"          { return symbol(sym.IDENT); }
">="           	  	   { return symbol(sym.GE);    }
">"           	  	   { return symbol(sym.GT);    }
"<"           	  	   { return symbol(sym.LT);    }
"#"           	  	   { return symbol(sym.NE);    }
"<="           	  	   { return symbol(sym.LE);    }


<YYINITIAL> {
      {Identifier}         { return symbol(sym.IDENT); }
      {WhiteSpace}         {                           }
      {Comment   } 	   {			       }
      {IntLit    }         { return symbol(sym.INTLIT);}
}


%%


.		{
		  throw new RuntimeException(
		    "illegal character 0x" +
		    Integer.toString((int) yytext().charAt(0), 16) +
		    " in line " + (yyline + 1) +
		    ", column " + (yycolumn + 1)
		  );
		}
