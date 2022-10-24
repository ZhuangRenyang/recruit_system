package com.recruit.dto.user;

import io.github.talelin.autoconfigure.validator.EqualField;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;

@Data
@NoArgsConstructor
@EqualField(srcField = "password", dstField = "confirmPassword", message = "{password.equal-field}")
public class RegisterDTO {

    @NotBlank(message = "{username.not-blank}")
    @Length(min = 2, max = 10, message = "{username.length}")
    private String username;

    private String nickname;

    private List<Integer> groupIds;

    @Email(message = "{email}")
    private String email;

    @NotBlank(message = "{tel.not-blank}")
    private String tel;

    @NotBlank(message = "{password.new.not-blank}")
    @Pattern(regexp = "^[A-Za-z0-9_*&$#@]{6,22}$", message = "{password.new.pattern}")
    private String password;

    @NotBlank(message = "{password.confirm.not-blank}")
    private String confirmPassword;

    private String ver_code;
}
