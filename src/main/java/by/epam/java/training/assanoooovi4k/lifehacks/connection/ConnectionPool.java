package by.epam.java.training.assanoooovi4k.lifehacks.connection;

import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.MissingResourceException;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;

//should be cloneable???
public class ConnectionPool {
    private static final Logger LOGGER = LogManager.getLogger(ConnectionPool.class);

    private static final String DATABASE_PROPERTY = "property.database";
    private static final String DATABASE_URL = "db.url";
    private static final String DATABASE_USER = "db.user";
    private static final String DATABASE_PASSWORD = "db.password";
    private static final String DATABASE_USE_UNICODE = "db.useUnicode";
    private static final String DATABASE_POOL_SIZE = "db.poolSize";

    private static ArrayBlockingQueue<ProxyConnection> connectionQueue;

    private static ConnectionPool instance = null;
    private static ReentrantLock lock = new ReentrantLock();
    private static AtomicBoolean instanceStatus = new AtomicBoolean(false);

    private static int poolSize;

    private ConnectionPool() {
        //maybe check instance
    }

    public static ConnectionPool getInstance() {
        if (!instanceStatus.get()) {
            lock.lock();
            try {
                if (!instanceStatus.get()) {
                    instance = new ConnectionPool();
                    //register Driver???
                    init();
                    instanceStatus.set(true);
                }
            } finally {
                lock.unlock();
            }
        }
        return instance;
    }

    public ProxyConnection getConnection() {
        ProxyConnection proxyConnection = null;

        try {
            proxyConnection = connectionQueue.take();
            LOGGER.log(Level.INFO, "Take connection from connection pool");

        } catch (InterruptedException e) {
            LOGGER.log(Level.ERROR, "Can't take connection from connection pool",e);
        }

        return proxyConnection;
    }

    void putConnection(ProxyConnection proxyConnection) {
        try {
            connectionQueue.put(proxyConnection);
            LOGGER.log(Level.INFO, "Put connection to connection pool");
        } catch (InterruptedException e) {
            LOGGER.log(Level.ERROR, "Can't put connection to connection pool", e);
        }
    }

    public void destroyConnections() {
        for (int i = 0; i < poolSize; i++) {
            ProxyConnection proxyConnection = null;

            try {
                proxyConnection = connectionQueue.take();
            } catch (InterruptedException e) {
                LOGGER.log(Level.WARN, e);
            } finally {
                if (proxyConnection != null) {
                    proxyConnection.trueClose();
                }
            }
        }
    }

    private static void init() {
        ResourceBundle resourceBundle;

        try {
            resourceBundle = ResourceBundle.getBundle(DATABASE_PROPERTY);
        } catch (MissingResourceException e) {
            LOGGER.log(Level.FATAL, "Not found bundle for database", e);
            throw new RuntimeException("Not found bundle for database");
        }

        String url = resourceBundle.getString(DATABASE_URL);
        String user = resourceBundle.getString(DATABASE_USER);
        String password = resourceBundle.getString(DATABASE_PASSWORD);
        String useUnicode = resourceBundle.getString(DATABASE_USE_UNICODE);
        String poolSizeString = resourceBundle.getString(DATABASE_POOL_SIZE);

        Properties properties = new Properties();
        properties.put("user", user);
        properties.put("password", password);
        properties.put("useUnicode", useUnicode);

        poolSize = Integer.parseInt(poolSizeString);

        connectionQueue = new ArrayBlockingQueue<ProxyConnection>(poolSize);

        for (int i = 0; i < poolSize; i++) {
            Connection connection;

            try {
                connection = DriverManager.getConnection(url, properties);
            } catch (SQLException e) {
                LOGGER.log(Level.FATAL, "Not found connection for database", e);
                throw new RuntimeException("Not found connection for database");
            }

            ProxyConnection proxyConnection = new ProxyConnection(connection);

            try {
                connectionQueue.put(proxyConnection);
            } catch (InterruptedException e) {
                LOGGER.log(Level.ERROR, "Can't put connection in pool",e);
            }
        }

        LOGGER.log(Level.INFO, "Pool created");
    }
}
