import java.io.File;
import java.io.FileInputStream;

public class Driver {

	public static void main(String[] args) {
		try {
			if(args.length == 1) {
				File fileName = new File(args[0].toString());
				if (fileName.canRead()) {
					try {
						FileInputStream inputStream = new FileInputStream(fileName);
						FileProcessor proc = new FileProcessor(inputStream);
						StringOperations stringOp = new StringOperations();
						String readLine = null;
						while((readLine = proc.readLineFromFile()) != null){
							stringOp.processing(readLine.trim());
						}
						stringOp.getMax();
					} catch (Exception e) {
						System.out.println("Failed to create a fileInputStream "+e.getMessage());
						e.printStackTrace();
						System.exit(1);
					}
				} else {
					System.out.println(" Input File is unreadable ");
					System.exit(1);
				}
			} else {
				System.out.println(" Expected Input File Missing ");
				System.exit(1);
			}
		} catch (Exception e){
			System.out.println("Exception Occoured during processing "+e.getMessage());
			e.printStackTrace();
			System.exit(1);
		}
	}
}
