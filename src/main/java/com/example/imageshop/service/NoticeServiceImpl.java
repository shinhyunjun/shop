package com.example.imageshop.service;

import com.example.imageshop.domain.Notice;
import com.example.imageshop.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper mapper;

    @Transactional
    @Override
    public void register(Notice notice) throws Exception{

        mapper.create(notice);
    }
}
