package com.recruit.dto.admin;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.List;

@Data
public class DispatchPermissionsDTO {

    @Positive(message = "{group.id.positive}")
    @NotNull(message = "{group.id.not-null}")
    private Integer groupId;

    private List<Integer> permissionIds;
}
