import java.net.URI;
import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;

import com.couchbase.client.CouchbaseClient;

public class Send {
    public static void main(String[] args) {
        try {
            List<URI> uris = new LinkedList<URI>();

            uris.add(URI.create("http://localhost:8091/pools"));

            CouchbaseClient client = new CouchbaseClient(uris, "default", "");

            client.set("my-first-document", "Hello World!!").get();

            System.out.println(client.get("my-first-document"));

            client.shutdown();
        } catch (Exception e) {
            System.err.println("Error connecting to Couchbase: " + e.getMessage());
            System.exit(0);
        }
    }
}
