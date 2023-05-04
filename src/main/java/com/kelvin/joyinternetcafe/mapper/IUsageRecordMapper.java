package com.kelvin.joyinternetcafe.mapper;

import com.kelvin.joyinternetcafe.domain.UsageRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUsageRecordMapper {
    void updateUsageRecordEndTime(Integer id);

    //近五小时的
    int[] selectUserComeAndLeave(@Param("action") String action);
    List<UsageRecord> selectUsageByDate(String date);
    Integer selectIncomeByDate(String date);

    //整天的
    int[] selectRevenueRecord(@Param("date")String date,@Param("action") String action);
}
