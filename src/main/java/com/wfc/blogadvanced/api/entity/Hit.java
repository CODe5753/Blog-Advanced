package com.wfc.blogadvanced.api.entity;

import com.wfc.blogadvanced.common.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;

@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Hit extends BaseEntity {

    @Id
    @Column(name = "id", nullable = false)
    Long id;

    Integer count;

    @OneToOne
    @JoinColumn(name = "article_id")
    Article article;
}
