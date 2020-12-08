package com.example.imageshop.mapper;

import com.example.imageshop.domain.Member;
import com.example.imageshop.domain.MemberAuth;

public interface MemberMapper {

    //권한 생성
    public void createAuth(MemberAuth memberAuth);

    //등록 처리
    public void create(Member member) throws Exception;

    // 해당 사용자 아이디를 가진 회원정보를 조회한다.
    public Member readByUserId(String userId);
}
