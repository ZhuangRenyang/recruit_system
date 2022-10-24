package com.recruit.common.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * @author Eval
 * @create 2021/4/11 2:00
 */
public class SubjectGenerate {

    private static final String TEMPLATE_PATH = System.getProperty("user.dir") + "/src/main/java/io/github/talelin/latticy/common/util/template";
    private static final String CLASS_PATH = System.getProperty("user.dir") + "/src/main/java/io/github/talelin/latticy/common/observer/company";

    public static void generate(String className, String name) {
        // step1 创建freeMarker配置实例
        Configuration configuration = new Configuration();
        Writer out = null;
        try {
            // step2 获取模版路径
            configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH));
            // step3 创建数据模型
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("classPath", "com.recruit.common.observer.company");
            dataMap.put("className", className);
            dataMap.put("name", name);
            // step4 加载模版文件
            Template template = configuration.getTemplate("subject.ftl");
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
