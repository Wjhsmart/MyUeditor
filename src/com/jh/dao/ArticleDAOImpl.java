package com.jh.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jh.bean.Article;

public class ArticleDAOImpl extends BaseDAO implements ArticleDAO {

	@Override
	public void add(Article article) {
		String sql = "insert into t_article(title, content, release_time) values(?, ?, ?)";
		getConn();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, article.getTitle());
			ps.setString(2, article.getContent());
			ps.setDate(3, new Date(article.getReleaseTime().getTime()));
			ps.execute();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}

	@Override
	public List<Article> queryAll() {
		String sql = "select * from t_article";
		List<Article> articles = new ArrayList<Article>();
		getConn();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setReleaseTime(rs.getDate("release_time"));
				articles.add(article);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return articles;
	}

}
