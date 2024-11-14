package org.example.payservice1.service;

import jakarta.persistence.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.example.payservice1.entity.Balance;
import org.example.payservice1.entity.Transaction;
import org.example.payservice1.entity.User;
import org.example.payservice1.enums.TransactionStatus;
import org.example.payservice1.exception.InsufficientBalanceException;
import org.example.payservice1.exception.TransactionNotFoundException;
import org.example.payservice1.repository.TransactionRepository;
import org.example.payservice1.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@AllArgsConstructor
public class TransactionService {
    private final UserRepository userRepository;
    private final TransactionRepository transactionRepository;

    @Transactional
    public List<Transaction> getUserAsReceiverTransactions(User user) {
        return transactionRepository.findByReceiver(user);
    }

    @Transactional
    public Transaction getTransactionById(long id) {
        Optional<Transaction> transaction = transactionRepository.findById(id);
        if (transaction.isPresent()) {
            return transaction.get();
        } else {
            throw new EntityNotFoundException("Transaction with id " + id + " not found");
        }
    }

    @Transactional
    public void createTransaction(Transaction transaction) {
        if (transaction.getSender() == null || transaction.getReceiver() == null) {
            throw new NullPointerException("Sender or Receiver cannot be null");
        }
        transaction.setStatus(TransactionStatus.NULL);
        transaction.setTimestamp(LocalDateTime.now());
        User sender = userRepository.loadByUsername(transaction.getSender().getUsername());
        User receiver = userRepository.loadByUsername(transaction.getReceiver().getUsername());
        transaction.setSender(sender);
        transaction.setReceiver(receiver);
        transactionRepository.save(transaction);
    }

    @Transactional
    public void commitTransaction(Transaction transaction, Long transactionId) {
        Transaction transaction1 = getTransactionById(transactionId);

        if ("PENDING".equals(transaction1.getStatus())) {
            throw new TransactionNotFoundException();
        }

        User sender = transaction1.getSender();
        User receiver = transaction1.getReceiver();

        Balance senderBalance = sender.getBalances();
        Balance receiverBalance = receiver.getBalances();

        if(senderBalance.getAmount()<transaction1.getAmount()){
            throw new InsufficientBalanceException();
        }

        String confirmationCode = transactionRepository.findById(transactionId)
                .orElseThrow(() ->
                        new EntityNotFoundException("Transaction with id: " + transactionId + " not found"))
                .getConfirmationCode();

        if (confirmationCode.equals(transaction.getConfirmationCode())) {
            senderBalance.setAmount(senderBalance.getAmount() - transaction.getAmount());
            receiverBalance.setAmount(receiverBalance.getAmount() + transaction.getAmount());

        } else {
            throw new EntityNotFoundException("Confirmation code mismatch");
        }

        transaction1.setStatus(TransactionStatus.COMPLETED);
        transaction1.setTimestamp(LocalDateTime.now());
        transactionRepository.save(transaction1);
    }
}

