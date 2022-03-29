package spring.filehandling;

public class UserBean {
    String first_name;
    String last_name;
    public String getFirst_name() {
        return first_name;
    }
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    public String getLast_name() {
        return last_name;
    }
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    @Override
    public String toString() {
        return "UserBean [first_name=" + first_name + ", last_name=" + last_name + "]";
    }
}
