module.exports = function(config) {
  config.set({
    browsers: ['Chrome'],
    frameworks: ['qunit'],
    files: [
      'tests/*.js'
    ],
    singleRun: true,
    reporters: ['progress', 'junit'],
    junitReporter: {
      outputFile: 'test-results/results.js.xml'
    }
  });
};
