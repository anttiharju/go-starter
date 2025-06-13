# frozen_string_literal: true

# This file is generated by render.bash, do not edit manually.
class ${class_name} < Formula
  desc '${description}'
  homepage '${homepage}'
  version '${version}'
  license 'MIT'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/${repo_owner}/${repo_name}/releases/download/v${version}/${repo_name}-darwin-amd64.tar.gz'
      sha256 '${darwin_amd64_sha256}'

      def install
        bin.install '${repo_name}'
      end
    end
    if Hardware::CPU.arm?
      url 'https://github.com/${repo_owner}/${repo_name}/releases/download/v${version}/${repo_name}-darwin-arm64.tar.gz'
      sha256 '${darwin_arm64_sha256}'

      def install
        bin.install '${repo_name}'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url 'https://github.com/${repo_owner}/${repo_name}/releases/download/v${version}/${repo_name}-linux-amd64.tar.gz'
      sha256 '${linux_amd64_sha256}'

      def install
        bin.install '${repo_name}'
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/${repo_owner}/${repo_name}/releases/download/v${version}/${repo_name}-linux-arm64.tar.gz'
      sha256 '${linux_arm64_sha256}'

      def install
        bin.install '${repo_name}'
      end
    end
  end

  test do
    system "#{bin}/${repo_name} version"
  end
end
