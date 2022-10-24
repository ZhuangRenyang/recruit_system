package com.recruit.common.observer;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Eval
 * @create 2021/4/10 23:26
 *
 * 被观察者抽象类
 */
@Data
public abstract class Subject {

    /**
     * 标识发布职位还是下架职位（0代表下架职位，1代表发布新职位）
     */
    public Integer state;

    /**
     * 职位名
     */
    public String positionName;

    /**
     * 观察者列表
     */
    public List<Observer> observers = new ArrayList<>();

    /**
     * 添加观察者（求职者关注企业时，企业需要添加求职者到观察者列表中）
     * @param o
     */
    public void addObserver(Observer o) {
        observers.add(o);
    }

    /**
     * 移除观察者（求职者取消关注企业时，企业需要将该求职者从观察者列表中移除）
     * @param o
     */
    public void removeObservers(Observer o) {
        observers.remove(o);
    }

    /**
     * 通知所有观察者（子类自己实现）
     */
    public abstract void notifyObservers();
}
