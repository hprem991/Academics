Node Reverse(Node head) {
    
        Node temp1, temp2;
        temp1 = head.next;
        head.next = null;
      
        while(temp1 != null){
        
           temp2 = temp1.next;
           temp1.next = head;
           head = temp1;
           temp1 = temp2; 
        }
        
        return head;
}


