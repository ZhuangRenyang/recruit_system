package com.recruit.common.observer.company;

import com.recruit.common.observer.Observer;
import com.recruit.common.observer.Subject;
import lombok.Data;

/**
* @author Eval
*
* 被观察者子类——作业帮公司
*/
@Data
public class HomeworkHelp extends Subject {

    /**
    * 公司名
    */
    private String name = "作业帮";

    /**
    * 公司外文名
    */
    private static String foreignName ="HomeworkHelp";

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.setMessage(getName(), getState(), getPositionName());
            o.update();
        }
    }
}