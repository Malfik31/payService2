package org.example.payservice1.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "balances")
public class Balance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String currency;
    private Long amount;

    @OneToOne(mappedBy = "balance", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private User user;
}

