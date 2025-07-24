package si.am.fitnes2.Entitete;

import java.util.Objects;


public class Exercise {

    private int id;
    private String title;
    private String description;
    private String link1;
    private String link2;
    private int coach;

    public Exercise(int id, String title, String description, String link1, String link2, int coach) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.link1 = link1;
        this.link2 = link2;
        this.coach = coach;
    }

    public Exercise(String title, String description, String link1, String link2, int coach) {
        this.title = title;
        this.description = description;
        this.link1 = link1;
        this.link2 = link2;
        this.coach = coach;
    }

    public Exercise() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink1() {
        return link1;
    }

    public void setLink1(String link1) {
        this.link1 = link1;
    }

    public String getLink2() {
        return link2;
    }

    public void setLink2(String link2) {
        this.link2 = link2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCoach() {
        return coach;
    }

    public void setCoach(int coach) {
        this.coach = coach;
    }

    @Override
    public String toString() {
        return title;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;

        Exercise exercise = (Exercise) obj;
        return this.id == exercise.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
