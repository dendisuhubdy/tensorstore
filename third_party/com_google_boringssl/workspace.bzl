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
load("//:cmake_helpers.bzl", "cmake_add_dep_mapping", "cmake_fetch_content_package")

# REPO_BRANCH = master-with-bazel

def repo():
    maybe(
        third_party_http_archive,
        name = "com_google_boringssl",
        strip_prefix = "boringssl-098695591f3a2665fccef83a3732ecfc99acdcdd",
        urls = [
            "https://github.com/google/boringssl/archive/098695591f3a2665fccef83a3732ecfc99acdcdd.tar.gz",  # master-with-bazel(2022-07-20)
        ],
        sha256 = "e141448cf6f686b6e9695f6b6459293fd602c8d51efe118a83106752cf7e1280",
        system_build_file = Label("//third_party:com_google_boringssl/system.BUILD.bazel"),
        patches = [
            # boringssl sets -Werror by default.  That makes the build fragile
            # and likely to break with new compiler versions.
            "//third_party:com_google_boringssl/patches/no-Werror.diff",
        ],
        patch_args = ["-p1"],
    )

cmake_fetch_content_package(name = "com_google_boringssl")

cmake_add_dep_mapping(target_mapping = {
    "@com_google_boringssl//:crypto": "crypto",
})
