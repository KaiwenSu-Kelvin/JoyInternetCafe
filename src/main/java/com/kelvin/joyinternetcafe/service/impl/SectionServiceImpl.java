package com.kelvin.joyinternetcafe.service.impl;

import com.kelvin.joyinternetcafe.domain.Section;
import com.kelvin.joyinternetcafe.mapper.ISectionMapper;
import com.kelvin.joyinternetcafe.service.ISectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SectionServiceImpl implements ISectionService {
    @Autowired
    private ISectionMapper sectionMapper;

    @Override
    public List<Section> getAllSection() {
        List<Section> sections = sectionMapper.selectAllSection();
        return sections;
    }
}
