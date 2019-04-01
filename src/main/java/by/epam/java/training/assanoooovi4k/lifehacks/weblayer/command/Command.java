package by.epam.java.training.assanoooovi4k.lifehacks.weblayer.command;

import by.epam.java.training.assanoooovi4k.lifehacks.exception.DaoException;
import by.epam.java.training.assanoooovi4k.lifehacks.exception.ServiceException;
import org.omg.CORBA.portable.ApplicationException;

import javax.servlet.ServletException;
import java.io.IOException;

@FunctionalInterface
public interface Command {
    CommandResult execute(RequestContent requestContent) throws ServiceException, DaoException, IOException, ServletException;
}
