/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
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
        try ( PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Booking(
                        rs.getInt("booking_id"),
                        rs.getTimestamp("booking_date"),
                        rs.getInt("num_people"),
                        rs.getDouble("total_price"),
                      
                        rs.getInt("user_id"),
                        rs.getInt("tour_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
public Booking getById(int id) {
        String sql = "SELECT * FROM Bookings where booking_id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Booking b = new Booking(id, rs.getTimestamp("booking_date"), rs.getInt("num_people"), rs.getDouble("total_price"),rs.getInt("user_id"), rs.getInt("tour_id"));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    
    public int insertBookings(Timestamp date, int num_people, double price, int user_id, int tour_id) {
        try {
            String sqlMaxId = "select max(booking_id) as maxid from Bookings";
            PreparedStatement psGetMaxId = conn.prepareStatement(sqlMaxId);
            ResultSet rsMaxId = psGetMaxId.executeQuery();
            if (rsMaxId.next()) {
                int nextId = rsMaxId.getInt("maxid") + 1;
                String sql = "insert into Bookings(booking_id,booking_date, num_people, total_price, user_id, tour_id) values( ?, ?, ?, ?, ?, ?)";
                try {
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, nextId);
                    ps.setTimestamp(2, date);
                    ps.setInt(3, num_people);
                    ps.setDouble(4, price);
                    ps.setInt(5, user_id);
                    ps.setInt(6, tour_id);
                    int num = ps.executeUpdate();
                    if (num > 0) {
                        return 1;
                    } else {
                        return 0;
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                return 0;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        BookingDAO dao = new BookingDAO();
    }
       }
