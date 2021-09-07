FROM lnl7/nix:2020-09-11 AS builder

RUN nix-env -iA nixpkgs.git nixpkgs.gnutar nixpkgs.gzip

RUN git clone git://github.com/channable/dbcritic /app

WORKDIR /app

RUN nix-build

CMD [ "/app/result/bin/dbcritic" ]