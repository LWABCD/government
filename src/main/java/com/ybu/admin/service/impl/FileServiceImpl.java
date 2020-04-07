package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.entity.Announcement;
import com.ybu.entity.File;
import com.ybu.entity.Result;
import com.ybu.mapper.FileMapper;
import com.ybu.admin.service.FileService;
import com.ybu.vo.FileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceImpl implements FileService{

    @Autowired
    private FileMapper fileMapper;

    @Override
    public Result files(FileVo fileVo) {
        Page<Object> page= PageHelper.startPage(fileVo.getPage(), fileVo.getLimit());
        List<File> data = fileMapper.queryAllFile(fileVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;
    }

    @Override
    public int saveFile(File file) {
        if(file.getFid()==null){
            return fileMapper.insert(file);
        }
        return fileMapper.updateByPrimaryKey(file);
    }

    @Override
    public void deleteFile(FileVo fileVo) {
        fileMapper.deleteByPrimaryKey(fileVo.getFid());
        //删除磁盘上存放的文件
        String url=fileVo.getUrl();
        String delfilename="G://governmentfile//file/"+url.substring(url.lastIndexOf("/"));
        java.io.File file=new java.io.File(delfilename);
        if(file.exists()){
            file.delete();
        }
    }

    @Override
    public void deleteBatchFile(Integer[] ids) {
        for(Integer fid:ids){
            File file=fileMapper.selectByPrimaryKey(fid);
            fileMapper.deleteByPrimaryKey(fid);
            String url=file.getUrl();
            String delfilename="G://governmentfile//file/"+url.substring(url.lastIndexOf("/"));
            java.io.File file1=new java.io.File(delfilename);
            if(file1.exists()){
                file1.delete();
            }
        }
    }
}
