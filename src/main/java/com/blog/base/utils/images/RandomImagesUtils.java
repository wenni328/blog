package com.blog.base.utils.images;

import java.util.Random;

/**
 * @author xieyong
 * 随机存储图片
 */
public class RandomImagesUtils {

    public static String getImage() {
        Random rand = new Random();
        int randNum = rand.nextInt(30) + 1;
        if (randNum < 10) {
            return "static/images/0" + randNum + ".jpg";
        }
        return "static/images/" + randNum + ".jpg";
    }
}
