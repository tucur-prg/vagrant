import java.io.Console;

import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;

public class Send {
    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            System.err.println("Error invalid arguments.");
            System.err.println("Send <host> <user> <queue_name>");
            System.exit(0);
        }

        String host = args[0];
        String username = args[1];
        String queueName = args[2];

        Console c = System.console();
        if (c == null) {
            System.err.println("No console.");
            System.exit(0);
        }

        char[] password = c.readPassword("Password: ");

        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost(host);
        factory.setUsername(username);
        factory.setPassword(String.valueOf(password));
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        String message = "Hello World!";

        channel.queueDeclare(queueName, false, false, false, null);
        channel.basicPublish("", queueName, null, message.getBytes());
        System.out.println("[x] Send '" + message + "'");

        channel.close();
        connection.close();
    }
}
