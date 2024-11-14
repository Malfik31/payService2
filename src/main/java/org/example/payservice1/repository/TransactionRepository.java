package org.example.payservice1.repository;

import org.example.payservice1.entity.Transaction;
import org.example.payservice1.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {
    List<Transaction> findByReceiver(User receiver);
}
