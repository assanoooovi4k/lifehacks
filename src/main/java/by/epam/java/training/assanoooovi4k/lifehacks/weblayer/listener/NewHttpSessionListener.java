package by.epam.java.training.assanoooovi4k.lifehacks.weblayer.listener;

import by.epam.java.training.assanoooovi4k.lifehacks.util.constant.Constant;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.UserRole;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Locale;

@WebListener
public class NewHttpSessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute(Constant.ROLE, UserRole.GUEST);
        se.getSession().setAttribute(Constant.LOCALE, new Locale(Constant.RU_LOCALE_LANG, Constant.RU_LOCALE_COUNTRY));
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
