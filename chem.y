%{
#include <stdio.h>
#include<string.h>
#include<stdlib.h>
int yyerror(char *s);
char str[200];
int u,t[99];
char*s,*m[99];
int c,v[99][99];
int i,j,n; 
void b(int k){
    if(k<0)for(n=j=0;!n&&j<u;j++)for(i=0;i<=c;i++)n+=t[i]*v[i][j];
    else for(t[k]=0;n&&t[k]++<30;)b(k-1); 
}

%}
%token LINE ARROW PLUS 
%union 
{
        int number;
        char *string;
}
%token <string> ELT
%token <number> NUM
%%
S  : ST { 
    int r=2; 
    for(s=m[0]=str;*s;){
        if(*s==45)
        r=0,s++;
        if(*s<65)m[++c]=++s;
        j=*s++;
        if(*s>96)j=*s+++j*256;            
        for(i=0,t[u]=j;t[i]-j;i++);
        if(i==u)
          u+=1;
        else
        u+=0;
        for(n=0;*s/16==3;)
        {
        n=n*10+*s++-48;
        }
        n+=!n;
        v[c][i]=r?n:-n;
    }
    b(c);
    for(i=0,s=n?"Can't balance,Invalid!":str;*s;putchar(*s++))s==m[i]&&t[i++]>1?printf("%d",t[i-1]):0;
    putchar(10);
    exit(0);}
   ;
ST : T LINE ARROW{strcat(str,"->");} T
   ;
T  : COMP 
   | COMP PLUS{strcat(str,"+");}COMP   
   ; 
COMP: COMP COMP   
    | COMP NUM {char temp[10]; sprintf(temp,"%d",$2); strcat(str,temp); } 
    | '('COMP')'NUM 
    | ELT {strcat(str,$1);}
    ;        
%%
#include "lex.yy.c"
int yyerror(char *s)
{
printf("invalid equation!\n");
exit(0);
}
int main()
{
printf("Enter the equation: ");
yyparse();
return 0;
}