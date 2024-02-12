package guestbook.dao;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import guestbook.bean.GuestbookDTO;

import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestbookDAO {
    private static GuestbookDAO guestbookDAO = new GuestbookDAO();
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String driver;
    private String host;
    private String port;
    private String sid;
    private String username;
    private String password;

    public GuestbookDAO() {
        try {
            Reader reader = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("dev.json"), "UTF-8");
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(reader, JsonObject.class);
            JsonObject database = jsonObject.getAsJsonObject("mysql");

            driver = database.get("driver").getAsString();
            host = database.get("host").getAsString();
            port = database.get("port").getAsString();
            sid = database.get("sid").getAsString();
            username = database.get("username").getAsString();
            password = database.get("password").getAsString();

            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static GuestbookDAO getInstance() {
        return guestbookDAO;
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(host + port + sid, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void close(PreparedStatement pstmt) {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void close(ResultSet rs, PreparedStatement pstmt) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insert(String name, String email, String homepage, String title, String content) {
        // language=MySQL
        String sql = "insert into guestbook (name, email, homepage, subject, content, logtime) values (?, ?, ?, ?, ?, now())";
        boolean success = false;

        try {
            getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, homepage);
            pstmt.setString(4, title);
            pstmt.setString(5, content);
            pstmt.executeUpdate();

            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return success;
    }

    public ArrayList<GuestbookDTO> guestbookList(int startNum) {
        // language=MySQL
        String sql = "select * from guestbook order by seq desc limit ?, 3";
        ArrayList<GuestbookDTO> list = new ArrayList<>();

        try {
            getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                GuestbookDTO guestbookDTO = new GuestbookDTO();
                guestbookDTO.setSeq(rs.getInt("seq"));
                guestbookDTO.setName(rs.getString("name"));
                guestbookDTO.setEmail(rs.getString("email"));
                guestbookDTO.setHomepage(rs.getString("homepage"));
                guestbookDTO.setSubject(rs.getString("subject"));
                guestbookDTO.setContent(rs.getString("content"));
                guestbookDTO.setLogtime(rs.getDate("logtime"));

                list.add(guestbookDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt);
        }
        return list;
    }

    public int getTotal() {
        // language=MySQL
        String sql = "select count(*) as total from guestbook";
        int total = 0;

        try {
            getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return total;
    }
}
