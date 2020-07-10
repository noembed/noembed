FROM perl:5.32-slim
LABEL maintainer="itconsense@gmail.com"
RUN apt-get update && apt-get -y install libgif-dev cpanminus build-essential python-dev libssl-dev openssl zlib1g-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /noembed
COPY . /noembed
RUN PERL_CPANM_OPT="--skip-installed --notest --auto-cleanup=1" cpanm --installdeps . 
EXPOSE 5000
CMD [ "plackup", "-Ilib", "bin/noembed.psgi" ]
