param ( 
    [string]$BRANCH_NAME, 
    [string]$EMAIL_RECIPIENT 
) 
# Send email notification 
$emailSubject = "New Branch Created: $BRANCH_NAME" 
$emailBody = "A new branch named $BRANCH_NAME has been created." 
# Use Send-MailMessage cmdlet to send the email 

Send-MailMessage -To $EMAIL_RECIPIENT -From "kamboj.prjwl@outlook.com" -Subject $emailSubject -Body $emailBody -SmtpServer "smtp.your-email-provider.com"