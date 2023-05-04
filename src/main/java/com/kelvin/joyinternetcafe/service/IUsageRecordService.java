package com.kelvin.joyinternetcafe.service;

import com.kelvin.joyinternetcafe.domain.UsageRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IUsageRecordService {
    void updateUsageRecordEndTime(Integer id);
    int[] CountUserAtLatestHour();
    List<UsageRecord> getUsageByDate(String date);
    Integer getIncomeByDate(String date);
    int[] CountRevenueRecord(@Param("date")String date);
}
