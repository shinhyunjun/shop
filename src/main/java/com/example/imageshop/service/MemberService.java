package com.example.imageshop.service;

import com.example.imageshop.domain.Member;

public interface MemberService {

    // 등록 처리
    public void register(Member member) throws Exception;
}
