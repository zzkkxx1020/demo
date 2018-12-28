package com.imooc.demo.service.impl;

import com.imooc.demo.dao.AdminDao;
import com.imooc.demo.entity.Admin;
import com.imooc.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public Admin adminLogin(String adminName) {
        return adminDao.adminLogin(adminName);
    }
}
