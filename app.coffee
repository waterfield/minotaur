express = require 'express'
Mincer = require 'mincer'
$ = require 'jquery'
jade = require 'jade'

# redis = require 'redis'
Redeye = require 'redeye'

# Routes
main = require './routes/index'
minotaur = require './routes/minotaur'

# Asset management
environment = new Mincer.Environment()
environment.appendPath 'assets/javascripts'
environment.appendPath 'assets/stylesheets'
environment.appendPath 'assets/javascripts/templates'
environment.appendPath 'components'

#db = redis.createClient()
app = express()

#app.engine 'jade', require('jade').__express

app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	app.locals.pretty = true
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.static "#{__dirname}/public"

# Redeye test
manager = new Redeye.Manager verbose: true, flush: true
myObj = {"id":37,"number":"EOG #1","name":"TNT #1","expiration_type_id":1,"original_expiration_date":"2011-05-01","renewal_notice":45,"wet_dry_basis":"W","category_id":null,"begin_date":"2010-06-09","updated_by_id":59,"asset_id":5,"pop":1,"wh_kw":1,"margin":1,"fixed":1,"multi":1,"fees":1,"created_at":"2010-07-23 13:47:29 UTC","updated_at":"2013-01-09 14:15:59 UTC","pressure_base":null,"alternate_contract_number":"PS 57588599","contract_stream_id":null,"anchor_id":"d5ab43ea-9660-11df-9f0f-0019d1010852","from_date":"2010-06-01","to_date":"9999-12-31","contract_type_id":19,"forecasting_meter_id":null,"fee_tests":1,"imbalance":1,"flu_rate_anchor_id":"c2da7346-483c-11e1-8d30-00142212988d","pvr_rate_anchor_id":null,"party_role_id":25,"cashout":1,"meter_overrides_enabled":1,"master_contract_anchor_id":"d5ab43ea-9660-11df-9f0f-0019d1010852","volume_commitments_enabled":1,"quality_specs_enabled":1,"underdeliver_rate_id":30,"overdeliver_rate_id":16,"carryover_allowed":0,"cashout_tolerance":"","cashout_value_type":"Monthly","invoice_term":"NET10","contract_sub_type":"POP with Fees","cost_center":"CC2","shrink_factors_enabled":0,"provisions_enabled":1,"contract_dates_active":1,"comments_enabled":null,"cost_center_id":null,"company":"CO01","meter_test_frequency_id":null,"meter_test_frequency":" ","notice_party_role_id":25,"comments":"","master_contract":null,"mdq":null,"ngl_imbalance_enabled":1,"ngl_imbalance_method":"Entitled - Take","use_all_meters_for_ngl":null,"company_code_id":3,"payment_due_date_id":2,"nomination_type":"Gas","nomination_frequency":"Month","allow_nomination_imbalance":null,"other_rate_anchor_id":null,"allowance_rate_anchor_id":null,"volume_penalties_enabled":0,"cashout_per_delivery":null,"net_all_terms":0,"fixed_records":[{"asset_id":5,"contract_id":37,"created_at":"2012-03-01 18:53:24 UTC","enabled":1,"energy_formula_id":null,"fixed_category":"Recovery","id":35,"max":0,"order":1,"product_id":359,"recovery_percent":91,"updated_at":"2012-04-05 03:26:51 UTC","updated_by_id":30,"usage_id":618,"volume_formula_id":null}],"producer_contract_ids":[37,272,272,272,272,272],"company_code":"CO01","terms":{"products":[{"asset_id":5,"contract_id":37,"created_at":"2010-07-23 15:16:02 UTC","enabled":1,"formula_id":10,"id":4,"margin_only":1,"producer_percent":null,"producer_rate_id":158,"product_id":359,"rate_id":7,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 03:15:03 UTC","enabled":1,"formula_id":48,"id":29,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":360,"rate_id":24,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 03:17:08 UTC","enabled":1,"formula_id":50,"id":30,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":364,"rate_id":25,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 03:17:08 UTC","enabled":1,"formula_id":51,"id":31,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":365,"rate_id":26,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 21:33:18 UTC","enabled":1,"formula_id":52,"id":34,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":366,"rate_id":32,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 21:33:18 UTC","enabled":1,"formula_id":53,"id":35,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":367,"rate_id":28,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-03 21:34:03 UTC","enabled":1,"formula_id":54,"id":36,"margin_only":1,"producer_percent":68,"producer_rate_id":null,"product_id":368,"rate_id":29,"take_in_kind":0,"updated_at":"2012-03-15 00:22:17 UTC","updated_by_id":41,"usage_id":618},{"asset_id":null,"contract_id":37,"created_at":"2010-11-04 22:06:33 UTC","enabled":1,"formula_id":59,"id":37,"margin_only":1,"producer_percent":73,"producer_rate_id":null,"product_id":358,"rate_id":33,"take_in_kind":0,"updated_at":"2012-01-24 15:51:57 UTC","updated_by_id":29,"usage_id":620}],"fees":[{"asset_id":5,"contract_id":37,"created_at":"2010-08-19 20:25:17 UTC","enabled":1,"escalation_id":null,"exclude_from_margin":0,"fee_category_id":3,"fee_number":1,"fee_recovery":"Do not Recover","formula_id":520,"id":18,"meter_anchor_id":null,"override":0,"rate_id":8,"updated_at":"2012-11-28 15:51:42 UTC","updated_by_id":11},{"asset_id":5,"contract_id":37,"created_at":"2012-01-24 16:28:28 UTC","enabled":1,"escalation_id":null,"exclude_from_margin":0,"fee_category_id":2,"fee_number":1,"fee_recovery":"Do not Recover","formula_id":152,"id":308,"meter_anchor_id":null,"override":0,"rate_id":398,"updated_at":"2012-01-24 16:28:28 UTC","updated_by_id":29},{"asset_id":5,"contract_id":37,"created_at":"2012-01-24 16:28:28 UTC","enabled":1,"escalation_id":null,"exclude_from_margin":0,"fee_category_id":7,"fee_number":1,"fee_recovery":"Do not Recover","formula_id":152,"id":309,"meter_anchor_id":null,"override":0,"rate_id":399,"updated_at":"2012-01-24 16:28:28 UTC","updated_by_id":29}],"meter_overrides":[],"whkw":{"asset_id":5,"contract_id":37,"created_at":"2011-07-12 00:40:38 UTC","daily_processing_required":0,"daily_unit_id":null,"enabled":1,"id":62,"kw_formula_id":null,"kw_rate_id":null,"tik":0,"updated_at":"2012-08-29 14:05:17 UTC","updated_by_id":54,"wh_formula_id":152,"wh_rate_id":549},"margin":{"id":18,"asset_id":5,"contract_id":37,"quantity":null,"updated_by_id":30,"unit":null,"created_at":"2011-03-14 22:13:49 UTC","updated_at":"2012-03-15 14:47:31 UTC","enabled":1,"margin_share_percent":75,"floor":25,"receiver":"Producer","margin_items":[{"id":11,"margin_id":18,"product_id":360,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":12,"margin_id":18,"product_id":359,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":13,"margin_id":18,"product_id":368,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":14,"margin_id":18,"product_id":364,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":15,"margin_id":18,"product_id":366,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":16,"margin_id":18,"product_id":365,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":17,"margin_id":18,"product_id":367,"usage_id":618,"fee_category_id":null,"fee_category_number":null,"function":"+","created_at":"2012-01-24 16:00:44 UTC","updated_at":"2012-01-24 16:00:44 UTC"},{"id":18,"margin_id":18,"product_id":null,"usage_id":null,"fee_category_id":3,"fee_category_number":1,"function":"+","created_at":"2012-01-24 16:32:09 UTC","updated_at":"2012-01-24 20:02:25 UTC"},{"id":19,"margin_id":18,"product_id":null,"usage_id":null,"fee_category_id":2,"fee_category_number":1,"function":"+","created_at":"2012-01-24 16:32:09 UTC","updated_at":"2012-01-24 20:02:25 UTC"},{"id":20,"margin_id":18,"product_id":null,"usage_id":null,"fee_category_id":7,"fee_category_number":1,"function":"+","created_at":"2012-01-24 16:32:09 UTC","updated_at":"2012-01-24 20:02:25 UTC"}]},"multi":null,"fee_tests":[],"quality_specs":[],"volume_commitments":[],"volume_penalties":[],"imbalance":{"anchor_id":null,"beginning_mmbtu":0,"beginning_value":0,"carryover_allowed":null,"cashout_method":"By Percent","contract_id":37,"created_at":"2012-02-04 16:34:45 UTC","delivery_meter_anchor_id":null,"from_date":null,"id":11,"imbalance_floor":90000,"imbalance_rate_anchor_id":"6c35229c-58be-11e1-b465-00142212988d","imbalance_tier_rate_type":"V","overdeliver_rate_anchor_id":"f5713370-a668-11df-86f0-0019d1010852","percent":74.12,"percent_variance_calculation":"1","receipt_meter_anchor_id":null,"threshold":null,"to_date":null,"tolerance":null,"underdeliver_rate_anchor_id":null,"updated_at":"2013-01-09 14:45:53 UTC","use_all_receipts":0,"value_type":"Monthly"},"ngl_cashouts":[],"ngl_imbalance_rates":[{"contract_id":37,"created_at":"2012-08-20 21:22:38 UTC","id":1,"imbalance_floor":null,"imbalance_rate_id":549,"overdeliver_rate_id":null,"product_id":359,"tier_type":"Percent","underdeliver_rate_id":null,"updated_at":"2012-08-20 21:22:38 UTC","usage_id":618}],"provisions":[{"contract_id":37,"created_at":"2012-02-08 16:21:20 UTC","description":null,"details":"Min Vol","id":1,"provision_type":"MINVOL","provision_type_id":null,"static":null,"unique_id":"ef7f2110-5270-11e1-801f-00142212988d","updated_at":"2012-02-08 16:21:20 UTC","updated_by_id":1},{"contract_id":37,"created_at":"2012-04-17 19:29:29 UTC","description":null,"details":"this is a test of the length of this field, and I can capture as much textual information as I want.","id":2,"provision_type":"MINVOL","provision_type_id":null,"static":null,"unique_id":"a6b38fbe-88c3-11e1-9080-0019d1010852","updated_at":"2012-04-17 19:29:29 UTC","updated_by_id":30}],"contract_dates":[{"contract_id":37,"created_at":"2012-02-08 16:23:02 UTC","date":"2012-02-08","date_type":"VOLDT","id":1,"updated_at":"2012-02-08 16:25:05 UTC"}]},"historical":{"totals":{}}}

manager.worker 'a', -> @each i:[1..4], @b
manager.worker 'b', 'i', -> @each i:[@i*5-4..(@i*5)], @c
manager.worker 'c', 'i', -> @d i: Math.floor(@i/4)
manager.worker 'd', 'i', -> @e()
manager.worker 'e', -> myObj

manager.run()
setTimeout (-> manager.request 'a'), 100

# Pages
app.get '/', (req, res) ->
  res.redirect('/keyspace')
app.get '/keyspace', minotaur.keyspace
app.get '/state', minotaur.state_page

# API
app.get '/keys', minotaur.keys
app.get '/value/:key', minotaur.value
app.get '/state/:manager', minotaur.state

# Misc
app.use '/assets/', Mincer.createServer environment
app.get '/tests', main.tests
app.get '/test', main.test

app.listen 3000