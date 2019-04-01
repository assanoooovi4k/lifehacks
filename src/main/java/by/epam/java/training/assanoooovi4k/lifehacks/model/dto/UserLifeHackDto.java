package by.epam.java.training.assanoooovi4k.lifehacks.model.dto;

import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.LifeHackCategory;
import lombok.*;

@EqualsAndHashCode
@AllArgsConstructor
@Getter
@Setter
public class UserLifeHackDto {
    private Long lifeHackId;
    private String username;
    private String name;
    private LifeHackCategory lifeHackCategory;
    private String description;
    private byte[] picture;
    private String pictureEnc;
    private int status;
    private String dateOfPosting;
}
