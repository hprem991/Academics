/*
#ifdef CS550_RENAME
    #define malloc cs550_malloc
    #define free cs550_free
    #define calloc cs550_calloc
    #define realloc cs550_realloc
    #define sbrk cs550_sbrk
#endif
*/
#include "malloc.h"

void testmalloc(){
     cs550_print("Test Malloc \n ");
     for(int i = 0; i<200;i++){
         cs550_print("%lu\n",i);
         void *p = cs550_malloc(i+20);
	 cs550_free(p);
   }
}

void testcalloc(){
     cs550_print("Test Calloc \n");
     for(int i = 0; i<200;i++){
         cs550_print("%lu\n",i);
         void *p = calloc(20,i+20);
	 cs550_free(p);
   }
}


void testrealloc(){
     cs550_print("Test Realloc \n");
     for(int i = 0; i<200;i++){
         cs550_print("%lu\n",i);
         void *p = cs550_malloc(i+20);
	 cs550_free(p);
	 void *q = cs550_realloc(p,i+40); 
	 cs550_free(q);
   }
}

int main(){
	cs550_print("Test Code from here\n");	
		
	void *vp1, *vp2;
        vp1 = cs550_malloc(10);
        cs550_free(vp1);
        vp1 = cs550_malloc(10);
        vp2 = cs550_malloc(30);
        cs550_free(vp1);
        cs550_free(vp2);
        vp2 = cs550_malloc(30);
        vp1 = cs550_malloc(10);
        cs550_free(vp1);
        cs550_free(vp2);
        cs550_free(cs550_malloc(100));
        cs550_free(cs550_malloc(48));

	//void *p = cs550_malloc(10);
	
	

	//testmalloc();
	//testcalloc();
	//testrealloc(); 
	return 0;
}
