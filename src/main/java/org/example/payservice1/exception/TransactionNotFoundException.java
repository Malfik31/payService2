package org.example.payservice1.exception;

public class TransactionNotFoundException extends RuntimeException {
    public Exception TransactionNotFoundException (String message) {
        System.out.println("Transaction Not Found");
        return this;
    }
}
