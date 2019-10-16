package com.wework.workman.chatting.controller;

import com.wework.workman.chatting.model.vo.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class StompController {

    private final SimpMessagingTemplate template;

    @Autowired
    public StompController(SimpMessagingTemplate template) {
        this.template = template;
    }

    @MessageMapping("/chat/join")
    public void join(ChatMessage message) {
        message.setMessage(message.getWriter() + "¥‘¿Ã ¿‘¿Â«œºÃΩ¿¥œ¥Ÿ.");
        template.convertAndSend("/subscribe/chat/room/" + message.getChatRoomId(), message);
    }

    @MessageMapping("/chat/message")
    public void message(ChatMessage message) {
        template.convertAndSend("/subscribe/chat/room/" + message.getChatRoomId(), message);
    }
}
