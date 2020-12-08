package com.example.imageshop.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {



    @RequestMapping("/")    //url을 컨트롤러의 메서드와 매핑할때 사용
    public String home(Model model) {

        return "home";
    }



}
