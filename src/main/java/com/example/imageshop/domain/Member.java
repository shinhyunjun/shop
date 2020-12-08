package com.example.imageshop.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@ToString
public class Member {

    private int user_no;

    @NotNull
    private String user_id;

    private String user_password;

    private String user_name;
    private String user_email;

    private List<MemberAuth> authList;
}
