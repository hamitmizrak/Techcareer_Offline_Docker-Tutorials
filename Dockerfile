# Dockerfile: Kendi image dosyalarımızı oluşturmak için

# FROM: Çalıştıracağımız image gösteriri
# İmage olarak Node.js kullandım
FROM node:14

# LABEL: Bilgilendirmek
LABEL maintainer="hamitmizrak@gmail.com"

# ENV:  ortam değişkenleri
ENV APP_NAME="Node Js, Dockerfile"
ENV VERSION="v1.0.0"
ENV PORT="9999"

RUN echo "App Name: $APP_NAME" 
RUN echo "Port: $PORT"
RUN echo "Version: $VERSION"

# VOLUME: Kalıcılık(Persist)
VOLUME /tmp

# WORKDIR: Çalışma dizini
# Uygulama için dosya yolu dizini oluştur
WORKDIR /usr/src/app

# COPY: image kopyalama için 
# package.json ve packege-lock.json dosyalarını kopyala 
COPY package*.json  ./

# RUN: İmage için gerekli yüklemeleri
# Bağımlılıkları yükle 
RUN npm install

# Uygulamada kodları kopyala
COPY . .


# EXPOSE: Port numarası
EXPOSE 9999

# CMD: Gerekli yüklemek olduktan sonra çalışmasını isteyeceğimiz komutlar
# Uygulamayı başlat
CMD ["npm","start"]

# USER: Kullanıcı göstersin USER poweruser
# ADD: Ekleme
# ARG:
# ENTRYPOINT: Çalıştırılacak komut yolunu 

# HEALTHCHECK: Sağlık kontrolünü Eklesin
# HEALTHCHECK: Bu container çalışıyor mu ?
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:9999/ || exit 1

#--interval=30s : Sağlık kontrolünü her 30 saniye bir çalıştırsın
#--timeout=10s  : Sağlık kontrolünü tamamlanması için 10 saniye beklesin
# --start-period=5s : Konteyner başlatıldıktan sonra sağlık kontrolünü başlatması için 5 saniye beklesin
# --retries=3 \: Sağlık kontrolü başarısız olursa 3 defa deneme yapsın 
#CMD curl -f http://localhost:9999/ || exit 1 : Belirtilen url'de kontrol başarısız olursa HTTP 200 dışında yanıt versin ve çıkış kodu 1 olsun
# Sağlık durumunu kontrol için docker ps STATUS sutunda konteynarın durumuna bakabilirsin

########################################################
########################################################
# Dockerfile Çalıştırma
# Dockerfile özel bir isimle vermişsek 

# docker build -t app_project .
# docker build .



# docker ps 
# docker container run  --name nodeJS -d -p 9999:9999 app_project