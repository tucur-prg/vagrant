import java.net.URI;
import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;
import java.util.logging.Logger;
import java.util.logging.Level;

import com.couchbase.client.CouchbaseClient;

public class Send {
    public static void main(String[] args) {
        try {
//            System.setProperty("net.spy.log.LoggerImpl", "net.spy.memcached.compat.log.SunLogger");
//            Logger.getLogger("net.spy.memcached").setLevel(Level.FINEST);

            List<URI> uris = new LinkedList<URI>();

            uris.add(URI.create("http://localhost:8091/pools"));

            CouchbaseClient client = new CouchbaseClient(uris, "default", "");

            client.set("my-first-document", "Hello World!!").get();

            System.out.println("");
            System.out.println(client.get("my-first-document"));
            System.out.println("");

            client.shutdown();
        } catch (Exception e) {
            System.err.println("Error connecting to Couchbase: " + e.getMessage());
            System.exit(0);
        }
    }
}
