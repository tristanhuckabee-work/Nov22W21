'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('Colors', [
      {name:'red'}
    ])
  },

  down: async (queryInterface, Sequelize) => {
    // This file shouldn't get ran...
  }
};
