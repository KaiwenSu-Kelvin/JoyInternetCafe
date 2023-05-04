package com.kelvin.joyinternetcafe.mapper;

import com.kelvin.joyinternetcafe.domain.Computer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IComputerMapper {
    List<Computer> selectAllComputer();
    void insertComputer(@Param("computer") Computer computer,@Param("sectionId") int sectionId);
    void updateComputerStatus(@Param("id") int id,@Param("status") int status);
}
