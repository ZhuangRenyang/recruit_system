package com.recruit.common.util;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Eval
 * @create 2022/4/11 2:00
 */
public class ObserverGenerate {

    private static final String TEMPLATE_PATH = System.getProperty("user.dir") + "/src/main/java/com/recruit/common/util/template";
    private static final String CLASS_PATH = System.getProperty("user.dir") + "/src/main/java/com/recruit/common/observer/user";

    public static void generate(String className) {
        // step1 创建freeMarker配置实例
        Configuration configuration = new Configuration();
        Writer out = null;
        try {
            // step2 获取模版路径
            configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH));
            // step3 创建数据模型
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("classPath", "com.recruit.common.observer.user");
            dataMap.put("className", className);
            // step4 加载模版文件
            Template template = configuration.getTemplate("observer.ftl");
            // step5 生成数据
            File docFile = new File(CLASS_PATH + "\\" + className + ".java");
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
            // step6 输出文件
            template.process(dataMap, out);
            System.out.println(className + ".java 文件创建成功！");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != out) {
                    out.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
