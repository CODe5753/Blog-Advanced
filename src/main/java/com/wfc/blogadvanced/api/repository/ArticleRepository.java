package com.wfc.blogadvanced.api.repository;

import com.wfc.blogadvanced.api.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

}
