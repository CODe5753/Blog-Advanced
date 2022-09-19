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
@IdClass(HitSessionId.class)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HitSession extends BaseEntity {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    User user;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "article_id")
    Article article;
}
