FROM registry.access.redhat.com/ubi9/python-312@sha256:e846e09757226933f8e9a94941eb2e2769425a43ceb8322e9e2666a7c97c401e AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.12@sha256:515b886e8eb99bcf9278776d8ea41eb4553a794195ef5803aa7ca6258653100d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
