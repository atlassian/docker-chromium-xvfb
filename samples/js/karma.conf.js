module.exports = function(config) {
  config.set({
    browsers: ['Chrome'],
    frameworks: ['qunit'],
    plugins: ['karma-qunit', 'karma-chrome-launcher'],
    files: [
      'tests/*.js'
    ],
    singleRun: true,
    reporters: ['progress']
  });
};
