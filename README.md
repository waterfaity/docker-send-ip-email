### 通过邮箱发送本地IP

##### 说明
###### 1.获取IP
    本地请求服务器,由服务器返回IP地址. 形式如: 
    "...您的本地上网IP是：<h2>11.11.11.11<h2>..." 
    筛选得出 IP:11.11.11.11
###### 2.邮箱发送
    邮箱开通POP3/SMTP服务,网站会提供授权码及SMTP/POP服务器地址.
###### 3.运行程序
    内置java程序,打包成jar包,存放于"/home/jar"下
###### 4.示例


```
docker run -it -d \
    --name sendIpEmail \
    --restart always \
    -v /home/sendIpEmail/jar:/home/jar \
    -e MAIL_ACCOUNT="发送邮箱" \
    -e MAIL_HOST="POP3/SMTP服务器地址如:smtp.qq.com" \
    -e MAIL_PASSWORD="邮箱授权码" \
    -e SEND_TO_MAIL="发送到邮箱" \
    -e COPY_TO_MAILS="抄送邮箱1,抄送邮箱2" \
    -e IP_SERVERS="http://www.net.cn/static/customercare/yourip.asp,请求IP服务器2(多个用逗号隔开)" \
    -e CHARSETS="gb2312,请求IP服务器编码2(默认是UTF-8,多个用逗号隔开)" \
    waterfairy/send-ip-email:0.0.2
``` 
