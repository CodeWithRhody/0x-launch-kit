# Use the official 0x API image
FROM 0xorg/0x-api:latest

# Expose the port
EXPOSE 3000

# Set environment variables
ENV HTTP_PORT=3000
ENV NETWORK_ID=1
ENV CHAIN_ID=1
ENV WHITELIST_ALL_TOKENS=true
ENV FEE_RECIPIENT=0x0000000000000000000000000000000000000000
ENV MAKER_FEE_UNIT_AMOUNT=0
ENV TAKER_FEE_UNIT_AMOUNT=0

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Start the API
CMD ["node", "dist/src/index.js"]
