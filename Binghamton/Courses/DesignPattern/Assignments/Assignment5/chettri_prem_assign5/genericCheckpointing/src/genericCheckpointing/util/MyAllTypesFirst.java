package genericCheckpointing.src.genericCheckpointing.util;

public class MyAllTypesFirst extends SerializableObject {

	private int myInt;
	private long myLong;
	private String myString;
	private boolean myBool;
	
	public MyAllTypesFirst() {
		// Default Constructor
	}
	
	public MyAllTypesFirst(int count) {
		// TODO Auto-generated constructor stub
		myInt = (int) (Math.random() * count);
		myLong = (long) Math.random();
		myString = ""+Math.random();
		myBool = Math.random() > 0.5 ? true :false;
	}
	
	
	public int getMyInt() {
		return myInt;
	}
	
	public void setMyInt(int myInt) {
		this.myInt = myInt;
	}
	
	public long getMyLong() {
		return myLong;
	}
	
	public void setMyLong(long myLong) {
		this.myLong = myLong;
	}
	
	
	public String getMyString() {
		return myString;
	}
	
	public void setMyString(String myString) {
		this.myString = myString;
	}
	
	public boolean getMyBool() {
		return myBool;
	}
	
	public void setMyBool(boolean myBool) {
		this.myBool = myBool;
	}
	
	@Override
	public String toString(){
		return "INT "+myInt+" LONG "+myLong+" STRING "+myString+" BOOL "+myBool;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (myBool ? 1231 : 1237);
		result = prime * result + myInt;
		result = prime * result + (int) (myLong ^ (myLong >>> 32));
		result = prime * result
				+ ((myString == null) ? 0 : myString.hashCode());
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
		MyAllTypesFirst other = (MyAllTypesFirst) obj;
		if (myBool != other.myBool)
			return false;
		if (myInt != other.myInt)
			return false;
		if (myLong != other.myLong)
			return false;
		if (myString == null) {
			if (other.myString != null)
				return false;
		} else if (!myString.equals(other.myString))
			return false;
		return true;
	}
}
