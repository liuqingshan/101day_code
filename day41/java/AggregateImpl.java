/**
 * Created by apple on 16-5-17.
 */
public class AggregateImpl implements Aggregate {

    private int[] array = {1, 2, 3, 4, 5};

    @Override
    public Iterator createIterator() {
        return new ConcreteIterator(array);
    }
}
