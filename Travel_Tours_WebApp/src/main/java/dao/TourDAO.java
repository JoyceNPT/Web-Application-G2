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
                h.add(new Hours(rs.getInt("dep_id"), formattedHour, rs.getInt("tour_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return h;
    }

    public boolean addTour(Tour tour) {
        String sql = "INSERT INTO Tours (tour_id, tour_name, description, price, destination, introduce, url_video, places, conclusion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tour.getId());
            ps.setString(2, tour.getName());
            ps.setString(3, tour.getDescrip());
            ps.setDouble(4, tour.getPrice());
            ps.setString(5, tour.getDestina());
            ps.setString(6, tour.getIntro());
            ps.setString(7, tour.getUrl_video());
            ps.setString(8, tour.getIntr_place());
            ps.setString(9, tour.getP1() + "#" + tour.getP2());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateTour(Tour tour) {
        String sql = "UPDATE Tours SET tour_name=?, description=?, price=?, destination=?, introduce=?, url_video=?, places=?, conclusion=? WHERE tour_id=?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tour.getName());
            ps.setString(2, tour.getDescrip());
            ps.setDouble(3, tour.getPrice());
            ps.setString(4, tour.getDestina());
            ps.setString(5, tour.getIntro());
            ps.setString(6, tour.getUrl_video());
            ps.setString(7, tour.getIntr_place());
            ps.setString(8, tour.getP1() + "#" + tour.getP2());
            ps.setInt(9, tour.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteTour(int tourId) {
        String sql = "DELETE FROM Tours WHERE tour_id=?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    // Thêm ảnh mới

    public boolean addImage(int tourId, String imageUrl) {
        String sql = "INSERT INTO TourImages (tour_id, image_url) VALUES (?, ?)";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ps.setString(2, imageUrl);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

// Lấy ảnh theo tour
    public List<Image> getTourImages(int tourId) {
        List<Image> images = new ArrayList<>();
        String sql = "SELECT * FROM TourImages WHERE tour_id = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(new Image(
                        rs.getInt("image_id"),
                        rs.getInt("tour_id"),
                        rs.getString("image_url")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }
    // Lấy 5 tour mẫu (Huế, Đà Nẵng, Đà Lạt, Hạ Long, Vũng Tàu)

    public List<Tour> getSampleTours() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT * FROM Tours WHERE tour_id IN (1, 2, 3, 4, 5)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("tour_id");
                String name = rs.getString("tour_name");
                String description = rs.getString("description");
                long price = rs.getLong("price");
                String destination = rs.getString("destination");
                String intro = rs.getString("introduce");
                String url_video = rs.getString("url_video");
                String intr_place = rs.getString("places");
                String conclusion = rs.getString("conclusion");
                String[] str = conclusion.split("#");
                String p1 = str[0];
                String p2 = str[1];
                Tour t = new Tour(id, name, description, price, destination, intro, url_video, intr_place, p1, p2);
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

// Lấy ID của bản ghi vừa insert
    public int getLastInsertId() {
        String sql = "SELECT LAST_INSERT_ID()";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public boolean deleteTourWithRelations(int tourId) {
        try {
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Xóa các bản ghi liên quan trước
            String deleteImagesSQL = "DELETE FROM TourImages WHERE tour_id=?";
            try ( PreparedStatement ps = conn.prepareStatement(deleteImagesSQL)) {
                ps.setInt(1, tourId);
                ps.executeUpdate();
            }

            String deletePlacesSQL = "DELETE FROM place WHERE tour_id=?";
            try ( PreparedStatement ps = conn.prepareStatement(deletePlacesSQL)) {
                ps.setInt(1, tourId);
                ps.executeUpdate();
            }

            String deleteHoursSQL = "DELETE FROM departurehour WHERE tour_id=?";
            try ( PreparedStatement ps = conn.prepareStatement(deleteHoursSQL)) {
                ps.setInt(1, tourId);
                ps.executeUpdate();
            }

            // Cuối cùng xóa tour
            String deleteTourSQL = "DELETE FROM Tours WHERE tour_id=?";
            try ( PreparedStatement ps = conn.prepareStatement(deleteTourSQL)) {
                ps.setInt(1, tourId);
                int result = ps.executeUpdate();

                if (result > 0) {
                    conn.commit(); // Commit transaction nếu thành công
                    return true;
                } else {
                    conn.rollback(); // Rollback nếu không có tour nào bị xóa
                    return false;
                }
            }
        } catch (Exception e) {
            try {
                conn.rollback(); // Rollback nếu có lỗi
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.setAutoCommit(true); // Đặt lại auto commit
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
