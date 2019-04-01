package by.epam.java.training.assanoooovi4k.lifehacks.weblayer.listener;

import by.epam.java.training.assanoooovi4k.lifehacks.util.constant.Constant;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.UserRole;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class NewHttpSessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute(Constant.ROLE, UserRole.GUEST);
//        se.getSession().setAttribute(Constant.LOCALE, new Locale(ProjectConstant.BY_LOCALE_LANG, ProjectConstant.BY_LOCALE_COUNTRY));
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
