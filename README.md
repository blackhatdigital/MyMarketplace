<h1>My Marketplace</h1>

<p>This application is a sample marketplace with stripe connect integration.</p>

<p>The intent was for people to use this repo as a starting point to build their own marketplaces.</p>

<p>At this point in time the stack includes:</p>

+ Devise
+ Stripe (for charges)
+ Omniauth Stripe Connect (for users to connect their stripe account)
+ Figaro (ENV Variables)
+ Bootstrap

<h2>To install:</h2><br />

<b>clone the repo< -</b> git clone git@github.com:blackhatdigital/MyMarketplace.git
<b>run -</b> bundle install
<b>run -</b> rake:dbmigrate

<b>Install figaro</b>
bundle exec figaro install

<b>Open config/application.yml and fill in your stripe credentials:</b>
stripe_api_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx<br />
stripe_publishable_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx<br />
stripe_client_id: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx <br /><br />

<i>(Note: You will find the client_id for your stripe account under account settings -> connect)</i>

<b>Open stripe dashboard, under account settings open connect and change your callback url to:<br /></b>
https://yoururl.herokuapp.com/users/auth/stripe_connect/callback

<h2>Customise:</h2><br />
You can customise the fees involved by locating the orders_controller#create<br />
<a href="https://stripe.com/docs/connect/payments-fees">Refer to stripe documentation for help:</a>

<h2>Things still needed</h2>
<ul>
	<li>Cleaner Style</li>
	<li>Clean Migrations</li>
	<li>Social Logins and Stripe Login</li>
	<li>Refund functionality</li>
	<li>Update and save card functionality (stripe create customer)</li>
	<li>Emails</li>
	<li>Receipts</li>
</ul>

<h2>All welcome, fork, contribute whatever you need. Let's see more marketplaces out there.</h2>

