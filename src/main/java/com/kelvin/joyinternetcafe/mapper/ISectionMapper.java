package com.kelvin.joyinternetcafe.mapper;

import com.kelvin.joyinternetcafe.domain.Section;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISectionMapper {
    List<Section> selectAllSection();
}
