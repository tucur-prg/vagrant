import java.io.Console;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.concurrent.TimeUnit;

import com.couchbase.client.java.Cluster;
import com.couchbase.client.java.Bucket;
import com.couchbase.client.java.CouchbaseCluster;

import com.couchbase.client.java.env.CouchbaseEnvironment;
import com.couchbase.client.java.env.DefaultCouchbaseEnvironment;

import com.couchbase.client.java.document.JsonDocument;
import com.couchbase.client.java.document.json.JsonObject;

public class Conn {
    public static void main(String[] args) {
        try {
            Logger.getLogger("com.couchbase.client").setLevel(Level.OFF);

            if (args.length != 3) {
                System.err.println("Error invalid arguments.");
                System.err.println("Conn <host> <bucket> <remove>");
                System.err.println("remove: n=登録後に削除しない, y=登録後に削除する");
                System.exit(0);
            }

            Console c = System.console();
            if (c == null) {
                System.err.println("No console.");
                System.exit(0);
            }

            char[] password = c.readPassword("Bucket Password: ");

            CouchbaseEnvironment env = DefaultCouchbaseEnvironment.builder()
                    .connectTimeout(TimeUnit.SECONDS.toMillis(10))
                    .requestBufferSize(1024)
                    .build();

            Cluster cluster = CouchbaseCluster.create(env, args[0]);
            Bucket bucket = cluster.openBucket(args[1], String.valueOf(password));

            JsonObject user = JsonObject.empty()
                .put("name", "YAMADA")
                .put("age", 21);

            JsonDocument doc = JsonDocument.create("my-first-document", user);
            JsonDocument response = bucket.upsert(doc);

            JsonDocument my = bucket.get("my-first-document");

            System.out.println("Found: " + my);

            if ("y".equals(args[2])) {
                bucket.remove("my-first-document");
            }

            bucket.close();
            cluster.disconnect();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            System.exit(0);
        }
    }
}
