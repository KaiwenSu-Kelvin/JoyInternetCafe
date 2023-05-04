package com.kelvin.joyinternetcafe.domain;


import java.util.Date;

/*
+----------------+------------------+------+-----+---------+-----------------------------+
| Field          | Type             | Null | Key | Default | Extra                       |
+----------------+------------------+------+-----+---------+-----------------------------+
| id             | int(11) unsigned | NO   | PRI | NULL    | auto_increment              |
| uid            | int(11)          | YES  |     | NULL    |                             |
| start_datetime | datetime         | YES  |     | NULL    | on update CURRENT_TIMESTAMP |
| end_datetime   | datetime         | YES  |     | NULL    | on update CURRENT_TIMESTAMP |
| section_id     | int(11)          | YES  |     | NULL    |                             |
| hours          | decimal(11,0)    | YES  |     | NULL    |                             |
+----------------+------------------+------+-----+---------+-----------------------------+
**/
public class UsageRecord {
    private int id;
    private int uid;
    private Date startDatetime;
    private Date endDatetime;
    private Section section;
    private double hours;

    @Override
    public String toString() {
        return "UsageRecord{" +
                "id=" + id +
                ", uid=" + uid +
                ", startDatetime=" + startDatetime +
                ", endDatetime=" + endDatetime +
                ", sectionId=" + section +
                ", hours=" + hours +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Date getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(Date startDatetime) {
        this.startDatetime = startDatetime;
    }

    public Date getEndDatetime() {
        return endDatetime;
    }

    public void setEndDatetime(Date endDatetime) {
        this.endDatetime = endDatetime;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    public double getHours() {
        return hours;
    }

    public void setHours(double hours) {
        this.hours = hours;
    }


}
