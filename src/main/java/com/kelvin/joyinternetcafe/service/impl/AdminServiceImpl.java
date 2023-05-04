package com.kelvin.joyinternetcafe.service.impl;

import com.kelvin.joyinternetcafe.mapper.IAdminMapper;
import com.kelvin.joyinternetcafe.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private IAdminMapper adminMapper;

    @Override
    public String getAdminPwd(String name) {
        String pwd = adminMapper.selectAdminPwd(name);
        return pwd;
    }
}
