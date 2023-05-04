package com.kelvin.joyinternetcafe.service.impl;


import com.kelvin.joyinternetcafe.domain.UsageRecord;
import com.kelvin.joyinternetcafe.mapper.IUsageRecordMapper;
import com.kelvin.joyinternetcafe.service.IUsageRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;


@Service
public class UsageRecordServiceImpl implements IUsageRecordService {

    @Autowired
    private IUsageRecordMapper usageRecordMapper;

    @Override
    public void updateUsageRecordEndTime(Integer id) {
        usageRecordMapper.updateUsageRecordEndTime(id);
    }

    @Override
    public int[] CountUserAtLatestHour() {
        int[] leaves = usageRecordMapper.selectUserComeAndLeave("leave");
        int[] comes = usageRecordMapper.selectUserComeAndLeave("come");


        int[] countByHour = new int[6];
        int count = 0;
        for (int i = 0; i < countByHour.length; i++) {
            if (i == 0) {
                count = count + comes[i];
                countByHour[i] = count;
            } else {
                count = count + comes[i] - leaves[i-1];
                countByHour[i] = count;
            }
        }
        System.out.println("come:" + Arrays.toString(comes));
        System.out.println("leave:" + Arrays.toString(leaves));
        System.out.println("total" + Arrays.toString(countByHour));


        return countByHour;
    }

    @Override
    public List<UsageRecord> getUsageByDate(String date) {
        List<UsageRecord> usageRecords = usageRecordMapper.selectUsageByDate(date);
        return usageRecords;
    }

    @Override
    public Integer getIncomeByDate(String date) {
        Integer income = usageRecordMapper.selectIncomeByDate(date);
        return income;
    }

    @Override
    public int[] CountRevenueRecord(String date) {
        int[] comes = usageRecordMapper.selectRevenueRecord(date, "come");
        int[] leaves = usageRecordMapper.selectRevenueRecord(date, "leave");

        int[] countByHour = new int[24];
        int count = 0;
        for (int i = 0; i < countByHour.length; i++) {
            if (i == 0) {
                count = count + comes[i];
                countByHour[i] = count;
            } else {
                count = count + comes[i] - leaves[i-1];
                countByHour[i] = count;
            }
        }
        System.out.println("come:" + Arrays.toString(comes));
        System.out.println("leave:" + Arrays.toString(leaves));
        System.out.println("total" + Arrays.toString(countByHour));


        return countByHour;
    }
}
