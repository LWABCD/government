package com.ybu.admin.service;

import com.ybu.entity.News;
import com.ybu.entity.Result;
import com.ybu.vo.NewsVo;

import java.util.List;

public interface NewsService{

    Result newsList(NewsVo newsVo);

    News newDetail(Integer nid);

    int deleteNews(Integer nid);

    int saveNews(News news);

    void deleteBatchNews(Integer[] ids);
}
