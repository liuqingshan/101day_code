/**
 * Created by apple on 16-5-17.
 */
public class ConcreteIterator implements Iterator {

    private int array[] = null;
    private int i = 0;

    public ConcreteIterator(int array[]) {
        this.array = array;
    }

    @Override
    public boolean hasNext() {
        return i < this.array.length;
    }

    @Override
    public Object next() {
      return this.array[i++];
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
