package com.chatbot.whatsapp.model;

import jakarta.validation.constraints.NotBlank;
public class IncomingMessage {

    @NotBlank(message = "Sender phone number ('from') is required")
    private String from;

    private String to;

    private String name;

    @NotBlank(message = "Message body ('message') is required")
    private String message;

    public IncomingMessage() {
    }

    public IncomingMessage(String from, String to, String name, String message) {
        this.from = from;
        this.to = to;
        this.name = name;
        this.message = message;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
