package ${classPath};

import com.recruit.common.observer.Observer;
import com.recruit.common.observer.Subject;
import lombok.Data;

/**
* @author Eval
*
* 被观察者子类——${name}公司
*/
@Data
public class ${className} extends Subject {

    /**
    * 公司名
    */
    private String name = "${name}";

    /**
    * 公司外文名
    */
    private static String foreignName ="${className}";

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.setMessage(getName(), getState(), getPositionName());
            o.update();
        }
    }
}