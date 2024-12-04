FROM registry.access.redhat.com/ubi9/python-312@sha256:d9637eab5b8f44d754fa2c7ffeb546bfb27894c700f2e3a8a5705b44a70313cc AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.6@sha256:92aa10fc236a5cbd3624c9909f855a860bd209fef17756c831ee84c478423517 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
