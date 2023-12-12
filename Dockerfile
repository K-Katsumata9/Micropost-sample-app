# Amazon Linux 2をベースにする
FROM amazonlinux:2

# 必要なパッケージのインストール
RUN yum install -y \
    gcc-c++ \
		glibc-headers \
		openssl-devel \
		readline \
		libyaml-devel \
		readline-devel \
		zlib \
		zlib-devel \
		libffi-devel \
		libxml2 \
		libxslt \
		libxml2-devel \
		libxslt-devel \
		sqlite-devel

# rbenvのインストール
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash

# rbenvの設定
ENV PATH="/root/.rbenv/bin:/root/.rbenv/shims:${PATH}"
RUN echo 'eval "$(rbenv init --no-rehash -)"' >> /etc/profile.d/rbenv.sh

# rubyのインストール (ここでは2.7.4を例としていますが、必要に応じてバージョンを変更)
ARG RUBY_VERSION=2.7.4
RUN rbenv install $RUBY_VERSION && \
    rbenv global $RUBY_VERSION

# Bundlerのインストール
RUN gem install bundler

# 作業ディレクトリを作成
WORKDIR /app

# ここにアプリケーションのコードや設定をコピーする
COPY . .

# 依存関係のインストールなどアプリケーションのビルド手順を追加する
