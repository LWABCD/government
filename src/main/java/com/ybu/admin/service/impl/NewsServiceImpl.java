package com.ybu.admin.service.impl;

import com.ybu.admin.service.NewsService;
import com.ybu.entity.News;
import com.ybu.entity.NewsExample;
import com.ybu.mapper.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<News> newsList() {
        return newsMapper.selectAllNews();
    }

    @Override
    public News newDetail(Integer nid) {
        return newsMapper.selectByPrimaryKey(nid);
    }

    @Override
    public int deleteNews(Integer nid) {
        return newsMapper.deleteByPrimaryKey(nid);
    }

    @Override
    public int saveNews(News news) {
        if(news.getNid()==null){
            news.setCreatetime(new Date());
            news.setUpdatetime(new Date());
            news.setReadnumber(0);
            return newsMapper.insert(news);
        }else{
            news.setUpdatetime(new Date());
            return newsMapper.updateByPrimaryKeyWithBLOBs(news);
        }
    }
}
