#基于基础镜像:tomcat:latest
FROM openjdk:8u212-jdk

MAINTAINER 水妖 "995637517@qq.com"

LABEL maintainer="995637517@qq.com"
LABEL version="1.0"
LABEL description="通过邮箱发送本地IP地址" 

ENV TZ=Asia/Shanghai
#复制jar  并挂载/home/jar
COPY ./jar/SendIpEmail-1.1.jar /home/jar/SendIpEmail-1.1.jar
#配置邮箱帐号信息 host/password
ENV MAIL_ACCOUNT    ""
ENV MAIL_HOST       ""
ENV MAIL_PASSWORD   ""
#发送到邮箱
ENV SEND_TO_MAIL    ""
ENV COPY_TO_MAILS   ""
#IP服务器 , 隔开
ENV IP_SERVERS      "http://www.net.cn/static/customercare/yourip.asp"
#网页编码
ENV CHARSETS        "gb2312"
#镜像启动时 执行的命令
ENTRYPOINT java -jar /home/jar/SendIpEmail-1.1.jar {\"mailAccount\":\"$MAIL_ACCOUNT\",\"mailHost\":\"$MAIL_HOST\",\"mailPassword\":\"$MAIL_PASSWORD\",\"sendToMail\":\"$SEND_TO_MAIL\",\"copyToMails\":\"$COPY_TO_MAILS\",\"ipServers\":\"$IP_SERVERS\",\"charsets\":\"$CHARSETS\"}
