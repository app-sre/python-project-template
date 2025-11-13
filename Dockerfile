FROM registry.access.redhat.com/ubi9/python-312@sha256:f9a256f5dc66ac635d854b4d80cb720846d6120606422fccbd35de1d69affd86 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.9@sha256:f6e3549ed287fee0ddde2460a2a74a2d74366f84b04aaa34c1f19fec40da8652 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
