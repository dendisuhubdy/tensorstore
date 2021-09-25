# Copyright 2020 The TensorStore Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load(
    "//third_party:repo.bzl",
    "third_party_http_archive",
)
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repo():
    maybe(
        third_party_http_archive,
        name = "org_nghttp2",
        strip_prefix = "nghttp2-1.45.1",
        urls = [
            "https://github.com/nghttp2/nghttp2/releases/download/v1.45.1/nghttp2-1.45.1.tar.gz",
        ],
        sha256 = "2379ebeff7b02e14b9a414551d73540ddce5442bbecda2748417e8505916f3e7",
        build_file = Label("//third_party:org_nghttp2/bundled.BUILD.bazel"),
        system_build_file = Label("//third_party:org_nghttp2/system.BUILD.bazel"),
    )