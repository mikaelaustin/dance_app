'use strict';
module.exports = function(sequelize, DataTypes) {
  var Dancers = sequelize.define('Dancers', {
    dancer: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
      }
    }
  });
  return Dancers;
};