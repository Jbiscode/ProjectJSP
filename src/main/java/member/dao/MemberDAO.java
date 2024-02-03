package member.dao;

import member.bean.MemberDTO;

import java.io.InputStreamReader;
import java.io.Reader;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    // 싱글톤
    private static MemberDAO memberDAO = new MemberDAO();
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String driver;
    private String host;
    private String port;
    private String sid;
    private String username;
    private String password ;

    public MemberDAO() {
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

    public static MemberDAO getInstance() {
        return memberDAO;
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(host+port+sid, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isExistId(String id) {
        boolean exist = false;
        String sql = "select * from member where id=?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);//생성
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();//실행 - ResultSet 리턴

            if (rs.next()) exist = true; //레코드가 존재 - 사용 불가능

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return exist;

    }

    public boolean insertMember(MemberDTO memberDTO) {
        conn = null;
        pstmt = null;

        String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getId());
            pstmt.setString(3, memberDTO.getPwd());
            pstmt.setString(4, memberDTO.getGender());
            pstmt.setString(5, memberDTO.getEmail1());
            pstmt.setString(6, memberDTO.getEmail2());
            pstmt.setString(7, memberDTO.getTel1());
            pstmt.setString(8, memberDTO.getTel2());
            pstmt.setString(9, memberDTO.getTel3());
            pstmt.setString(10, memberDTO.getZipcode());
            pstmt.setString(11, memberDTO.getAddr1());
            pstmt.setString(12, memberDTO.getAddr2());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public MemberDTO login(String id, String pwd) {
        MemberDTO memberDTO = null;
        String sql = "select * from member where id=? and pwd=?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, pwd);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberDTO = new MemberDTO();
                memberDTO.setName(rs.getString("name"));
                memberDTO.setId(rs.getString("id"));
                memberDTO.setGender(rs.getString("gender"));
                memberDTO.setEmail1(rs.getString("email1"));
                memberDTO.setEmail2(rs.getString("email2"));
                memberDTO.setTel1(rs.getString("tel1"));
                memberDTO.setTel2(rs.getString("tel2"));
                memberDTO.setTel3(rs.getString("tel3"));
                memberDTO.setZipcode(rs.getString("zipcode"));
                memberDTO.setAddr1(rs.getString("addr1"));
                memberDTO.setAddr2(rs.getString("addr2"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return memberDTO;
    }

    public boolean updateMember(MemberDTO memberDTO) {
        boolean isUpdated = false;
        String sql = "update member set name=?, pwd=?, gender=?, email1=?, email2=?, tel1=?, tel2=?, tel3=?, zipcode=?, addr1=?, addr2=? where id=?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getPwd());
            pstmt.setString(3, memberDTO.getGender());
            pstmt.setString(4, memberDTO.getEmail1());
            pstmt.setString(5, memberDTO.getEmail2());
            pstmt.setString(6, memberDTO.getTel1());
            pstmt.setString(7, memberDTO.getTel2());
            pstmt.setString(8, memberDTO.getTel3());
            pstmt.setString(9, memberDTO.getZipcode());
            pstmt.setString(10, memberDTO.getAddr1());
            pstmt.setString(11, memberDTO.getAddr2());
            pstmt.setString(12, memberDTO.getId());


            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                isUpdated = true;
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

        return isUpdated;
    }

}