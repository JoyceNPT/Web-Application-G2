/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Image {
    private int img_id;
    private int tour_id;
    private String url_img;

    public Image(int img_id, int tour_id, String url_img) {
        this.img_id = img_id;
        this.tour_id = tour_id;
        this.url_img = url_img;
    }

    public int getImg_id() {
        return img_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public String getUrl_img() {
        return url_img;
    }
    
}