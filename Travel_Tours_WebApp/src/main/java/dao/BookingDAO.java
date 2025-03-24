/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.Tour;
import util.DBContext;

/**
 *
 * @author ngoth
 */
public class BookingDAO extends DBContext {
    
     public BookingDAO() {
        super();
    }
      public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM Bookings";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Booking(
                        rs.getInt("booking_id"),
                        rs.getDate("booking_date"),
                        rs.getInt("num_people"),
                        rs.getDouble("total_price"),
                        rs.getInt("status"),
                        rs.getInt("user_id"),
                        rs.getInt("tour_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
       public boolean addBooking(Booking booking) {
    String sql = "INSERT INTO Bookings (booking_date, num_people, total_price, status, user_id, tour_id) VALUES (GETDATE(), ?, ?, ?, ?, ?)";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, booking.getNumPeople());
        ps.setDouble(2, booking.getTotal());
        ps.setInt(3, (booking.getStatus() >= 1 && booking.getStatus() <= 3) ? booking.getStatus() : 1); // Chỉ cho phép 1,2,3
        ps.setInt(4, booking.getUserId());
        ps.setInt(5, booking.getTourId());
        
        // Kiểm tra user_id và tour_id tồn tại hay không
        if (!isUserExists(booking.getUserId()) || !isTourExists(booking.getTourId())) {
            System.out.println("User ID hoặc Tour ID không tồn tại!");
            return false;
        }

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

// Hàm kiểm tra user có tồn tại không
private boolean isUserExists(int userId) {
    String sql = "SELECT user_id FROM Users WHERE user_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

// Hàm kiểm tra tour có tồn tại không
private boolean isTourExists(int tourId) {
    String sql = "SELECT tour_id FROM Tours WHERE tour_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, tourId);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

        
          public boolean updateBookingStatus(int bookingId, int status) {
        String sql = "UPDATE Bookings SET status = ? WHERE booking_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
           public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM Bookings WHERE booking_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
