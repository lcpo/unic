#include "unicc.c"
#include "json.c"
//void __stack_chk_fail(void){return;}
//http://netlib.narod.ru/library/book0003/ch08_07.htm


typedef enum pattern_type{
START_STR,	
CLASS_STR,
MASC_STR,
STEP_STR,
END_STR
				}pattern_type;

typedef struct pattern{
	pattern_type* type;
	char** section;
	int step;	
	int length;
	}pattern;

pattern* pt;

//tockens:
//[...] list
//(...) mask
//{...} step

//qualifiers:
//?
//+
//*

//or
// |


void get_tocken(char* template){
pt=malloc(sizeof(pattern));
pt
char* p=template;
int i=0,n=libc_strlen(template),flag=0,z=0;	
while(i<n){
if(p[i]='[' && p[i-1]='\\'){flag=1;}
if(p[i]=']' && p[i-1]='\\'){flag=0;}	
	i++;}
	
	
return;	
	}

///------------------------------------------------------------
int main(int argc, char** argv) {

get_tocken("[0-9]");


/*
echo ("create array:\n");	
int i=0,nom=0,id=0;
char*** test=malloc(10);
echo ("end:\n");
while(i<10){
	test[i]=malloc(5);
	nom=0;
while(nom<5){test[i][nom]=malloc(2);nom++;}	
	i++;}
free(test);
echo ("test\n");
*/
/*
echo ("create array:\n");
int i=0,nom=0,id=0;
char* test="123|456|789|abc|def";
char* test2="afdf|dfdf|avaa|yyy";
char** ex=libc_explode("|",test);
char** ex2=libc_explode("|",test2);*/
/*
while(ex[i]!=NULL){
printf("%s\n",ex[i]);
i++;}

i=0;
while(ex2[i]!=NULL){
printf("%s\n",ex2[i]);
i++;}
*/
/*
char** ex3=libc_malloc(libc_count((void**)ex)+libc_count((void**)ex2));
array_merge(ex3,ex,ex2);


i=0;
while(ex3[i]!=NULL){
printf("%s\n",ex3[i]);
i++;}
free(ex);
free(ex2);
free(ex3);
i=0;
while(i<libc_count((void*)hope.a)){
printf("%i|%i|%s\n",i,hope.a[i],hope.a[i]);	
	i++;}

 


*/

/*
id=getptrid(buff);

nom=hope.i+1;
printf("size:%i\n",sizeof(hope));

    


char* bf;
i=0;
while(i<1000000){
buff=realloc(buff,i+1);	
buff[i]=libc_itos(i);
printf("%s\n",buff[i]);
free(buff[i]);


	i++;
	}	
*/

return 0;
						}










