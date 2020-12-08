package com.example.imageshop.service;

import com.example.imageshop.domain.Member;
import com.example.imageshop.domain.MemberAuth;
import com.example.imageshop.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;

    @Transactional
    @Override
    public void register(Member member) throws Exception {

        mapper.create(member);

        MemberAuth memberAuth = new MemberAuth();

        memberAuth.setUser_no(member.getUser_no());
        memberAuth.setAuth("ROLE_MEMBER");  //auth 컬럼에 ROLE_MEMBER

        mapper.createAuth(memberAuth);
    }
}
