package si.am.fitnes2.Entitete;

public class Package {

    private int id;
    private String name;
    private int days;

    public Package(int id, String name, int days) {
        this.id = id;
        this.name = name;
        this.days = days;
    }

    public Package() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }
    @Override
    public String toString() {
        return name;
    }
}
