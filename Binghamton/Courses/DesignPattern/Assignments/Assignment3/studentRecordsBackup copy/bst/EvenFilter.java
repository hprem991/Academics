
public class EvenFilter implements FilterI {
	@Override
	public boolean filter(Node node){
		return (node.getBNumber()%2);
	}
}
