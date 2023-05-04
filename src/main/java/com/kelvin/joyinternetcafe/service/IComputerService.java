package com.kelvin.joyinternetcafe.service;

import com.kelvin.joyinternetcafe.domain.Computer;

import java.util.List;

public interface IComputerService {
    List<Computer> getAllComputer();
    void addComputer(Computer computer,int sectionId);
    void changeComputerStatus(int id,int status);
}
