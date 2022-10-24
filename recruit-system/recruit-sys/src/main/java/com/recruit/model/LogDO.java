package com.recruit.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("log")
public class LogDO  implements Serializable {

    private static final long serialVersionUID = -7471474245124682011L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    private Date createTime;


    private Date updateTime;

    @TableLogic
    private Date deleteTime;

    private String message;

    private Integer userId;

    private String username;

    private Integer statusCode;

    private String method;

    private String path;

    private String permission;
}
