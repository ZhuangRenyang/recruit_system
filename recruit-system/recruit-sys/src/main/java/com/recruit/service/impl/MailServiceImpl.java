package com.recruit.service.impl;

import com.recruit.dto.user.MailDTO;
import com.recruit.service.MailService;
import com.recruit.service.RedisService;
import com.recruit.vo.CreatedVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Param eval
 * @Time 2022/8/27 11:25
 */
@Service
public class MailServiceImpl  implements MailService {
    @Value("${spring.mail.username}")
    String fromMail;

    @Resource
    JavaMailSender mailSender;
    @Resource
    RedisService redisService;

    @Override
    public SimpleMailMessage sendMail(String recipient, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromMail);
        message.setTo(recipient);
        message.setSubject(subject);
        message.setText(content);
        return message;
    }

    @Override
    /**
     * recipient : 邮件接收人
     */
    public CreatedVO SendCodeMail(String recipient) {
        try{
            String code = String.valueOf(Math.random()).substring(2,8);
            SendMailSync(recipient,"验证码","<p>【校企招聘网】验证码: (<b>" +
                    code+"</b>)，用于邮箱验证码登录，5分钟内有效。验证码提供给他人可能导致帐号被盗，请勿泄露，谨防被骗。</p>");

            redisService.setMailCode(code);
            return new CreatedVO(200,"邮件已到达");
        }catch (MailException e){
            return new CreatedVO(200,"邮件发送失败,请重试!");
        }

    }

    // 异步发送邮件
    @Async
    void SendMailSync(String recipient,String subject,String content){
        try{
            mailSender.send(sendMail(recipient,subject,content));
        }catch (MailException e){
            System.out.println("发送邮件失败"+e);
        }
    }
}
