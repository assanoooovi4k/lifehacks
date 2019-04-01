package by.epam.java.training.assanoooovi4k.lifehacks.model.dto;

import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.UserRole;
import lombok.*;

@EqualsAndHashCode
@AllArgsConstructor
@Getter
@Setter
public class UserCommentDto {
    private Long commentId;
    private String username;
    private UserRole userRole;
    private Long lifeHackId;
    private String description;
    private String dateOfComment;
}
