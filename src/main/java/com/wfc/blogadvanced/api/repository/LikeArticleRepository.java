package com.wfc.blogadvanced.api.repository;

import com.wfc.blogadvanced.api.entity.LikeArticle;
import com.wfc.blogadvanced.api.entity.LikeArticleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeArticleRepository extends JpaRepository<LikeArticle, LikeArticleId> {

}
