# Copyright (c) 2018 Vente-Privée
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM vpgrp/debian:stretch

ENV DEBIAN_FRONTEND="noninteractive" \
    TZ="Europe/Amsterdam"

RUN apt-get update  -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y \
      gettext \
      libunwind8 && \
    apt-clean

# get .NET (https://www.microsoft.com/net/core)
RUN curl \
      --insecure \
      --location \
      --output "/tmp/dotnet.tar.gz" \
      --silent \
      "https://aka.ms/dotnet-sdk-2.0.0-linux-x64" && \
    mkdir -p /opt/dotnet && \
    tar zxf /tmp/dotnet.tar.gz -C /opt/dotnet && \
    rm /tmp/dotnet.tar.gz && \
    ln -s /opt/dotnet/dotnet /usr/local/bin && \
    ln -s /opt/dotnet/dotnet /usr/bin
# EOF
