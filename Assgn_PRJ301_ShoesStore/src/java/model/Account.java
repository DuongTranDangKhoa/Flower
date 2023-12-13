package model;

public class Account {
    private String Username;
    private String Password;
    private String Fullname;
    private Boolean IsAdmin;
    private Boolean Active;

    public Account(String Username, String Password, String Fullname, Boolean IsAdmin, Boolean Active) {
        this.Username = Username;
        this.Password = Password;
        this.Fullname = Fullname;
        this.IsAdmin = IsAdmin;
        this.Active = Active;
    }

    public Account() {
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public Boolean getIsAdmin() {
        return IsAdmin;
    }

    public void setIsAdmin(Boolean IsAdmin) {
        this.IsAdmin = IsAdmin;
    }

    public Boolean getActive() {
        return Active;
    }

    public void setActive(Boolean Active) {
        this.Active = Active;
    }
}
