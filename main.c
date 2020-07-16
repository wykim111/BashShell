#include "/home/ubuntu/Programming/CString/include/main.h"


int main(int argc,char* argv[])
{
    char InputStr1[100], InputStr2[100];
    int stateCmp =  0;

    memset(InputStr1,0,sizeof(InputStr1));
    memset(InputStr2,0,sizeof(InputStr2));

    scanf("%s %s",InputStr1,InputStr2);

    stateCmp = Cstrcmp(InputStr1,InputStr2);

    if(stateCmp > 0)
    {
        printf("%s\n",InputStr1);
    }
    else if(stateCmp < 0)
    {
       printf("%s\n",InputStr2);

    }
    else
    {
        printf("Same\n");
    }


    return 0;
}
