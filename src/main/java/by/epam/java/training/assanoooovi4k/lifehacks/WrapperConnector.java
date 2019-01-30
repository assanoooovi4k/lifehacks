package by.epam.java.training.assanoooovi4k.lifehacks;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class WrapperConnector {
    private static final Logger LOGGER = Logger.getLogger(WrapperConnector.class);

    private Connection connection;

    public WrapperConnector() {
        try {
            connection = ConnectorDB.getConnection();
        } catch (SQLException e) {
            LOGGER.warn(e.getMessage());
            e.printStackTrace();
        }
    }

    public Statement getStatement() throws SQLException {
        if (connection != null) {
            Statement statement = connection.createStatement();

            if (statement != null) {
                return statement;
            }
        }

        LOGGER.error("Connection or statement is null");
        throw new SQLException("Connection or statement is null");
    }

    public void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                LOGGER.error("Wrong statement", e);
            }
        }
        else {
            LOGGER.error("Statement is null");
        }
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                LOGGER.error("Wrong connection", e);
            }
        }
        else {
            LOGGER.error("Connection is null");
        }
    }
}
