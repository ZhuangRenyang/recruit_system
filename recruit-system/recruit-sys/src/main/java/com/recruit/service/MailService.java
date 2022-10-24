package com.recruit.service;

import com.recruit.vo.CreatedVO;
import org.springframework.mail.SimpleMailMessage;

/**
 * @Param eval
 * @Time 2022/8/27 11:25
 */
public interface MailService {
    // 封装基础的发送邮箱接口 params:接收人,标题,内容
    SimpleMailMessage sendMail(String recv, String subject, String content);

    // 发送验证码邮件,参数只需要接收收件人即可
    CreatedVO SendCodeMail(String recvMail);
}
