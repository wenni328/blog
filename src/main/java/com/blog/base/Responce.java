package com.blog.base;

import java.util.HashMap;
import java.util.Map;

public class Responce extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    public Responce() {
        put("code", 200);
    }

    public static Responce error() {
        return error(500, "未知异常，请联系管理员");
    }

    public static Responce error(String msg) {
        return error(500, msg);
    }

    public static Responce error(int code, String msg) {
        Responce r = new Responce();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    public static Responce ok(String msg) {
        Responce r = new Responce();
        r.put("msg", msg);
        return r;
    }

    public static Responce ok(Map<String, Object> map) {
        Responce r = new Responce();
        r.putAll(map);
        return r;
    }

    public static Responce ok() {
        return new Responce();
    }

    public Responce put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
