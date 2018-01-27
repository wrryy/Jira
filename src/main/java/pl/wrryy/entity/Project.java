package pl.wrryy.entity;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private boolean active;
    private LocalDateTime created;
    @Size(max = 255)
    private String description;
    @URL
    private String url;
    private String identifier;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<User> users;

    public Project() {
        this.created = LocalDateTime.now();
        this.active = true;
        this.url = "https://materialy.coderslab.pl/";
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
        this.setIdentifier(name);
    }
    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public String getCreatedd() {
        return Arrays.toString(created.toString().split("T"));
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        String s = StringUtils.stripAccents(identifier).replaceAll("\\p{javaWhitespace}", "-");
        this.identifier = s;
    }
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return this.name;
    }
}
