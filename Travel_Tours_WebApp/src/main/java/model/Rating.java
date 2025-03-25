/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khoa
 */
import java.sql.Timestamp;

public class Rating {

    private int ratingId;
    private int tourId;
    private String userName;
    private int rating;
    private String comment;
    private Timestamp createdAt;

    public Rating(int ratingId, int tourId, String userName, int rating, String comment, Timestamp createdAt) {
        this.ratingId = ratingId;
        this.tourId = tourId;
        this.userName = userName;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    

    // ✅ Constructor không có id (dành cho thêm mới)
    public Rating(int tourId, String userName, int rating, String comment) {
        this.tourId = tourId;
        this.userName = userName;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = new Timestamp(System.currentTimeMillis()); // ⚠️ Nếu không truyền createdAt từ DB
    }

    public int getRatingId() {
        return ratingId;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Rating{" + "ratingId=" + ratingId + ", tourId=" + tourId + ", userName=" + userName + ", rating=" + rating + ", comment=" + comment + ", createdAt=" + createdAt + '}';
    }

    
}
