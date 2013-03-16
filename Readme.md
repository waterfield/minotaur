Minotaur
========

Installation
------------

```bash
npm install bower -g

npm install
sudo npm link (in redeye dir)
npm link redeye (in minotaur dir)
bower install
```

Configuration
-------------

```json
{
  "host":"localhost",
  "port":"6379",
  "slice":"0"
}
```

Usage
-----

```bash
npm start (for development)
node server.js (for production)
```

Run a search just as you would in redis-cli (i.e. to search for all keys associated with node 'b', run '*b*')