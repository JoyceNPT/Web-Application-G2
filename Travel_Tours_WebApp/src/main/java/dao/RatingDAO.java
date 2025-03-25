package dao;

import java.sql.*;
import java.util.*;
import model.Rating;
import util.DBContext;

public class RatingDAO extends DBContext {

    public RatingDAO() {
        super();
    }

    // Lấy danh sách đánh giá theo tour_id
    public List<Rating> getRatingsByTourId(int tourId) {
        List<Rating> ratings = new ArrayList<>();
        String sql = "SELECT * FROM Ratings WHERE tour_id = ? ORDER BY created_at DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, tourId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ratings.add(new Rating(
                        rs.getInt("rating_id"),
                        rs.getInt("tour_id"),
                        rs.getString("user_name"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ratings;
    }

    // Thêm đánh giá vào database và trả về id của bản ghi mới
    public int addRating(int tourId, String userName, int rating, String comment) {
        int newId = 1; // Giá trị mặc định cho id
        String sql = "INSERT INTO Ratings (rating_id, tour_id, user_name, rating, comment, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            // Lấy id lớn nhất hiện tại
            String maxIdQuery = "SELECT MAX(rating_id) FROM Ratings";
            PreparedStatement maxIdStmt = conn.prepareStatement(maxIdQuery);
            ResultSet rs = maxIdStmt.executeQuery();

            if (rs.next()) {
                newId = rs.getInt(1) + 1; // Tăng id lên 1
            }
            rs.close();
            maxIdStmt.close();

            // Chuẩn bị và thực thi câu lệnh insert
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newId); // Gán id mới
            ps.setInt(2, tourId);
            ps.setString(3, userName);
            ps.setInt(4, rating);
            ps.setString(5, comment);
            ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));

            int rowsAffected = ps.executeUpdate();
            ps.close();

            return rowsAffected > 0 ? newId : 0; // Trả về id nếu thành công, 0 nếu thất bại
        } catch (SQLException e) {
            System.err.println("Lỗi addRating: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }
}
