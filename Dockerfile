FROM registry.access.redhat.com/ubi9/python-312@sha256:c798f775119a2e9c676fcfdb14a0d24cb562790b1a4c1bb49d0966aec039c673 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.9@sha256:f6e3549ed287fee0ddde2460a2a74a2d74366f84b04aaa34c1f19fec40da8652 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
