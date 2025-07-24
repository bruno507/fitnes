package si.am.fitnes2.Entitete;


public class User {

    private String name;
    private String lastN;
    private int id;
    private String email;
    private String password;
    private int role;
    private int visit;

    public User(String name, String lastN, int id, String email, String password, int role, int visit) {
        this.name = name;
        this.lastN = lastN;
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.visit = visit;
    }

    public User(String name, String lastN, String email, String password, int role) {
        this.name = name;
        this.lastN = lastN;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    public User(int id, String name, String lastN, String email) {
        this.id = id;
        this.name = name;
        this.lastN = lastN;
        this.email = email;
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastN() {
        return lastN;
    }

    public void setLastN(String lastN) {
        this.lastN = lastN;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getVisit() {
        return visit;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }


    @Override
    public String toString() {
        return id + ", " + lastN + " " + name;
    }

}