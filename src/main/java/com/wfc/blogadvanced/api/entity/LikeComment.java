package com.wfc.blogadvanced.api.entity;

import com.wfc.blogadvanced.common.entity.BaseEntity;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;

@Entity
@IdClass(LikeCommentId.class)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LikeComment extends BaseEntity {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    User user;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comment_id")
    Comment comment;
}
