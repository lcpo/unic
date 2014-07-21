void __stack_chk_fail(){return;}
extern char* itos(int n);
extern char* ltos(long n);
extern char* dtos(double n);
extern char* ftos(float n);

char* atos(long n){///int to str
     int i=0, sign=0,j=0;
     uni l=libc_leni(n);
     char* sint=libc_malloc(l+1*sizeof(sint));
	 sint+=0;
     if ((sign = n) < 0){n = -n; l++;}
	 i = 0;
     do {
     sint[i++] = n % 10 + '0';
     } while ((n /= 10) > 0);
     if (sign < 0){sint[i++] = '-'; l--;}
     sint[i] = '\0';
i = 0;
j=l-1;
while(j>i) {swap(sint[i],sint[j]);i++; j--;}
return sint;
					}

int proto_printf(char* format,...){
char* tmp_text="";
char buffer[1];
int i=0,n=0,len_format=libc_strlen((void *)format);
double dtmp=0;
long ltmp=0;
int itmp=0;

va_list arg;
va_start(arg,format);
while(len_format>i){
if(format[i]=='%' && format[i+1]=='i'){ itmp=va_arg(arg,int); libc_print_str(atos(itmp));  ++i; ++i; ++n;}else
if(format[i]=='%' && format[i+1]=='d'){itmp=va_arg(arg,int); libc_print_str(atos(itmp));  ++i; ++i; ++n;}else
if(format[i]=='%' && format[i+1]=='c'){buffer[0]=va_arg(arg,int); buffer[1]=(char)'0'; write($O,buffer,1); ++i; ++i; ++n;}else
if(format[i]=='%' && format[i+1]=='s'){tmp_text=va_arg(arg,char*);if(tmp_text!=NULL){libc_print_str(tmp_text);}else{write($O,libc_itos((long)tmp_text),2);}++i; ++i; ++n;}else
if(format[i]=='%' && format[i+1]=='l'){ltmp=va_arg(arg,long); libc_print_str(atos(ltmp)); ++i; ++i; ++n;}else
if(format[i]=='%' && format[i+1]=='f'){dtmp=va_arg(arg,double); libc_print_str(libc_dtos(dtmp));++i; ++i; ++n;}else
{buffer[0]=(char)format[i];buffer[1]='\0';write($O,buffer,1);++i;}	
				   }
va_end(arg);
//libc_free(tmp_text);
	return 1;
}




#define printf(x...)(proto_printf(x,NULL))
