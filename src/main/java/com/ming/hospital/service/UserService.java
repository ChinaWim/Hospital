package com.ming.hospital.service;

import com.ming.hospital.pojo.User;
import org.springframework.stereotype.Service;

/**
 * Created by Ming on 2017/11/17.
 */
public interface UserService {

    boolean register(User user);
    boolean active(String code);
    User login(User user);
    boolean checkUserName(String user);
}
