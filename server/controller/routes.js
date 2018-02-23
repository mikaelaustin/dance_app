var express = require('express');
var path = require('path');
var bcrypt = require('bcryptjs');

var router = express.Router();

var models = require('./../models');
models.sequelize.sync();

router.get('/', function(req,res){
	res.sendFile(path.join(__dirname, '../../client/public/index.html'));
});

router.post('/api/register' , (req, res) => {
	models.User.create({
		name: req.body.name,
		email: req.body.email,
		phone: req.body.phone,
		username: req.body.username,
		password: req.body.password,
		location: req.body.location,
		studio: req.body.studio,
		dancers: req.body.dancers
	}).then((post) => {
		res.json(post)
	});
});

router.post('/api/login', (req,res) => {
	models.User.findOne({where: {username: req.body.username}}).then((user) => {
		res.json(bcrypt.compareSync(req.body.password, user.password_hash));
	});
});

router.get('/api/schedule' , (req, res) => {
	models.Masterlist.findAll({ order: [
			['id', 'ASC']
		]}).then((response) => {
			res.json(response)
	});
});

router.get('/api/dancers', (req,res) => {
	models.Dancers.findAll({ order: [
			['id', 'ASC']
		]}).then((response) => {
			res.json(response)
	});
})

router.get('*', (req,res) => {
	res.sendFile(path.join(__dirname, '../../client/public/index.html'));
});

module.exports = router;