//package com.wework.workman.chatting.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.messaging.simp.config.MessageBrokerRegistry;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//
//
//@Configuration
//@EnableWebSocketMessageBroker
//public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{
//	
//	@Override
//	public void configureMessageBroker(MessageBrokerRegistry registry) {
//		System.out.println("configMessageBroker : " + registry.toString());
//		
//		registry.setApplicationDestinationPrefixes("/publish");
//		registry.enableSimpleBroker("/subscribe");
//		
//		
//	}                 
//	
//	 
//	@Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//        
//		System.out.println("configEndpoint : " + registry.toString());
//		
//		registry.addEndpoint("/stomp-chatting").setAllowedOrigins("*").withSockJS();
////        registry.addEndpoint("/stomp-chatting").withSockJS();
////		registry.addEndpoint("/stompChatting").setHandshakeHandler(new DefaultHandshakeHandler(new TomcatRequestUpgradeStrategy())).withSockJS();
//        
//        
//    }
//	
//	
//}
//
