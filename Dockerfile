FROM elixir:1.11.2-alpine

WORKDIR /opt/blockchain

COPY blockchain_worker .

EXPOSE 4002

CMD ./blockchain_worker