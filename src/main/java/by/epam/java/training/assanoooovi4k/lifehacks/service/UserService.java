package by.epam.java.training.assanoooovi4k.lifehacks.service;

import by.epam.java.training.assanoooovi4k.lifehacks.exception.ServiceException;
import by.epam.java.training.assanoooovi4k.lifehacks.weblayer.command.CommandResult;
import by.epam.java.training.assanoooovi4k.lifehacks.weblayer.command.RequestContent;
import by.epam.java.training.assanoooovi4k.lifehacks.dao.user.UserDaoImpl;
import by.epam.java.training.assanoooovi4k.lifehacks.exception.DaoException;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.UserRole;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.User;
import by.epam.java.training.assanoooovi4k.lifehacks.util.constant.Constant;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.omg.CORBA.portable.ApplicationException;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public interface UserService {
    CommandResult createUser(RequestContent requestContent) throws ServiceException;
    CommandResult signIn (RequestContent requestContent) throws ServiceException;
    CommandResult logout (RequestContent requestContent);
}
