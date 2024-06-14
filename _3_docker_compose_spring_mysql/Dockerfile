# Dockerfile: Kendi image dosyalarımızı oluşturmak için
# Dockerfile Çalıştırma
# docker build -t image_name .

# docker build -t spring_boot_project .
# docker build . => Image Adını yazmadan oluştur.

# Eğer Dockerfile ismidnen farklı bir isim kullanırsanız (-f) yazmalısınız
# docker build -f DockerfileJavaSpring -t spring_boot_project .

# docker ps
# docker container run  --name spring_boot_project -d -p 9999:9999 node_project
# docker container run  --name spring_boot_project -d -p 3333:9999 node_project


# FROM: Çalıştıracağımız image gösteriri
# İmage olarak JDK kullandım
FROM openjdk:21

# Bilgilendirme
LABEL maintaner="hamitmizrak@gmail.com"

# Çevresel Değişkenler
ENV APP_NAME="Spring And Docker"
ENV VERSION="V1.0.0"
ENV PORT="http://localhost:4444"

# Çalıştırmak
RUN echo "App Name: $APP_NAME"
RUN echo "Version: $VERSION"
RUN echo "Port:4444 $PORT"

# Data Persist (Kalıcı Veri)
VOLUME /tmp

# WORKDIR: Çalışma dizini
# Uygulama için dosya yolu dizini oluştur
# WORKDIR /usr/src/app
# WORKDIR C:\app # Windows İşletim sistemi
# WORKDIR /var/www/html # Frontend

# COPY . /var/www/html

# Port
EXPOSE 4444

# İlgili jar dosyasını bul bunun yeni ismi olarak : JAR_FILE
# ARG JAR_FILE=/target/*.jar
ARG JAR_FILE=*.jar

# Proje yeni ismi: spring_react
ADD ${JAR_FILE} blog_react

# Docker Container çalışması sırasında varsayılan komutlar
# Uygulamayı başlatacak komutlar
ENTRYPOINT [ "java", "-jar","/blog_react" ]

# USER: Kullanıcı göstersin USER poweruser
# ADD: Ekleme
# ARG:
# ENTRYPOINT: Çalıştırılacak komut yolunu

# HEALTHCHECK: Sağlık kontrolünü Eklesin
# HEALTHCHECK: Bu container çalışıyor mu ?
#--interval=30s : Sağlık kontrolünü her 30 saniye bir çalıştırsın
#--timeout=10s  : Sağlık kontrolünü tamamlanması için 10 saniye beklesin
# --start-period=5s : Konteyner başlatıldıktan sonra sağlık kontrolünü başlatması için 5 saniye beklesin
# --retries=3 \: Sağlık kontrolü başarısız olursa 3 defa deneme yapsın
#CMD curl -f http://localhost:9999/ || exit 1 : Belirtilen url'de kontrol başarısız olursa HTTP 200 dışında yanıt versin ve çıkış kodu 1 olsun
# Sağlık durumunu kontrol için docker ps STATUS sutunda konteynarın durumuna bakabilirsin
# Konteynar sağlıklı çalışıyor mu
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
 CMD wget --quiet --tries=1 --spider http://localhost:4444 exit 1



########################################################
