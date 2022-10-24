package com.recruit.extension.file;

import com.recruit.module.file.Uploader;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;

/**
 * 文件上传配置类
 */
@Configuration
public class UploaderConfiguration {
    /**
     * 切换到七牛云文件上传实现类
     *
     * @return 七牛云文件上传实现类
     */
//    @Bean
//    @Primary
//    public Uploader qiNiuUploader() {
//        return new QiniuUploader();
//    }

    /**
     * @return 本地文件上传实现类
     */
    @Bean
    @Order
    @ConditionalOnMissingBean
    public Uploader uploader(){
        return new LocalUploader();
    }
}
