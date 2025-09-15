FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# タイムゾーン設定
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# XeLaTeX + LaTeX + Pygments
RUN apt-get update && \
    apt-get install -y \
        texlive-xetex \
        texlive-latex-recommended \
        texlive-latex-extra \
        latexmk \
        python3-pygments \
        tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# フォント
RUN apt-get update && \
    apt-get install -y \
        fonts-noto-core \
        fonts-noto-cjk \
        fonts-noto-mono \
        texlive-lang-cjk \
        texlive-lang-chinese && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /work
