package by.epam.java.training.assanoooovi4k.lifehacks;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        try (Connection connection = ConnectorDB.getConnection()){
            System.out.println("HI");

        }
    }
}
