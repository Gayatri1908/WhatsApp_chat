# WhatsApp Chatbot Backend Simulation

A simple WhatsApp chatbot backend simulation built with Spring Boot.

## Features

- REST API webhook: `POST /webhook`
- Predefined replies for common messages
- Message logging with timestamps
- Input validation and structured error responses
- Webhook verification via `GET /webhook`

## Project Structure

```
whatsapp-chatbot/
├── pom.xml
├── Dockerfile
├── chat.sh
├── chat.ps1
├── src/main/java/com/chatbot/whatsapp/
│   ├── WhatsappChatbotApplication.java
│   ├── controller/
│   │   ├── WebhookController.java
│   │   └── GlobalExceptionHandler.java
│   ├── model/
│   │   ├── IncomingMessage.java
│   │   └── OutgoingMessage.java
│   └── service/
│       └── ChatbotService.java
└── src/test/java/com/chatbot/whatsapp/
    └── WhatsappChatbotApplicationTests.java
```

## Prerequisites

- Java 17 or later

## Run Locally

```bash
./mvnw spring-boot:run
```

The server starts at [http://localhost:8080](http://localhost:8080).

## Chat with the Bot

Use the interactive script that matches your shell:

```bash
./chat.sh
```

PowerShell:

```powershell
.\chat.ps1
```

Windows terminal shortcut:

```powershell
.\chat.cmd
```

## Example Requests

Send a message:

```bash
curl -X POST http://localhost:8080/webhook \
  -H "Content-Type: application/json" \
  -d '{"from":"919876543210","name":"Subhrakanta","message":"Hi"}'
```

Health check:

```bash
curl http://localhost:8080/webhook
```

## Run Tests

```bash
./mvnw test
```

## Notes

- `chat.sh` is for Bash-compatible shells.
- `chat.ps1` is the Windows PowerShell equivalent.
- `chat.cmd` is a Windows terminal launcher for PowerShell users.
- The application listens on port `8080` by default.