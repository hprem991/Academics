package wordCount.treesForStrings;


import wordCount.treesForStrings.Node;

public class AVLTree {

	Node root;

	public void AVLTree(){
		root = null;
	}

	// PRIVATE METHODS DO NOT TAMPER

	private int findHeight(Node node){
		if(node == null)
			return 0;
		else {
			int left = findHeight(node.left);
			int right = findHeight(node.right);
			return (left > right ? left + 1 : right + 1);
		}
	}

	private int height(Node node){
		if(node == null)
			return 0;
		else {
			int left = height(node.left);
			int right = height(node.right);
			return (left > right ? left : right);
		}
	}
	

	private void printTree(Node node){
		if(null == node)
			return;
		else {
			printTree(node.left);
			System.out.println(node.getCurrentWord()+" Count "+node.getCurrentWordCount());
			printTree(node.right);
		}
	}


	private Node search(Node node, String searchQuery){
		if(null == node) {
			return null;
		} else if(node.getCurrentWord().compareTo(searchQuery) == 0) {
			System.out.println("Node Found with Search String "+searchQuery+" Node Value "+node.getCurrentWord());
			return node; 
		} else if(searchQuery.compareTo(node.getCurrentWord()) > 0){
			System.out.println("node.getCurrentWord().compareTo(searchQuery) > 0" +searchQuery.compareTo(node.getCurrentWord())+"  "+node.getCurrentWord() + " Search " +searchQuery); 
			search(node.left, searchQuery);
		} else {
			System.out.println("node.getCurrentWord().compareTo(searchQuery) < 0" +searchQuery.compareTo(node.getCurrentWord())+"  "+node.getCurrentWord() + " Search " +searchQuery); 
			search(node.left, searchQuery);
		}
		return node;
	}

	private Node rotateRight(Node node){
		Node left = node.left;
		Node right = left.right;

		left.right = node;
		node.left = right;

		node.setHeight(Math.max(height(node.left), height(node.right)) + 1);
		left.setHeight(Math.max(height(left.left), height(node.right)) + 1);

		return left;
	}


	private Node rotateLeft(Node node){
		Node right = node.right;
		Node left = right.left;

		right.left = node;
		node.right = left;

		node.setHeight(Math.max(height(node.left), height(node.right)) + 1);
		right.setHeight(Math.max(height(right.left), height(right.right)) + 1);

		return right;
	}


	private Node insertInternal(Node root, Node node){
		if(null == root) {
			return node;
		} 
		int test = root.getCurrentWord().compareTo(node.getCurrentWord());
		if(root.getCurrentWord().compareTo(node.getCurrentWord()) == 0){
			root.setCurrentWordCount(root.getCurrentWordCount() + 1);
		} else if(root.getCurrentWord().compareTo(node.getCurrentWord()) < 1){
			System.out.println("root.getCurrentWord().compareTo(node.getCurrentWord()) < 1 := " +root.getCurrentWord().compareTo(node.getCurrentWord())+"  "+node.getCurrentWord() + " root " +root.getCurrentWord()); 
		
			if(root.right == null)
				root.right = insertInternal(root.right, node);
			else 
				insertInternal(root.right, node);
		} else {
			System.out.println("root.getCurrentWord().compareTo(node.getCurrentWord()) > 1:--" +root.getCurrentWord().compareTo(node.getCurrentWord())+"  "+node.getCurrentWord() + " root " +root.getCurrentWord()); 
			
			if(root.left == null) 
				root.left = insertInternal(root.left, node);
			else
				insertInternal(root.left, node);
		}

		root.setHeight(Math.max(height(root.left), height(root.right)) + 1);

		int currentBalance = (null == root) ? 0 :(height(root.left) - height(root.right));

		if(currentBalance > 1 && (node.getCurrentWord().compareTo(root.left.getCurrentWord()) < 0)){
			return rotateRight(node);
		}

		if(currentBalance < -1 && (node.getCurrentWord().compareTo(root.right.getCurrentWord()) > 0)){
			return rotateLeft(node);
		}

		// Double rotation

		if(currentBalance > 1 && (node.getCurrentWord().compareTo(root.left.getCurrentWord()) > 0)){
			root.left = rotateLeft(root.left);
			return rotateRight(root);
		}

		if(currentBalance < -1 && (node.getCurrentWord().compareTo(root.right.getCurrentWord()) < 0)){
			root.right = rotateRight(root.right);
			return rotateLeft(root);
		}

		return root;
	}


	// Public Function From here	

	public void calculateheight(){
		System.out.println("Height "+findHeight(root));
	}

	public void insert(String word){
		Node newNode = new Node(word);
		root = insertInternal(root, newNode);
	}

	public void print(){
		System.out.println("\n PRINTING TREE \n");
		printTree(root);	
	}

	public void find(String word){

		long startTime = System.nanoTime();
		Node res = null;
		for(int i = 0; i < 2000; i++) {
			res = search(root, word);

		}
		if(null == res){
			System.out.println("\n Search Failed "+word);
		} else {
			long finishTime = System.nanoTime();
			long totalTime = (finishTime - startTime) / 2000;
			System.out.println(" SEARCH TIME "+totalTime+" nanoseconds ");
		}
	}
}
