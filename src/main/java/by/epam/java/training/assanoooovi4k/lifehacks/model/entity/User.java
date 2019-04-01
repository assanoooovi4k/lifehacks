package by.epam.java.training.assanoooovi4k.lifehacks.model.entity;


import by.epam.java.training.assanoooovi4k.lifehacks.model.entityenum.UserRole;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class User {
    private Long userId;
    private boolean isBlocked;
    private String username;
    private String firstName;
    private String secondName;
    private String email;
    private String password;
    private UserRole role;




}
