package genericCheckpointing.src.genericCheckpointing.util;

public class MyAllTypesSecond extends SerializableObject {
	
	private char myCharT;
	private short myShortT;
	private float myFloatT;
	private double  myDoubleT;
	
	public MyAllTypesSecond(){
		// Default Constructor
	}
	
	public MyAllTypesSecond(int count){
		myCharT = (char) (Math.random() * count );
		myShortT = (short) (Math.random() * count);
		myFloatT = (float) (Math.random() * count);
		myDoubleT = Math.random() * count ;
	}
	
	public char getMyCharT() {
		return myCharT;
	}
	public void setMyCharT(char myCharT) {
		this.myCharT = myCharT;
	}
	
	public short getMyShortT() {
		return myShortT;
	}
	public void setMyShortT(short myShortT) {
		this.myShortT = myShortT;
	}
	
	public float getMyFloatT() {
		return myFloatT;
	}
	public void setMyFloatT(float myFloatT) {
		this.myFloatT = myFloatT;
	}
	
	public double getMyDoubleT() {
		return myDoubleT;
	}
	public void setMyDoubleT(double myDoubleT) {
		this.myDoubleT = myDoubleT;
	}
	
	@Override
	public String toString(){
		return "CHAR "+myCharT+" FLOAT "+myFloatT+" DOUBLE "+myDoubleT+" SHORT "+myShortT;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + myCharT;
		long temp;
		temp = Double.doubleToLongBits(myDoubleT);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + Float.floatToIntBits(myFloatT);
		result = prime * result + myShortT;
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyAllTypesSecond other = (MyAllTypesSecond) obj;
		if (myCharT != other.myCharT)
			return false;
		if (Double.doubleToLongBits(myDoubleT) != Double
				.doubleToLongBits(other.myDoubleT))
			return false;
		if (Float.floatToIntBits(myFloatT) != Float
				.floatToIntBits(other.myFloatT))
			return false;
		if (myShortT != other.myShortT)
			return false;
		return true;
	}

}
