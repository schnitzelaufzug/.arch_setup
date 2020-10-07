#!/bin/bash

username="p.nopper10@gmail.com"
password="&@8nraTbd2ST"
mails=$(curl -u $username:$password  --silent "https://mail.google.com/mail/feed/atom/nopper-entwicklung-draht-driller" | sed -e 's/.*fullcount>\(.*\)<\/fullcount>.*/\1/')

printf '%s\n' "${mails}"
