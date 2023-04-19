'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Colors', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      name: {
        type: Sequelize.STRING(50)
      },
      // name: Sequelize.String(50)
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Colors');
  }
};
