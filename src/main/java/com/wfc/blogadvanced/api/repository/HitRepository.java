package com.wfc.blogadvanced.api.repository;

import com.wfc.blogadvanced.api.entity.Hit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HitRepository extends JpaRepository<Hit, Long> {

}
