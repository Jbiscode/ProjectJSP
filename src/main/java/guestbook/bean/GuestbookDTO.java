package guestbook.bean;

import lombok.Data;
import java.sql.Date;

@Data
public class GuestbookDTO {
    private int seq;
    private String name;
    private String email;
    private String homepage;
    private String subject;
    private String content;
    private Date logtime;
}
