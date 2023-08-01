/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.service.impl;

import com.vtl.pojo.User;
import com.vtl.repository.UserRepository;
import com.vtl.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */

@Service("userDetailService")
@Transactional
public class UserServiceImpl implements UserService 
{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean addUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        userRepository.addUser(user);
        return true;
    }
    
    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUserByUsername(username);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("Username không tồn tại!");
        }

        User u = users.get(0);
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getUserRole()));

        return new org.springframework.security.core.userdetails.User(u.getUsername(),
                u.getPassword(), authorities);
    }

    @Override
    public List<User> getUserByUsername(String username) {
        return userRepository.getUsers(username);
    }

    @Override
    public List<User> getUserByUserID(int i) {
        return userRepository.getUsers(i);
    }

    @Override
    public List<User> getListUserForManage() {
        return this.userRepository.getListUserForManage();
    }

    @Override
    public void deleteUser(String username) {
        this.userRepository.deleteUser(username);
    }
}
