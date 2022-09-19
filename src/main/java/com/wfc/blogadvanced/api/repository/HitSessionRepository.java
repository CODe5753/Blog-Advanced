package com.wfc.blogadvanced.api.repository;

import com.wfc.blogadvanced.api.entity.HitSession;
import com.wfc.blogadvanced.api.entity.HitSessionId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HitSessionRepository extends JpaRepository<HitSession, HitSessionId> {

}
