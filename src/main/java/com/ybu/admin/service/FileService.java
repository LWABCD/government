package com.ybu.admin.service;

import com.ybu.entity.File;
import com.ybu.entity.Result;
import com.ybu.vo.FileVo;

import java.util.List;

public interface FileService{

    Result files(FileVo fileVo);

    int saveFile(File file);

    void deleteFile(FileVo fileVo);

    void deleteBatchFile(Integer[] ids);
}
