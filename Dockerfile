FROM registry.access.redhat.com/ubi9/python-312@sha256:c91642bdeddb1542f7081bc7846926f7741f75be4f35ef33f8908c1db236c10b AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.1@sha256:190cbcca15602bad4531b4310f928fd34a036d50ec3edb6389edc167e21c35b6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
