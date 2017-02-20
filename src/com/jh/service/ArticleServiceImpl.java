package com.jh.service;

import java.util.List;

import com.jh.bean.Article;
import com.jh.dao.ArticleDAO;
import com.jh.dao.ArticleDAOImpl;

public class ArticleServiceImpl implements ArticleService {

	private ArticleDAO articleDAO;
	
	public ArticleServiceImpl() {
		articleDAO = new ArticleDAOImpl();
	}
	
	@Override
	public void add(Article article) {
		articleDAO.add(article);
	}

	@Override
	public List<Article> queryAll() {
		return articleDAO.queryAll();
	}

}
