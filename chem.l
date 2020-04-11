digit [0-9]
%%
H|He|Li|Be|B|C|N|O|F|Ne|Na|Mg|Al|Si|P|S|Cl|Ar|K|Ca|Sc|Ti|V|Cr|Mn|Fe|Co|Ni|Cu|Zn|Ga|Ge|As { yylval.string=strdup(yytext); return ELT;}
Se|Br|Kr|Rb|Sr|Y|Zr|Nb|Mo|Tc|Ru|Rh|Pd|Ag|Cd|In|Sn|Sb|Te|I|Xe|Cs|Ba|La|Ce|Pr|Nd|Pm|Sm|Eu { yylval.string=strdup(yytext); return ELT;}
Gd|Tb|Dy|Ho|Er|Tm|Yb|Lu|Hf|Ta|W|Re|Os|Ir|Pt|Au|Hg|Tl|Pb|Bi|Po|At|Rn|Fr|Ra|Ac|Th|Pa|U|Np { yylval.string=strdup(yytext); return ELT;}
Pu|Am|Cm|Bk|Cf|Es|Fm|Md|No|Lr|Rf|Db|Sg|Bh|Hs|Mt|Ds|Rg|Cn|Nh|Fl|Mc|Lv|Ts|Og { yylval.string=strdup(yytext); return ELT;}
{digit}+   { yylval.number=atoi(yytext); return NUM;}
"-"  {return LINE;}
">"  {return ARROW;}
"+"  {return PLUS;}
"("  {return yytext[0];}
")" {return yytext[0];}
.      ;
\n yyterminate();
%%
