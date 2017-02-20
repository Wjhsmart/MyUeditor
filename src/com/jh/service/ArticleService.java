package com.jh.service;

import java.util.List;

import com.jh.bean.Article;

public interface ArticleService {

	/**
	 * 添加一篇文章
	 * @param article
	 */
	public void add(Article article);

	/**
	 * 查询所有的文章
	 * @return
	 */
	public List<Article> queryAll();
}
