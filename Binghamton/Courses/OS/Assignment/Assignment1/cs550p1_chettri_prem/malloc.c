#include <stdlib.h>
#include "malloc.h"
#include <stdarg.h>
#include <string.h>
#include <unistd.h>

#pragma GCC diagnostic ignored "-Wdeprecated-declarations"


// Make any use of assert in cs550_print() go away, unless we are actually just testing
// cs550_print().  In that case, define DBG_PRINT_TEST.
#ifndef DBG_PRINT_TEST
#define NDEBUG
#endif
#include <assert.h>

typedef struct Node
{
    size_t size;
    struct Node *leftChild;
    struct Node *rightChild;
    //  struct Node *leftAddress;
    //  struct Node *rightAddress;
} treeNode;

static treeNode *root = NULL;
//static treeNode *rootAddress = NULL;


#ifndef MYDEBUG
#define my_sbrk sbrk
#endif


void 
printTree(treeNode *node){
    if(node == NULL)
        return;
    printTree(node->leftChild);
    cs550_print(" Address %lu and Size is %lu \n", (size_t)node, node->size);
    printTree(node->rightChild);
}

treeNode* 
FindMinSize(treeNode *node)
{
    if((node == NULL) || (node->leftChild == NULL))
    {
        return NULL;
    }
    return FindMinSize(node->leftChild);
}

treeNode* 
insert(treeNode **node,treeNode *temp)
{
    if((*node) == NULL)
    {
        temp -> leftChild = temp -> rightChild = NULL;
        return temp;
    } else if(temp->size >	((*node)->size)) {
        if((*node)->rightChild == NULL) {
             temp -> leftChild = temp -> rightChild = NULL;
            (*node)->rightChild = temp;
        } else {
            (*node)->rightChild = insert(&(*node)->rightChild, temp);
        }
    } else if(temp->size < ((*node)->size)) {
        if((*node)->leftChild == NULL) {
             temp -> leftChild = temp -> rightChild = NULL;
            (*node)->leftChild = temp;
        } else {
            (*node)->leftChild =  insert(&(*node)->leftChild, temp);
        }
    }
   return *node;
}


void
deleteNode(treeNode **root, treeNode *delete)
{
    if(root == NULL) {
	return;
    } else if (*root == delete){ // Special Case here
        if(((*root)->leftChild != NULL) && ((*root)->rightChild == NULL)) {
            *root = (*root)->leftChild;
        } else if(((*root)->rightChild != NULL) && ((*root)->leftChild == NULL)) {
            (*root) = (*root)->rightChild;
        } else if(((*root)->leftChild != NULL) && ((*root)->rightChild != NULL)){	// both child
            treeNode *min =  FindMinSize((*root)->rightChild);
            min->leftChild =  (*root)->leftChild;
            min->rightChild = (*root)->rightChild;
            deleteNode(&(*root)->rightChild, min);
        }
    } else {
        if((*root)->leftChild == delete){
            if((delete->leftChild == NULL) && (delete->rightChild == NULL)){
                (*root)->leftChild = NULL;
            } else if((delete->leftChild != NULL) && (delete->rightChild == NULL)) {
                (*root)->leftChild = delete->leftChild;
            } else if((delete->rightChild != NULL) && (delete->leftChild == NULL)) {
                (*root)->rightChild = delete->rightChild;
            } else {
                treeNode *min =  FindMinSize((*root)->rightChild);
                (*root)->leftChild =  min;
                min->leftChild =  delete->leftChild;
                min->rightChild = delete->rightChild;
                deleteNode(&(*root)->rightChild, min);
            }
        } else if((*root)->rightChild == delete) {
            if((delete->leftChild == NULL) && (delete->rightChild == NULL)){
                (*root)->leftChild = NULL;
            } else if((delete->leftChild != NULL) && (delete->rightChild == NULL)) {
                (*root)->leftChild = delete->leftChild;
            } else if((delete->rightChild != NULL) && (delete->leftChild == NULL)) {
                (*root)->rightChild = delete->rightChild;
            } else {	// both child
                treeNode *min =  FindMinSize((*root)->rightChild);
                (*root)->leftChild =  min;
                min->leftChild =  delete->leftChild;
                min->rightChild = delete->rightChild;
                deleteNode(&(*root)->rightChild, min);
            }
        } else {
            if((*root)->size > delete->size)
                deleteNode(&(*root)->leftChild, delete);
            else
                deleteNode(&(*root)->rightChild, delete);
	   }
    }
} // end of deleteNode

treeNode*
Search(treeNode *node, size_t size, treeNode *current_min)
{
    if(node == NULL)
    {
        return current_min;
    } else if(size > node->size){
        return Search(node->rightChild, size, current_min);
    } else {	 
   	return node;
    }
}



void
insertHelper(treeNode *node){
    root = insert(&root, node);
 // rootAddress = cs550_Address_Insert(&rootAddress, node);
}


void
deleteHelper(treeNode *delete){
    deleteNode(&root, delete);
//  cs550_delete_AddressNode(&rootAddress, delete);
    
}

void
merge(treeNode *node1,treeNode *node2){
    printf("Mergine Nodes");
    if((node1 + node1->size) == node2) {
        node1->size = node1->size + node2->size;
        deleteHelper(node2);
    } else if((node2 + node2->size) == node1) {
        node2->size = node1->size + node2->size;
        deleteHelper(node1);
    } else {
        printf(" Error Merge Failed ");
    }
}

/***** FOLLOWING FUCNTION WERE WORKING BUT NOW COMMENTED DUE TO MAJOR ISSUES AT LAST MINUTES
 
treeNode*
FindMinAddr(treeNode *node)
 {
   if(node==NULL)
    {
        return node;
    }
    if(node->leftAddress)
        return FindMinAddr(node->leftAddress);
    else
        return node;
 }
 
 
treeNode*
cs550_Address_Insert(treeNode **node,treeNode *temp)
 {
     cs550_print("\n HERE Called insert Address Node %lu %lu\n ",(size_t)(*node), (size_t)temp);
 
     if((*node) == NULL)
     {
         temp -> leftAddress = temp -> rightAddress = NULL;
         return temp;
     } else if (&(*node) > &temp) {
         if((*node)->rightAddress == NULL) {
             temp -> leftAddress = temp -> rightAddress = NULL;
             (*node)->rightAddress = temp;
         } else {
             (*node)->rightAddress = cs550_Address_Insert(&(*node)->rightAddress, temp);
         }
     } else if(&(*node) < &temp) {
         if((*node)->leftAddress == NULL) {
             temp -> leftAddress = temp -> rightAddress = NULL;
             (*node)->leftAddress = temp;
         } else {
             (*node)->leftAddress =  cs550_Address_Insert(&(*node)->leftAddress, temp);
         }
     }
    return *node;
}
 
void
cs550_delete_AddressNode(treeNode **rootAddress, treeNode *delete)
 {
     if(rootAddress == NULL) {
         return ;
     } else if (&(*rootAddress) == &delete){
         cs550_print("\n Delete Node Found \n");
         if(((*rootAddress)->leftAddress != NULL) && ((*rootAddress)->rightAddress == NULL)) {
             printf("\n root becomes left \n");
             *rootAddress = (*rootAddress)->leftAddress;
         } else if(((*rootAddress)->rightAddress != NULL) && ((*rootAddress)->leftAddress == NULL)) {
             printf("\n root becomes right \n");
             (*rootAddress) = (*rootAddress)->rightAddress;
         } else if(((*rootAddress)->leftAddress != NULL) && ((*rootAddress)->rightAddress != NULL)){	// both child
             treeNode *min =  FindMinAddr((*rootAddress)->rightAddress);
             min->leftAddress =  (*rootAddress)->leftAddress;
             min->rightAddress = (*rootAddress)->rightAddress;
             cs550_deleteNode(&(*rootAddress)->rightAddress, min);
         }
     } else {
         if(&(*rootAddress)->leftAddress == &delete){
             cs550_print("\n Node Left \n");
             if((delete->leftAddress == NULL) && (delete->rightAddress == NULL)){ // node does not have childs
                 (*rootAddress)->leftAddress = NULL;
             } else if((delete->leftAddress != NULL) && (delete->rightAddress == NULL)) {
                 (*rootAddress)->leftAddress = delete->leftAddress;
             } else if((delete->rightAddress != NULL) && (delete->leftAddress == NULL)) {
                 (*rootAddress)->rightAddress = delete->rightAddress;
             } else {	// both child
                 treeNode *min =  FindMinAddr((*rootAddress)->rightAddress);
                 (*rootAddress)->leftAddress =  min;
                 min->leftAddress =  delete->leftAddress;
                 min->rightAddress = delete->rightAddress;
                 cs550_deleteNode(&(*rootAddress)->rightAddress, min);
             }
         } else if(&(*rootAddress)->rightAddress == &delete) {
             cs550_print("\n Node Right \n");
             if((delete->leftAddress == NULL) && (delete->rightAddress == NULL)){
                 (*rootAddress)->leftAddress = NULL;
             } else if((delete->leftAddress != NULL) && (delete->rightAddress == NULL)) {
                 (*rootAddress)->leftAddress = delete->leftAddress;
             } else if((delete->rightAddress != NULL) && (delete->leftAddress == NULL)) {
                 (*rootAddress)->rightAddress = delete->rightAddress;
             } else {	// both child
                 treeNode *min =  FindMinAddr((*rootAddress)->rightAddress);
                 (*rootAddress)->leftAddress =  min;
                 min->leftAddress =  delete->leftAddress;
                 min->rightAddress = delete->rightAddress;
                 cs550_deleteNode(&(*rootAddress)->rightAddress, min);
             }
         } else {
             if((*rootAddress)->size > delete->size)
                 cs550_deleteNode(&(*rootAddress)->leftAddress, delete);
             else
                 cs550_deleteNode(&(*rootAddress)->rightAddress, delete);
 		      }
     }
 } // end of cs550_deleteAddress
 
 
 
 
treeNode *
AddressSearch(treeNode *rootAddress, size_t address)
 {
     treeNode *node;
     size_t sz = (size_t)&root;
     if(rootAddress == NULL)
     {
        return NULL;
    } else if (((size_t)rootAddress == address)) {
        return rootAddress;
    } else if((size_t)rootAddress < address) {
        node = AddressSearch(rootAddress->rightAddress, address);
    } else if((size_t)rootAddress > address) {
        node = AddressSearch(rootAddress->leftAddress, address);
    }
    return node;
}


   **********     END OF ADDRESSING CODE            ******************/


void *
cs550_malloc(size_t req){
    
    size_t sz = (8 - (req % 8)) + req;
    treeNode *found = Search(root, sz, NULL);
    cs550_print("\nAllocating Memory Block for size %lu\n ",req);
    if(found != 0) {
        cs550_print("Best fit Node Found as %lu Address\n",found->size);
        deleteNode(&root, found);
	//void *vp = (char *)found + sizeof(size_t);
        //return vp;
	 size_t retain = found->size - sz- sizeof(size_t);
         treeNode * assignedNode = NULL;
         if(sizeof(treeNode) < retain) {
             treeNode *splittedNode = (treeNode *)(((char *) found) + sz + sizeof(size_t));
             splittedNode->size = retain - sizeof(size_t);//splittedNode - sizeof(size_t);
             void *vp = (char *)splittedNode + sizeof(size_t);
             printf("Splitting the node for size %lu\n ",sz);
             insertHelper(vp);
             assignedNode = (found + sizeof(size_t));
             assignedNode-> size = sz;
             return (void *)assignedNode;
         } else {
             assignedNode = (treeNode *)(((char *) found) + sizeof(size_t));
             assignedNode->size = found->size;
             return (void *) assignedNode;
         }
         /************** END OF SPLIT FUNCTIONALITY **************/
    }
    size_t sb_req = sz + sizeof(size_t);
    sb_req = sb_req < sizeof(treeNode) ? sizeof(treeNode) : sb_req;
    treeNode *new_block = (treeNode *) sbrk(sb_req);
    new_block->size = sb_req - sizeof(size_t);
    void *vp = (char *) new_block + sizeof(size_t);
    cs550_print(">>> Allocated %lu new bytes.\n", new_block->size);
    return vp;
}

void
cs550_free(void *vp){
    if (vp != 0) {
        treeNode *node = (treeNode *)(((char *) vp) - sizeof(size_t));
	/************** ADDRESIING ISSUE : MERGING FUNCTION DISABLED  ***********
          size_t end_address = (size_t)((node) + node->size + sizeof(size_t));
          size_t start_address = (size_t)node;
       

	  treeNode *nodefound = AddressSearch(rootAddress, start_address);
          if(nodefound != 0) {
              printf("\nFree  Node Merging 1 ");
              merge(nodefound, node);
          }
        
          nodefound = AddressSearch(rootAddress, end_address);
          if(nodefound != 0) {
              printf("\nFree  Node Merging 2 ");
              merge(nodefound, node);
         }
	************* END OF MERGING FUNCTIONALITY *******************************/
        cs550_print(" <<< Freed %lu bytes at %lu...\n", node->size, node);
        insertHelper(node);
    }
}

void* 
cs550_calloc(size_t nmemb, size_t size){
    cs550_print("\nCalloc called for size %lu with block size %lu\n",size,nmemb);    
    size_t req = nmemb * size;
    void *vp = cs550_malloc(req);
    memset(vp, 0, req);
    return vp;
}

void* 
cs550_realloc(void *ptr, size_t size){
    cs550_print("\nRealloc called for size %lu \n",size);    
    if(!ptr){
        return cs550_malloc(size);
    } else {
   	void *vp = cs550_malloc(size);
    	memmove(vp, ptr, size);
    	cs550_free(ptr);
	return vp;
    }
}

/******* TEST CODE ********/

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
         void *p = cs550_calloc(20,i+20);
	 cs550_free(p);
   }
}


void testrealloc(){
     cs550_print("Test Realloc \n");
     void *p = cs550_malloc(20);
     cs550_free(p);
     void *q = cs550_realloc(p,40); 
     cs550_free(q);
}



/* KINDLY COPY Test Cases and DRIVER CODE of tests AT my_test.c which isn't complete */

   int main()
   {
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
      return 1;
   }
 
/****** EOF ************/
