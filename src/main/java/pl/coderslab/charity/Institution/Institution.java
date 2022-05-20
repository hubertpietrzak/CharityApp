package pl.coderslab.charity.Institution;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "institutions")
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
}
