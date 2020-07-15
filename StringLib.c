#include "./include/StringLib.h"

int Cstrcmp(const char* pstr1,const char* pstr2)
{
   while(*pstr1 != '\0' || *pstr2 != '\0')
   {
        if(*pstr1 != *pstr2)
            break;

        pstr1++;
        pstr2++;


   }

    

    return *pstr1 - *pstr2;
}
