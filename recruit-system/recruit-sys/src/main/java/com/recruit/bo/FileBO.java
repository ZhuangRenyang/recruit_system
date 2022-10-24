package com.recruit.bo;

import lombok.Data;

@Data
public class FileBO {

    /**
     * 文件 id
     */
    private Integer id;

    /**
     * 文件 key，上传时指定的
     */
    private String key;

    /**
     * 文件路径
     */
    private String path;

    /**
     * 文件 URL
     */
    private String url;
}
