/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import util.DBContext;

/**
 *
 * @author ngoth
 */
public class UserDAO extends DBContext {

    public UserDAO() {
        super();
    }

    public int insertUser(String fullname, String email, String phone, String user, String pass) {
        String maxId = "SELECT MAX([user_id]) AS maxId FROM Users";
        try {
            PreparedStatement psMaxId = conn.prepareStatement(maxId);
            ResultSet rsMaxId = psMaxId.executeQuery();

            if (rsMaxId.next()) {
                int id = rsMaxId.getInt("maxId") + 1;

                String sql = "INSERT INTO Users ([user_id], full_name, email, phone, username, [password], role_id) VALUES (?, ?, ?, ?, ?, ?, 2)";
                try {
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, id);
                    ps.setString(2, fullname);
                    ps.setString(3, email);
                    ps.setString(4, phone);
                    ps.setString(5, user);
                    ps.setString(6, hashMD5(pass));

                    int create = ps.executeUpdate();

                    if (create > 0) {
                        return 1;
                    } else {
                        return 0;
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public String hashMD5(String pass) {
        try {
            MessageDigest mes = MessageDigest.getInstance("MD5");
            byte[] mesMD5 = mes.digest(pass.getBytes());

            StringBuilder str = new StringBuilder();
            for (byte b : mesMD5) {

                String ch = String.format("%02x", b);

                str.append(ch);
            }

            return str.toString();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

    public User verify(String user, String pass) {
        User acc = new User();
        //acc.getId() = -1;
        String sql = "SELECT * FROM Users WHERE username = ? AND [password] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, hashMD5(pass));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acc.setId(rs.getInt("user_id"));
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setFullname(rs.getString("full_name"));
                acc.setEmail(rs.getString("email"));
                acc.setPhone(rs.getString("phone"));
                acc.setRole(rs.getInt("role_id"));
                acc.setCreated(rs.getDate("created_at"));
                return acc;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return acc;
    }

    // public static void main(String[] args) {
    //     UserDAO dao = new UserDAO();
    //     User account = new User();
    //     account = dao.verify("admin", "admin");

    //     System.out.println(account);

    //     String result = dao.hashMD5("admin");
    //     System.out.println(result);
    // }
}
