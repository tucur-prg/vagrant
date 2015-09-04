import java.io.Console;

import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.AMQP;

public class Recv {
    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            System.err.println("Error invalid arguments.");
            System.err.println("Recv <host> <user> <queue_name>");
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

        channel.queueDeclare(queueName, false, false, false, null);
        System.out.println("[*] Waiting for message. To exit press CTRL+C");

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws java.io.IOException {
                String message = new String(body, "UTF-8");
                System.out.println("[x] Received '" + message + "'");
            }
        };

        channel.basicConsume(queueName, true, consumer);
    }
}
