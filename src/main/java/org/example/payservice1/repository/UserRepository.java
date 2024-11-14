package org.example.payservice1.repository;

import org.example.payservice1.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Query("from User where username = :username")
    User loadByUsername(String username);
}
