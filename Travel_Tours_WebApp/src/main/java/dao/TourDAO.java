/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Tour;
import util.DBContext;

/**
 *
 * @author ngoth
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
            
            while(rs.next()) {
                int id = rs.getInt("tour_id");
                String tour_name = rs.getString("tour_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String destination = rs.getString("destination");
                int seats = rs.getInt("available_seats");
                
                 Tour t = new Tour(id, tour_name, description, price, destination, seats);
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public Tour getById(int id) {
        String sql = "select * from Tours where tour_id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String tour_name = rs.getString("tour_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String destination = rs.getString("destination");
                int seats = rs.getInt("available_seats");
                Tour t = new Tour(id, tour_name, description, price, destination, seats);
                return t;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
