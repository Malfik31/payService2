package org.example.payservice1.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.example.payservice1.enums.TransactionStatus;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Currency;


@Entity
@Getter
@Setter
@Table(name = " transactions")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int amount;
    private Currency currency;
    private TransactionStatus status;
    private String confirmationCode;
    private String comment;
    private LocalDateTime timestamp;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User sender;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User receiver;

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int CODE_LENGTH = 6;
    private static final SecureRandom random = new SecureRandom();

    public Transaction() {
        this.confirmationCode = generateRandomCode();
    }

    private String generateRandomCode() {
        StringBuilder code = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            code.append(CHARACTERS.charAt(index));
        }
        return code.toString();
    }
    }

