var bcrypt = require('bcryptjs');
var cryptojs = require('crypto-js');

module.exports = function (sequelize, DataTypes) {
	var User = sequelize.define('User', {
		name: {
			type: DataTypes.STRING,
			allowNull: false
		},
		email:{
			type:DataTypes.STRING,
			allowNull:false,
			unique: true,
			validate:{
				msg: "Please enter a valid email address"
			}
		},
		phone:{
			type:DataTypes.INTEGER,
			allowNull: false
		},
		username: {
			type: DataTypes.STRING,
			unique: true,
			validate:{
				msg: "Username already taken"
			}
		},
		salt: {
			type: DataTypes.STRING
		},
		password_hash: {
			type: DataTypes.STRING,
			allowNull: false
		},
		password: {
			type: DataTypes.VIRTUAL,
			allowNull: false,
			validate: {
				len: [7, 100],
				msg: "Password must be at least 7 characters in length"
			},
			set: function (value) { 
				var salt = bcrypt.genSaltSync(10);
				var hashedPassword = bcrypt.hashSync(value, salt);

				this.setDataValue('password', value);
				this.setDataValue('salt', salt);
				this.setDataValue('password_hash', hashedPassword);
			}
		},
		location: {
			type: DataTypes.STRING,
			allowNull:false,
			validate: {
				msg: "Select a location from the list"
			}
		},
		studio: {
			type:DataTypes.STRING,
			allowNull:true
		},
		dancers: {
			type: DataTypes.STRING,
			allowNull:true
		}
	}, {
		classMethods: {
      		associate: function(models) {
      		},
		},
		instanceMethods: {
		}
	});
	return User;
};