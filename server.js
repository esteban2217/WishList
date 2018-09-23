// load the things we need
var mysql = require("mysql");
var express = require('express');
var app = express();
var router = express.Router();

var session = require('express-session');
//allow sessions SETS A TIMER FOR HOW LONG THE SESSION WILL STAY ACTIVE:
app.use(session({ secret: 'app', cookie: { maxAge: 1*1000*60*60*24*365}}));


var bodyParser = require('body-parser');

	// parse application/x-www-form-urlencoded
	app.use(bodyParser.urlencoded({ extended: true }));

	// parse application/json
	app.use(bodyParser.json());


// set the view engine to ejs
app.set('view engine', 'ejs');

// use res.render to load up an ejs view file

var connection = mysql.createConnection({
	host: "localhost",
  
	// Your port; if not 3306
	port: 3306,
  
	// Your username
	user: "root",
  
	// Your password
	password: "gleb123",
	database: "wishlist_db"
  });


// index page 
app.get('/', function(req, res) {
	res.render('pages/index');
});


app.get('/create_wishlist', function(req, res) {
	res.render('pages/create_wishlist');
});


//FIND WISHLIST 
app.get('/find_wishlist', function(req, res) {
	res.render('pages/find_wishlist');
});

app.post('/find_wishlist_user', function(req, res){
	connection.query('SELECT * FROM users WHERE email = ?', [req.body.email],function (error, results, fields) {
	  if (error) throw error;
	
				req.session.user_id = results[0].id;
				req.session.user = results[0].name;
				req.session.email = results[0].email;
				
				user_id = req.session.user_id;
				user = req.session.user;
				email = req.session.email;

				// console.log(user_id);
				// console.log(email);
				// console.log(user);

	connection.query('SELECT item_name, item_category, item_url, price FROM wishlist WHERE user_id = ?', [results[0].id],function (error, results2, fields) {
		if (error) throw error;

		req.session.list = results2
		list = (req.session.list)

		// console.log(list[0]);
		
		res.render('pages/find_wishlist_user');
	});

		// });

	});
});

//PURCHASE ITEM
app.post('/purchaseitem/:id', function(req, res){
	// var id = req.params.id;

	// res.send(id + "");

	var query = connection.query(
	  "DELETE FROM wishlist WHERE id = ?",
	  [req.params.id],
	  function(err, response) {
	    res.redirect('/find_wishlist_user');
	  }
	);

})



//LOGIN TO YOUR WISHLIST
app.get('/login', function(req, res){
	res.render('pages/login')
})

app.post('/login', function(req, res){
	// res.json(req.body)
	connection.query('SELECT * FROM users WHERE email = ?', 
	[req.body.email], function (error, results, fields) {
	if (error) throw error;
	req.session.email = results[0].email;
	res.session.user_id = results[0].id;
	// res.json(results[0]);
	console.log(results)
	res.redirect('/user_wishlist');
	});
});


//DISPLAY WISHLIST ITEMS ON PAGE
app.get('/user_wishlist', function(req, res){
	res.render('pages/user_wishlist')
})


app.post('/user_wishlist', function(req, res){
	connection.query('SELECT * FROM users WHERE email = ?', [req.body.email],
	function (error, results, fields) {
		if (error) throw error;

				req.session.user_id = results[0].id;
				req.session.user = results[0].name;
				req.session.email = results[0].email;
				
				user_id = req.session.user_id;
				user = req.session.user;
				email = req.session.email;
// console.log(results);


		connection.query('SELECT wishlist_id, item_name, item_category, item_url, price FROM wishlist WHERE user_id = ?',
		[user_id],function (error, results2, fields) {
				if (error) throw error;

					req.session.wishlist_id
					req.session.list = results2
					list = (req.session.list)


			console.log(list[0]);
				
				res.render('pages/user_wishlist', {results: results2});
		});
	})

});


//REMOVE ITEM

app.post('/remove/:id', function(req, res){
		// var id = req.params.id;
	
		// res.send(id + "");
	
		var query = connection.query(
		  "DELETE FROM wishlist WHERE wishlist_id = ?",
		  [req.params.id],
		  
		);
	
		res.render('pages/user_wishlist.ejs');
	})


// ADDING A NEW USER TO MYSQL
app.post('/new_user', function(req, res){
		
		var query = connection.query(
		"INSERT INTO users SET ?",
		req.body,
		function(error, response, fields) {
			if (error) throw error;
			console.log(req.body);
			res.redirect('/create_wishlist');
		}
		);
	})

	app.post('/create_wishlist', function(req, res){

		req.session.item_name = req.body.item_name
        req.session.item_category = req.body.item_category
        req.session.picture_url = req.body.picture_url
        req.session.item_url = req.body.item_url
        req.session.price = req.body.price

        item_name = req.session.item_name
        item_category = req.session.item_category
        picture_url = req.session.item_url
        item_url = req.session.item_url
        price = req.session.price


		var query = "INSERT INTO wishlist (user_id, item_name, item_category, picture_url, item_url, price) VALUES (?, ?, ?, ?, ?, ?)"

		connection.query(query,[ req.session.user_id, req.body.item_name, req.body.item_category, req.body.picture_url, req.body.item_url, req.body.price ],
          function(error, response, fields) {
			if (error) throw error;
			console.log(req.body);
			res.redirect('/create');
			
          }
        );
	})
	
	app.get('/create', function(req, res){
		
        res.render('pages/create');
   })


app.get('/signup', function(req, res){
	res.render('pages/signup');
});

app.get('/about', function(req, res){
	res.render('pages/about');
});

app.get('/contact', function(req, res){
	res.render('pages/contact');
});


var PORT = process.env.PORT || 3000
app.listen(PORT);












