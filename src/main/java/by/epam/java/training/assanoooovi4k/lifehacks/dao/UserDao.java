package by.epam.java.training.assanoooovi4k.lifehacks.dao;

import by.epam.java.training.assanoooovi4k.lifehacks.WrapperConnector;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.User;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.UserRole;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends AbstractDao<User>{
    public static final String SQL_SELECT_ALL_USERS = "SELECT * FROM user";

    public UserDao() {
        this.connector = new WrapperConnector();
    }

    @Override
    public List<User> findAll() {
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connector.getStatement();
            resultSet = statement.executeQuery(SQL_SELECT_ALL_USERS);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeStatement(statement);
        }

        return createList(resultSet);
    }

    @Override
    public User findById(Long id) {
        try {
            PreparedStatement statement = (PreparedStatement) connector.getStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteById(Long id) {
        return false;
    }

    @Override
    public boolean delete(User entity) {
        return false;
    }

    @Override
    public boolean create(User entity) {
        return false;
    }

    @Override
    public User update(User entity) {
        return null;
    }

    @Override
    protected User createEntity(ResultSet resultSet) throws SQLException {
        return new User(
                resultSet.getLong("user_id"), resultSet.getBoolean("is blocked"),
                        resultSet.getString("username"), resultSet.getString("email"),
                        resultSet.getString("password"),
                        UserRole.valueOf(resultSet.getString("role"))
        );
    }
}
