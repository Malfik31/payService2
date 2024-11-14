package org.example.payservice1.exception;
public class InsufficientBalanceException extends RuntimeException{
    public Exception InsufficientBalanceException (String message) {
        System.out.println("Insufficient Balance");
    return this;
    }
}
