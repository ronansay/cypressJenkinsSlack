const { defineConfig } = require("cypress");

module.exports = defineConfig({
  chromeWebSecurity: false,
  experimentalStudio: false,
  experimentalSessionSupport: false, 
  reporter: 'cypress-mochawesome-reporter',
  e2e: {
    setupNodeEvents(on, config) {
      require('cypress-mochawesome-reporter/plugin')(on);
      // implement node event listeners here
    },
    reporterOptions: {
      reporterDir: 'cypress-report',
      charts: true,
      quiet: true,
      overwrite: false,
      html: false,
      json: true,
      embeddedScreenshots: true
    },
  },
});
