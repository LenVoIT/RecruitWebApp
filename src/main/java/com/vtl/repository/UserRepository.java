/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.repository;

import com.vtl.pojo.User;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface UserRepository {
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getUsers(int userID);
    //admin manage user
    List<User> getListUserForManage();
    void deleteUser(String username);
}
