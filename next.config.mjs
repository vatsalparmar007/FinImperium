/** @type {import('next').NextConfig} */
const nextConfig = {
  // Builds a self-contained server in .next/standalone (only the files the app
  // actually needs), which keeps the Docker image small.
  output: "standalone",

  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "randomuser.me",
      },
    ],
  },

  experimental: {
    serverActions: {
      bodySizeLimit: "5mb",
    },
  },
};

export default nextConfig;
