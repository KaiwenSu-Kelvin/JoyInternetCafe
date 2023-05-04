package com.kelvin.joyinternetcafe.domain;


/*
+-----------------+------------------+------+-----+---------+----------------+
| Field           | Type             | Null | Key | Default | Extra          |
+-----------------+------------------+------+-----+---------+----------------+
| id              | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| identity_number | char(18)         | YES  |     | NULL    |                |
| name            | char(10)         | YES  |     | NULL    |                |
| password        | varchar(255)     | YES  |     | NULL    |                |
| register_date   | date             | YES  |     | NULL    |                |
| balance         | decimal(11,2)    | YES  |     | NULL    |                |
| is_member       | tinyint(1)       | YES  |     | NULL    |                |
| is_online       | tinyint(1)       | YES  |     | NULL    |                |
+-----------------+------------------+------+-----+---------+----------------+
*/

import java.util.Date;

public class User {
    private int id;
    private String identityNumber;
    private String name;
    private String password;
    private Date registerDate;
    private Double balance;
    private boolean member;
    private boolean online;
    private UsageRecord latestUserRecord;


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", identityNumber='" + identityNumber + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", registerDate=" + registerDate +
                ", balance=" + balance +
                ", member=" + member +
                ", online=" + online +
                ", latestUserRecord=" + latestUserRecord +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public boolean isMember() {
        return member;
    }

    public void setMember(boolean member) {
        this.member = member;
    }

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }

    public UsageRecord getLatestUserRecord() {
        return latestUserRecord;
    }

    public void setLatestUserRecord(UsageRecord latestUserRecord) {
        this.latestUserRecord = latestUserRecord;
    }
}
