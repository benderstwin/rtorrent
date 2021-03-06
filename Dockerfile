FROM bender77/debianbase

RUN useradd --create-home user

RUN apt-get update && apt-get install -yq rtorrent

RUN mkdir -p /torrents/session \
    && touch /torrents/.rtorrent.rc \
    && chown -R user:user /torrents
    
RUN chown -R user:user /home/user

USER user
CMD ["rtorrent","-D","FOREGROUND"]
