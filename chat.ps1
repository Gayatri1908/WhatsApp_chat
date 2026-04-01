$url = 'http://localhost:8080/webhook'

$green = [char]27 + '[0;32m'
$cyan  = [char]27 + '[0;36m'
$bold  = [char]27 + '[1m'
$nc    = [char]27 + '[0m'

Clear-Host
Write-Host "${bold}========================================${nc}"
Write-Host "${bold}   WhatsApp Chatbot CLI Client${nc}"
Write-Host "${bold}========================================${nc}"
Write-Host 'Type your message and press Enter.'
Write-Host "Type 'exit' to quit."
Write-Host '----------------------------------------'

while ($true) {
    Write-Host -NoNewline "${green}${bold}You: ${nc}"
    $msg = Read-Host

    if ($msg -in @('exit', 'quit', 'bye')) {
        Write-Host "${cyan}${bold}Bot:${nc} Goodbye!"
        break
    }

    if ([string]::IsNullOrWhiteSpace($msg)) {
        continue
    }

    try {
        $reply = Invoke-RestMethod -Method Post -Uri $url -ContentType 'text/plain' -Body $msg
        Write-Host -NoNewline "${cyan}${bold}Bot:${nc} "
        if ($reply -is [string]) {
            Write-Host $reply
        }
        elseif ($null -ne $reply.reply) {
            Write-Host $reply.reply
        }
        else {
            Write-Host ($reply | ConvertTo-Json -Depth 5)
        }
    }
    catch {
        Write-Host "${cyan}${bold}Bot:${nc} Failed to reach the chatbot endpoint: $($_.Exception.Message)"
    }

    Write-Host '----------------------------------------'
}
