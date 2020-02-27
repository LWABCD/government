package com.ybu.admin.service;

import com.ybu.entity.File;

import java.util.List;

public interface FileService{

    List<File> files();

    int saveFile(File file);

    int deleteFile(Integer fid);
}
