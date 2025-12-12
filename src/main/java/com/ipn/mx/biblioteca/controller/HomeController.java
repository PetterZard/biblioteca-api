package com.ipn.mx.biblioteca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        // Redirige automáticamente al Swagger UI
        return "redirect:/swagger-ui.html";
    }

    @GetMapping("/health")
    @ResponseBody
    public String health() {
        return "OK - Biblioteca API is running!";
    }
}
