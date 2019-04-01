package by.epam.java.training.assanoooovi4k.lifehacks.dao.comment;

import by.epam.java.training.assanoooovi4k.lifehacks.dao.AbstractDao;
import by.epam.java.training.assanoooovi4k.lifehacks.exception.DaoException;
import by.epam.java.training.assanoooovi4k.lifehacks.model.dto.UserCommentDto;
import by.epam.java.training.assanoooovi4k.lifehacks.model.entity.Comment;

import java.util.List;

public interface CommentDao extends AbstractDao<Comment> {
    List<UserCommentDto> findByLifeHackId(Long lifeHackId) throws DaoException;
}
