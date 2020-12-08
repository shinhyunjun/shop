package com.example.imageshop.Controller;

import com.example.imageshop.common.security.domain.CustomUser;
import com.example.imageshop.domain.Member;
import com.example.imageshop.domain.Notice;
import com.example.imageshop.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService service;

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Notice notice, RedirectAttributes rttr) throws Exception {

        service.register(notice);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Model model, Authentication authentication) throws Exception {

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        Notice notice = new Notice();
        notice.setWriter(member.getUser_id());   // 등록 시 id를 미리 입력해 준다.
        model.addAttribute(notice);
    }
}
