package com.recruit.common.observer.company;

import com.recruit.common.observer.Observer;
import com.recruit.common.observer.Subject;
import lombok.Data;

/**
* @author Eval
*
* 被观察者子类——顺丰公司
*/
@Data
public class ShunFeng extends Subject {

    /**
    * 公司名
    */
    private String name = "顺丰";

    /**
    * 公司外文名
    */
    private static String foreignName ="ShunFeng";

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.setMessage(getName(), getState(), getPositionName());
            o.update();
        }
    }
}