package com.ybu.proscenium.service.impl;

import com.ybu.entity.File;
import com.ybu.mapper.FileMapper;
import com.ybu.proscenium.service.PFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PFileServiceImpl implements PFileService{

    @Autowired
    private FileMapper fileMapper;

    @Override
    public List<File> files() {
        return fileMapper.selectAllFiles();
    }
}
