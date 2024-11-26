# fill in your API key
$apikey = ''

$headers = @{
  Authorization="Bearer ${apikey}"
}

$bodyParams = @'
  {
    "personalizations": [
      {
        "to": [
          {
            "email": "recipient@example.net",
            "name": "Firstname Lastname"
          }
        ],
        "subject": "Hello, World!"
      }
    ],
    "content": [
      {
        "type": "text/plain",
        "value": "Heya!"
      }
    ],
    "from": {
      "email": "sender@example.com",
      "name": "Firstname Lastname"
    },
    "reply_to": {
      "email": "sender@example.net",
      "name": "First Name"
    }
  }
'@

Invoke-RestMethod -Method POST `
  -Uri https://api.sendgrid.com/v3/mail/send `
  -Headers $headers `
  -ContentType 'application/json' `
  -Body $bodyParams
