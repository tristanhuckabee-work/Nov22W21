'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('Cats', [
      {name: 'Marcy', weight: 12.2, age: 4.5}
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Cats',
      {name: 'Marcy', weight: 12.2}
    )
  }
};
