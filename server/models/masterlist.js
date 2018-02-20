'use strict';
module.exports = function(sequelize, DataTypes) {
  var Masterlist = sequelize.define('Masterlist', {
    time: DataTypes.TIME,
    song: DataTypes.STRING,
    studio: DataTypes.STRING,
    dancers: DataTypes.TEXT

  }, {
    classMethods: {
      associate: function(models) {
      }
    }
  });
  return Masterlist;
};