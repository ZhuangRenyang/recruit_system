package com.recruit.common.observer.user;

import com.recruit.common.observer.Observer;
import com.recruit.common.util.SingleUtil;
import lombok.Data;

/**
* @author Eval
*
* 观察者子类——eval789用户
*/
@Data
public class eval789 extends Observer {

    /**
    * 观察者名字
    */
    private String name = "eval789";

    @Override
    public void update() {
        // 根据message和name存一条记录到全局map中：messageMap
        SingleUtil.messageMap.put(name, message);
    }
}