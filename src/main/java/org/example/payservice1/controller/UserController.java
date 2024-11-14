package org.example.payservice1.controller;

import lombok.AllArgsConstructor;
import org.example.payservice1.entity.User;
import org.example.payservice1.service.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @PostMapping(value = "/save", consumes = "application/json")
    public User createUser(@RequestBody User user) {
        userService.createUser(user);
        return user;
    }
}
