import java.lang.*;

public class Driver {
	
	public static void main(String[] args) {
		if(args.length == 1){
				int NUM_THREADS = Integer.parseInt(args[0]);
				if((NUM_THREADS > 0) && (NUM_THREADS < 6)) {
					CreateWorkers ob = new CreateWorkers();
				} else {
					System.out.println("NUM_THREADS invalid");
					System.exit(0);
				}
		} else  {
			System.out.println(" Invalid Command Line input "+args.length);
			System.exit(-1);
		}
	}
}
