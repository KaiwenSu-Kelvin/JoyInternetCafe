package com.kelvin.joyinternetcafe.domain;
/*
+------------+------------------+------+-----+---------+----------------+
| Field      | Type             | Null | Key | Default | Extra          |
+------------+------------------+------+-----+---------+----------------+
| id         | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| cpu        | varchar(255)     | YES  |     | NULL    |                |
| gpu        | varchar(255)     | YES  |     | NULL    |                |
| ram        | varchar(255)     | YES  |     | NULL    |                |
| is_using   | tinyint(1)       | YES  |     | NULL    |                |
| status     | tinyint(1)       | YES  |     | NULL    |                |
| section_id | int(11)          | YES  |     | NULL    |                |
+------------+------------------+------+-----+---------+----------------+
* */
public class Computer {
    private int id;
    private String cpu;
    private String gpu;
    private String ram;
    private boolean Using;
    private byte status;
    private Section section;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public boolean isUsing() {
        return Using;
    }

    public void setUsing(boolean using) {
        Using = using;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    public Computer() {
    }

    @Override
    public String toString() {
        return "Computer{" +
                "id=" + id +
                ", cpu='" + cpu + '\'' +
                ", gpu='" + gpu + '\'' +
                ", ram='" + ram + '\'' +
                ", Using=" + Using +
                ", status=" + status +
                ", section=" + section +
                '}';
    }
}
