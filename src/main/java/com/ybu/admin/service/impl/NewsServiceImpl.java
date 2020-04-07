package com.ybu.admin.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ybu.admin.service.NewsService;
import com.ybu.entity.News;
import com.ybu.entity.NewsExample;
import com.ybu.entity.Opengovernment;
import com.ybu.entity.Result;
import com.ybu.mapper.NewsMapper;
import com.ybu.vo.NewsVo;
import com.ybu.vo.OpenGovernmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public Result newsList(NewsVo newsVo) {
        Page<Object> page= PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
        List<News> data =newsMapper.queryAllNews(newsVo);
        Result result=new Result();
        result.setCount(page.getTotal());
        result.setData(data);
        return result;
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

    @Override
    public void deleteBatchNews(Integer[] ids) {
        for(Integer nid:ids){
            newsMapper.deleteByPrimaryKey(nid);
        }
    }
}
