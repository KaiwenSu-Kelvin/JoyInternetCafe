package com.kelvin.joyinternetcafe.mapper;

import com.kelvin.joyinternetcafe.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserMapper {
    List<User> selectUser(@Param("online") Boolean online);

    User isRegistered(String identityNumber);
    void userRegister(User user);
    int[] countOnlineUser();
    void updateOnline(int id);
    void updateHours(int id);

    void updateUserBalance(@Param("idNumber") String idNumber,@Param("money") Double money);
}
