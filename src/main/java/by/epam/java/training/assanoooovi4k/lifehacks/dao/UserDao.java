package by.epam.java.training.assanoooovi4k.lifehacks.dao;

import by.epam.java.training.assanoooovi4k.lifehacks.WrapperConnector;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.User;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.UserRole;
import org.apache.log4j.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class UserDao extends AbstractDao<User>{
    private static final Logger LOGGER = Logger.getLogger(UserDao.class);

    private static final String SQL_SELECT_ALL_USERS = "SELECT * FROM user";
    private static final String SQL_SELECT_USERS_BY_ID = "SELECT * FROM user WHERE id = '%d'";
    private static final String SQL_CREATE_USER = "INSERT INTO user(is_blocked, username, email, password, role) " +
            "VALUES (false, ?, ?, ?, USER)";

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
        Statement statement = null;

        try {
            statement = connector.getStatement();
            ResultSet resultSet = statement.executeQuery(String.format(SQL_SELECT_USERS_BY_ID, id));
            if (resultSet.next()) {
                return createEntity(resultSet);
            }
            else {
                LOGGER.info("No result set");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeStatement(statement);
        }

        return null;
    }

//    PreparedStatement preparedStatement = null;
//    ResultSet resultSet = null;
//        try {
//        preparedStatement = connector.getPreparedStatement(SQL_SELECT_USERS_BY_ID);
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }

    @Override
    public boolean deleteById(Long id) {
        return false;
    }

    @Override
    public boolean delete(User entity) {
        return false;
    }

    @Override
    public boolean create(User user) {
        boolean
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement= connector.getPreparedStatement(SQL_CREATE_USER);
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeStatement(preparedStatement);
        }

        return null;
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
