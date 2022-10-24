package com.recruit.common.observer.company;

import com.recruit.common.observer.Observer;
import com.recruit.common.observer.Subject;
import lombok.Data;

/**
* @author Eval
*
* 被观察者子类——虎扑公司
*/
@Data
public class HuPu extends Subject {

    /**
    * 公司名
    */
    private String name = "虎扑";

    /**
    * 公司外文名
    */
    private static String foreignName ="HuPu";

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.setMessage(getName(), getState(), getPositionName());
            o.update();
        }
    }
}