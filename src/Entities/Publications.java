package Entities;

public class Publications {
    private Long id;
    private String name;
    private String description;
    private double ration;

    public Publications() {
    }

    public Publications(Long id, String name, String description, double ration) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.ration = ration;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRation() {
        return ration;
    }

    public void setRation(double ration) {
        this.ration = ration;
    }
}
