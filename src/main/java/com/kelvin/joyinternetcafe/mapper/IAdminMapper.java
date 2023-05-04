package com.kelvin.joyinternetcafe.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface IAdminMapper {
    String selectAdminPwd(String name);
}
