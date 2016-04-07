

package studentRecordsBackup.bst;

public interface ObserverI {
    public void addObserver(Node node); // register call
    public void removeObserver(Node node); // Unregister
    public void notifyObservers(int UPDATE_VALUE); //  notifyall
}
