# Task:
Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file and at midnight it sends the content of the file to a specified email address, then starts over for the new day.

# Procedure:

- Install SSMTP and Mailutils and Mutt. Setup a new mail using mailtrap or you can use an existing email.This email will receive mail alerts.

- Run `apt-get install ssmtp` or `sudo apt-get install ssmtp` to install SSMTP.

- Run `apt-get install mailutils` or `sudo apt-get install mailutils` to install Mailutils.

- Run `apt-get install mutt` or `sudo apt-get install mutt` to install mutt.

- Mailltrap automatically generate an AuthUser name and AuthPass password. otherwise, Create an app password to generate a password and enable 2-Step verification.

- Edit the SSMTP configuration file:

  root=username@gmail.com
  
  mailhub=smtp.gmail.com:465

  AuthUser=your email address(e.g.your_email@gmail.com)
  
  AuthPass=your app password
  
  UseSTARTTLS=No
  
  UseTLS=YES
  
  FromLineOverride=Yes (uncomment this at the bottom of the file).

  *NB: Alternatively, use the mailtrap credentials provided for the SSMTP configuration*.

- Write a bash script to automate the process.

- Schedule a cronjob using a crontab for timely execution of the bash script.

# Instruction:

Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise.

![](./images8/script%20ssmtp%20conf.png)
![](./images8/Bash%20script%200000%20(2).png)
![](./images8/mail%20ssmtp%20ex8.png)