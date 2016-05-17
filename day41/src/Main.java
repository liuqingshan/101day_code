/**
 * Created by apple on 16-5-17.
 */
public class Main {
    public static void main(String ...args) {
        Aggregate aggregate = new AggregateImpl();

        Iterator iterator =  aggregate.createIterator();

        System.out.println(iterator);

        while(iterator.hasNext()) {
            System.out.println(iterator.next());
        }

    }
}
