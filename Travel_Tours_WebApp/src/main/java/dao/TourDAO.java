/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Hours;
import model.Image;
import model.Place;
import model.Tour;
import util.DBContext;

/**
 *
 * @author PC
 */
public class TourDAO extends DBContext {

    public TourDAO() {
        super();
    }

    public List<Tour> getAll() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT * FROM Tours";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("tour_id");
                String tour_name = rs.getString("tour_name");
                String description = rs.getString("description");
                long price = rs.getLong("price");
                String destination = rs.getString("destination");
                String intro = rs.getString("introduce");
                String url_video = rs.getString("url_video");
                String intr_place = rs.getString("places");
                String conclusion = rs.getString("conclusion");
                String str[] = conclusion.split("#");
                String p1 = str[0];
                String p2 = str[1];
                Tour t = new Tour(id, tour_name, description, price, destination, intro, url_video, intr_place, p1, p2);
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Tour getById(int id) {
        String sql = "SELECT * FROM Tours where tour_id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String tour_name = rs.getString("tour_name");
                String description = rs.getString("description");
                long price = rs.getLong("price");
                String destination = rs.getString("destination");
                String intro = rs.getString("introduce");
                String url_video = rs.getString("url_video");
                String intr_place = rs.getString("places");
                String conclusion = rs.getString("conclusion");
                String str[] = conclusion.split("#");
                String p1 = str[0];
                String p2 = str[1];
                Tour t = new Tour(id, tour_name, description, price, destination, intro, url_video, intr_place, p1, p2);
                return t;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Image> getImagesByTourId(int tourId) {
        List<Image> images = new ArrayList<>();
        String sql = "select * from TourImages where tour_id=?";
        try (
                 PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(new Image(rs.getInt("image_id"), rs.getInt("tour_id"), rs.getString("image_url")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }

    public List<Place> getPlaceByTourId(int tourId) {
        List<Place> place = new ArrayList<>();
        String sql = "select * from place where tour_id=?";
        try (
                 PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                place.add(new Place(rs.getString("place"), rs.getInt("tour_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return place;
    }
    
    public List<Hours> getHoursByTourId(int tourId) {
        List<Hours> h = new ArrayList<>();
        String sql = "SELECT dep_id, CONVERT(VARCHAR(5), hour, 108) AS hour, tour_id FROM departurehour where tour_id=?";
        try (
                 PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String formattedHour = rs.getString("hour");
                h.add(new Hours(rs.getInt("dep_id"), formattedHour ,rs.getInt("tour_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return h;
    }
}
