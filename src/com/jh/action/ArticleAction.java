package com.jh.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jh.bean.Article;
import com.jh.service.ArticleService;
import com.jh.service.ArticleServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 5805130077080362579L;
	
	private ArticleService articleService;
	
	private Article article;
	private HttpServletRequest req;

	public void setArticle(Article article) {
		this.article = article;
	}

	public Article getArticle() {
		return article;
	}

	public ArticleAction() {
		articleService = new ArticleServiceImpl();
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public String add() {
		articleService.add(article);
		return "add";
	}
	
	public String all() {
		List<Article> articles = articleService.queryAll();
		req.setAttribute("articles", articles);
		return "all";
	}

	
	
	

}
