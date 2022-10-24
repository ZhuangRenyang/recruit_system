package com.recruit.common.util;

import com.recruit.common.observer.Subject;
import com.recruit.model.UserDO;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Eval
 * @create 2021/4/11 16:39
 */
public class SingleUtil {

    // 这个全局map用于存放被观察者类，key是类名，value是类对象（可以实现单例模式）
    public static Map<String, Subject> map = new HashMap<>();

    // 这个全局map用于存放被观察者每次更新数据时，求职者收到的消息（记得每次使用完都要清空）
    public static Map<String, String> messageMap = new HashMap<>();

    // 保存当前登录用户
    public static UserDO userDO;
}
