package by.epam.java.training.assanoooovi4k.lifehacks.dao;

import by.epam.java.training.assanoooovi4k.lifehacks.WrapperConnector;
import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractDao<T> {
    private static final Logger LOGGER = Logger.getLogger(AbstractDao.class);

    protected WrapperConnector connector;

    public abstract List<T> findAll();
    public abstract T findById(Long id);
    public abstract boolean deleteById(Long id);
    public abstract boolean delete(T entity);
    public abstract boolean create(T entity);
    public abstract T update(T entity);

    List<T> createList(ResultSet resultSet){//gen
        List<T> list = new ArrayList<>();
        try {
            while (resultSet.next()){
                list.add(createEntity(resultSet));
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    protected abstract T createEntity(ResultSet resultSet) throws SQLException;


    public void closeConnection() {
        connector.closeConnection();
    }

    public void closeStatement(Statement statement) {
        connector.closeStatement(statement);
    }
//    void executeQuery(String sql) {
//        try {
//            .execute(sql);
//            LOGGER.debug("SQL query: " + sql);
//            System.out.println("SQL query: " + sql);
//        } catch (SQLException e) {
//            LOGGER.warn("An error occurred for sql query: " + sql);
//            LOGGER.error(e);
//        }
//    }
//
//    ResultSet executeQueryWithResult(String sql) {
//        ResultSet resultSet = null;
//        try {
//            resultSet = connection.createStatement().executeQuery(sql);
//            LOGGER.debug("Sql query: " + sql);
//            System.out.println("Sql query: " + sql);
//        } catch (SQLException e) {
//            LOGGER.warn("An error occurred for sql query: " + sql);
//            LOGGER.error(e);
//        }
//        return resultSet;
//    }

}
