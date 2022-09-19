package com.wfc.blogadvanced.api.repository;

import com.wfc.blogadvanced.api.entity.LikeComment;
import com.wfc.blogadvanced.api.entity.LikeCommentId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeCommentRepository extends JpaRepository<LikeComment, LikeCommentId> {

}
