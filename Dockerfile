FROM node:18-alpine3.19

WORKDIR /usr/src/app

RUN corepack enable && corepack prepare yarn@4.9.2 --activate

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/.yarnrc.yml ./
COPY --from=build /usr/src/app/.yarn ./yarn
COPY --from=build /usr/src/app/.pnp.cjs ./
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["yarn", "run", "start:prod"]
