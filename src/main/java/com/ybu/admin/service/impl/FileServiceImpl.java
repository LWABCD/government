package com.ybu.admin.service.impl;

import com.ybu.entity.File;
import com.ybu.mapper.FileMapper;
import com.ybu.admin.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    private FileMapper fileMapper;

    @Override
    public List<File> files() {
        return fileMapper.selectAllFiles();
    }

    @Override
    public int saveFile(File file) {
        if(file.getFid()==null){
            return fileMapper.insert(file);
        }
        return fileMapper.updateByPrimaryKey(file);
    }

    @Override
    public int deleteFile(Integer fid) {
        return fileMapper.deleteByPrimaryKey(fid);
    }
}
