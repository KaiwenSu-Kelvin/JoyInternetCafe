package com.kelvin.joyinternetcafe.service.impl;

import com.kelvin.joyinternetcafe.domain.Computer;
import com.kelvin.joyinternetcafe.mapper.IComputerMapper;
import com.kelvin.joyinternetcafe.service.IComputerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComputerServiceImpl implements IComputerService {
    @Autowired
    private IComputerMapper computerMapper;

    @Override
    public List<Computer> getAllComputer() {
        List<Computer> computers = computerMapper.selectAllComputer();
        return computers;
    }

    @Override
    public void addComputer(Computer computer,int sectionId) {
        computerMapper.insertComputer(computer,sectionId);
    }

    @Override
    public void changeComputerStatus(int id, int status) {
        computerMapper.updateComputerStatus(id, status);
    }
}
