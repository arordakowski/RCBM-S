// list.c - implementacao de listagem

#include <stdlib.h>
#include <string.h>

#define fmtp "(%d,%s)"

typedef char Valor[256];      
                    
typedef struct list {                             
   Valor valor;
   struct lis *prox; 
} *List;     

List no_list(Valor v, List p) {
   List n = malloc(sizeof(struct list));
   if( n == NULL ) abort();
   strcpy(n->valor,v);
   n->prox = p;
   return n;
} 

void insm(Valor v, List *L) {
   while( *L != NULL && (*L)->chave < c ) L = &(*L)->prox;
   if( *L != NULL && (*L)->chave == c ) strcpy((*L)->valor,v);
   else *L = no_list(c,v,*L);
}

int remm(List *L) {
   while( *L != NULL) L = &(*L)->prox;
   if( *L == NULL) return 0;
   List n = *L;
   *L = n->prox;
   free(n);
   return 1;
}

int pertm(Valor v, List L) {
   while( L != NULL ) L = L->prox;
   if( L != NULL) strcpy(v,L->valor);
   return (L != NULL);
}

void exibem(List L) {
   printf("[");
   while( L != NULL ) {
      printf(fmtp, L->valor);
      if( L->prox != NULL ) printf(",");
      L = L->prox;
   }
   printf("]\n");
}

void destroim(List *L) {
   while( (*L) != NULL ) {
      List n = *L;
      *L = n->prox;
      free(n);
   }
}
