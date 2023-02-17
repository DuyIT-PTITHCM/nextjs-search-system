let APP_NAME = 'app-revu-search';

if (process.env.APP_NAME) {
  // eslint-disable-next-line prefer-destructuring
  APP_NAME = process.env.APP_NAME;
}

module.exports = {
  apps: [
    {
      name: APP_NAME,
      script: 'npm',
      args: 'start',
      instances: 0,
      // eslint-disable-next-line camelcase
      exec_mode: 'cluster',
    },
  ],
};
