package board.dao;

import board.bean.BoardDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO boardDAO = new BoardDAO();
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String driver;
    private String host;
    private String port;
    private String sid;
    private String username;
    private String password;

    public BoardDAO() {
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

    public static BoardDAO getInstance() {
        return boardDAO;
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(host + port + sid, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean writeContent(BoardDTO boardDTO) {
        boolean write = false;
        //language=MySQL
        String sql = "insert into BOARD (   ID, NAME, EMAIL, SUBJECT, CONTENT, REF) values (?,?,?,?,?,1)";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);//생성
            pstmt.setString(1, boardDTO.getId());
            pstmt.setString(2, boardDTO.getName());
            pstmt.setString(3, boardDTO.getEmail());
            pstmt.setString(4, boardDTO.getSubject());
            pstmt.setString(5, boardDTO.getContent());
            pstmt.executeUpdate();
            write = true;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return write;
    }

    public ArrayList<BoardDTO> loadContents(String scope, String key, int startPage) {
        ArrayList<BoardDTO> boardDTOs = new ArrayList<>();
        //language=MySQL
        StringBuilder sql = new StringBuilder("SELECT * FROM board where");
        if (scope.equals("all")) {
            sql.append(" subject LIKE ? OR name LIKE ? OR content LIKE ?");
        }
        if (scope.equals("title")) {
            sql.append(" subject LIKE ?");
        }
        if (scope.equals("writer_name")) {
            sql.append(" name LIKE ?");
        }
        if (scope.equals("content")) {
            sql.append(" content LIKE ?");
        }
        sql.append(" ORDER BY seq DESC LIMIT ?, ?");


        getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());//생성
            if (scope.equals("all")) {
                pstmt.setString(1, "%" + key + "%");
                pstmt.setString(2, "%" + key + "%");
                pstmt.setString(3, "%" + key + "%");
                pstmt.setInt(4, (startPage - 1) * 10);
                pstmt.setInt(5, 10);
            } else {
                pstmt.setString(1, "%" + key + "%");
                pstmt.setInt(2, (startPage - 1) * 10);
                pstmt.setInt(3, 10);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setSeq(rs.getInt("seq"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setSubject(rs.getString("subject"));
                boardDTO.setContent(rs.getString("content"));

                boardDTOs.add(boardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return boardDTOs;
    }

    public int dataCnt(String scope, String key) {
        int Cnt = 0;
        StringBuilder sql = new StringBuilder("SELECT * FROM board where");
        if (scope.equals("all")) {
            sql.append(" subject LIKE ? OR name LIKE ? OR content LIKE ?");
        }
        if (scope.equals("title")) {
            sql.append(" subject LIKE ?");
        }
        if (scope.equals("writer_name")) {
            sql.append(" name LIKE ?");
        }
        if (scope.equals("content")) {
            sql.append(" content LIKE ?");
        }

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql.toString());//생성
            if (scope.equals("all")) {
                pstmt.setString(1, "%" + key + "%");
                pstmt.setString(2, "%" + key + "%");
                pstmt.setString(3, "%" + key + "%");
            } else {
                pstmt.setString(1, "%" + key + "%");
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Cnt++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return Cnt;
    }
}
