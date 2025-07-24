package si.am.fitnes2.Entitete;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class PackageSold {

    private String title;
    private Date start;
    private Date end;
    private final SimpleDateFormat f = new SimpleDateFormat("d. MMMM yyyy");

    public PackageSold(String title, Date start, Date end) {
        this.title = title;
        this.start = start;
        this.end = end;
    }

    public PackageSold() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart() {
        return start;
    }

    public String getStartString() {
        return f.format(this.start);
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public String getKonecString() {
        return f.format(this.end);
    }

    public void setEnd(Date end) {
        this.end = end;
    }

}
