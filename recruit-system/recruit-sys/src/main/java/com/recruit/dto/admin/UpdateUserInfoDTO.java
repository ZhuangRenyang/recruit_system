package com.recruit.dto.admin;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class UpdateUserInfoDTO {

    @NotEmpty(message = "{group.ids.not-empty}")
    private List<@Min(1) Integer> groupIds;

}
