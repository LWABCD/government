package com.ybu.admin.service;

import com.ybu.entity.News;

import java.util.List;

public interface NewsService{

    List<News> newsList();

    News newDetail(Integer nid);

    int deleteNews(Integer nid);

    int saveNews(News news);
}
