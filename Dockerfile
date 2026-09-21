FROM sharelatex/sharelatex:latest

USER root

RUN tlmgr update --self || true \
 && tlmgr install scheme-full \
 && tlmgr path add

RUN openssl rand -base64 32 \
      > /etc/container_environment/OVERLEAF_INVITE_TOKEN_SECRET \
 && chmod 644 /etc/container_environment/OVERLEAF_INVITE_TOKEN_SECRET
