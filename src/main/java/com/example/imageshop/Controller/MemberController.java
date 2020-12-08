package com.example.imageshop.Controller;

import com.example.imageshop.domain.Member;
import com.example.imageshop.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberService service;

    // 스프링 시큐리티의 비밀번호 암호화 처리기
    @Autowired
    private PasswordEncoder passwordEncoder;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Member member, Model model) throws Exception {
        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr) throws Exception {
        if (result.hasErrors()) {
            return "user/register";
        }

        // 비밀번호 암호화
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        //  service.register(member);

        rttr.addFlashAttribute("userName", member.getUser_name());




        service.register(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";
    }
}
