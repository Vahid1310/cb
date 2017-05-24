# cb
compilerbau


Du kannst im if_stmt in der Grammatik sehen, dass ich versuche die Klassen die uns im Ordner absyn gegeben wurden (welche ich oben im parser.cup importiert habe) in unsere Grammatik einzufuegen. Dabei hat jede Klasse der absyn eine gewisse Parameter Liste also ifStmt(int a, int b, Stm s1, Stm s2) {...} zum Beispiel. Nun ist die Aufgabe jeder deiner Grammatikregeln die passende abstrakte Syntaxklasse zu geben und dann sollte das per ./spl queens --absyn genau das gleiche Ergebnis ausgeben wie bei der Referenzimplementierung. 
