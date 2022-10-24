package com.recruit.common.observer.company;

import com.recruit.common.observer.Observer;
import com.recruit.common.observer.Subject;
import lombok.Data;

/**
* @author Eval
*
* 被观察者子类——钛动科技公司
*/
@Data
public class TecDo extends Subject {

    /**
    * 公司名
    */
    private String name = "钛动科技";

    /**
    * 公司外文名
    */
    private static String foreignName ="TecDo";

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.setMessage(getName(), getState(), getPositionName());
            o.update();
        }
    }
}