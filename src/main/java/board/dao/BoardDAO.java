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
    private String password ;

    public BoardDAO() {
        try {
            Reader reader = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("dev.json"), "UTF-8");
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(reader, JsonObject.class);
            JsonObject database = jsonObject.getAsJsonObject("database");

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
            conn = DriverManager.getConnection(host+port+sid, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean writeContent(BoardDTO boardDTO){
        boolean write = false;
        String sql = "insert into BOARD (SEQ, ID, NAME, EMAIL, SUBJECT, CONTENT, REF) values (SEQ_BOARD.nextval,?,?,?,?,?,1) ";

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

}
