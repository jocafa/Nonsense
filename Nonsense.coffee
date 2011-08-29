class LFSR
	constructor: (@seed=0x71a2b3c4, @taps=0x48000000) ->
		@state = @seed


	shift: ->
		lsb = @state & 0x1
		@state >>= 1
		@state ^= @taps if lsb == 1
		@state &= 0x7fffffff
		@state


class Nonsense
	constructor: (seed) ->
		@lfsr = new LFSR(seed)

	seed: (seed) ->
		@lfsr.state = seed

	#-----------------------------------------------------------[ Numbers ]----
	integer: ->
		@lfsr.shift()

	frac: ->
		@lfsr.shift() / 0x7fffffff

	real: ->
		@lfsr.shift() + @frac()

	integerInRange: (min, max) ->
		Math.floor(@realInRange(min, max))

	realInRange: (min=0, max=100) ->
		@frac() * (max - min) + min

	normal: ->
		1 - 2 * @frac()

	guid: ->
		self = this
		'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace /[xy]/g, (c) ->
			r = self.integerInRange(0, 16)
			if c == 'x'
				v = r
			else
				v = (r&0x3|0x8)
			v.toString(16)

	#------------------------------------------------------------[ Arrays ]----
	pick: (ary) ->
		ary[@integerInRange(0, ary.length)]

	weightedPick: (ary) ->
		ary[~~Math.pow(@frac(), 2) * ary.length]

	#----------------------------------------------------------[ Language ]----
	word: ->
		@pick(DATA.lipsum)

	words: (num) ->
		ret = []
		for x in [0..num?=5]
			ret.push(@pick(DATA.lipsum))

		ret.join(' ')

	sentence: ->
		ret = @words(@integerInRange(2, 16)).replace /[a-z]/, (m) ->
			m.toUpperCase()
		ret + '.'

	sentences: (num) ->
		ret = []
		for x in [0..num?=5]
			ret.push(@sentence())
		ret.join(' ')

	#-------------------------------------------------------------[ Dates ]----
	timestamp: ->
		# 2000 - 2020
		@realInRange 946684800000, 1577862000000

	#------------------------------------------------------------[ People ]----
	firstName: ->
		"#{@pick(DATA.names.first)}"

	lastName: ->
		"#{@pick(DATA.names.last)}"

	name: ->
		"#{@firstName()} #{@lastName()}"

	fancyName: ->
		"#{@name()} #{@pick(DATA.names.suffixes)}"

	jobTitle: ->
		"#{@pick(DATA.departments)} #{@pick(DATA.positions)}"

	buzzPhrase: ->
		"#{@pick(DATA.buzz.verbs)} #{@pick(DATA.buzz.adjectives)} #{@pick(DATA.buzz.nouns)}"

DATA =
	lipsum: [
		"lorem", "ipsum", "dolor", "sit", "amet", "consectetur",
		"adipiscing", "elit", "nunc", "sagittis", "tortor", "ac", "mi",
		"pretium", "sed", "convallis", "massa", "pulvinar", "curabitur",
		"non", "turpis", "velit", "vitae", "rutrum", "odio", "aliquam",
		"sapien", "orci", "tempor", "sed", "elementum", "sit", "amet",
		"tincidunt", "sed", "risus", "etiam", "nec", "lacus", "id", "ante",
		"hendrerit", "malesuada", "donec", "porttitor", "magna", "eget",
		"libero", "pharetra", "sollicitudin", "aliquam", "mattis",
		"mattis", "massa", "et", "porta", "morbi", "vitae", "magna",
		"augue", "vestibulum", "at", "lectus", "sed", "tellus",
		"facilisis", "tincidunt", "suspendisse", "eros", "magna",
		"consequat", "at", "sollicitudin", "ac", "vestibulum", "vel",
		"dolor", "in", "egestas", "lacus", "quis", "lacus", "placerat",
		"et", "molestie", "ipsum", "scelerisque", "nullam", "sit", "amet",
		"tortor", "dui", "aenean", "pulvinar", "odio", "nec", "placerat",
		"fringilla", "neque", "dolor"
	]
	names:
		first: [
			"Jacob", "Isabella", "Ethan", "Emma", "Michael", "Olivia",
			"Alexander", "Sophia", "William", "Ava", "Joshua", "Emily",
			"Daniel", "Madison", "Jayden", "Abigail", "Noah", "Chloe",
			"Anthony", "Mia", "Christopher", "Elizabeth", "Aiden",
			"Addison", "Matthew", "Alexis", "David", "Ella", "Andrew",
			"Samantha", "Joseph", "Natalie", "Logan", "Grace", "James",
			"Lily", "Ryan", "Alyssa", "Benjamin", "Ashley", "Elijah",
			"Sarah", "Gabriel", "Taylor", "Christian", "Hannah", "Nathan",
			"Brianna", "Jackson", "Hailey", "John", "Kaylee", "Samuel",
			"Lillian", "Tyler", "Leah", "Dylan", "Anna", "Jonathan",
			"Allison", "Caleb", "Victoria", "Nicholas", "Avery", "Gavin",
			"Gabriella", "Mason", "Nevaeh", "Evan", "Kayla", "Landon",
			"Sofia", "Angel", "Brooklyn", "Brandon", "Riley", "Lucas",
			"Evelyn", "Isaac", "Savannah", "Isaiah", "Aubrey", "Jack",
			"Alexa", "Jose", "Peyton", "Kevin", "Makayla", "Jordan",
			"Layla", "Justin", "Lauren", "Brayden", "Zoe", "Luke",
			"Sydney", "Liam", "Audrey", "Carter", "Julia"
		]
		last: [
			"Smith", "Johnson", "Williams", "Jones", "Brown", "Davis",
			"Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas",
			"Jackson", "White", "Harris", "Martin", "Thompson", "Garcia",
			"Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee",
			"Walker", "Hall", "Allen", "Young", "Hernandez", "King",
			"Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker",
			"Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts",
			"Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards",
			"Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed",
			"Cook", "Morgan", "Bell", "Murphy", "Bailey", "Rivera",
			"Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres",
			"Peterson", "Gray", "Ramirez", "James", "Watson", "Brooks",
			"Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes",
			"Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell",
			"Long", "Patterson", "Hughes", "Flores", "Washington",
			"Butler", "Simmons", "Foster", "Gonzales", "Bryant",
			"Alexander", "Russell", "Griffin", "Diaz", "Hayes"
		]

	departments: [ 'HR', 'IT', 'Marketing', 'Engineering', 'Sales' ]

	positions: [ 'Director', 'Manager', 'Team Lead', 'Team Member' ]

	internet:
		tlds: ['.com', '.net', '.org', '.edu', '.co.uk']

	buzz:
		nouns: [
			"action-items", "applications", "architectures", "bandwidth",
			"channels", "communities", "content", "convergence",
			"deliverables", "e-business", "e-commerce", "e-markets",
			"e-services", "e-tailers", "experiences", "eyeballs",
			"functionalities", "infomediaries", "infrastructures",
			"initiatives", "interfaces", "markets", "methodologies",
			"metrics", "mindshare", "models", "networks", "niches",
			"paradigms", "partnerships", "platforms", "portals",
			"relationships", "ROI", "schemas", "solutions",
			"supply-chains", "synergies", "systems", "technologies",
			"users", "vortals", "web services", "web-readiness"
		]
		adjectives: [
			"24/365", "24/7", "B2B", "B2C", "back-end", "best-of-breed",
			"bleeding-edge", "bricks-and-clicks", "clicks-and-mortar",
			"collaborative", "compelling", "cross-media", "cross-platform",
			"customized", "cutting-edge", "distributed", "dot-com",
			"dynamic", "e-business", "efficient", "end-to-end",
			"enterprise", "extensible", "frictionless", "front-end",
			"global", "granular", "holistic", "impactful", "innovative",
			"integrated", "interactive", "intuitive", "killer",
			"leading-edge", "magnetic", "mission-critical",
			"next-generation", "one-to-one", "open-source",
			"out-of-the-box", "plug-and-play", "proactive", "real-time",
			"revolutionary", "rich", "robust", "scalable", "seamless",
			"sexy", "sticky", "strategic", "synergistic", "transparent",
			"turn-key", "ubiquitous", "user-centric", "value-added",
			"vertical", "viral", "virtual", "visionary", "web-enabled",
			"wireless", "world-class"
		]
		verbs: [
			"aggregate", "architect", "benchmark", "brand", "cultivate",
			"deliver", "deploy", "disintermediate", "drive", "e-enable",
			"embrace", "empower", "enable", "engage", "engineer",
			"enhance", "envisioneer", "evolve", "expedite", "exploit",
			"extend", "facilitate", "generate", "grow", "harness",
			"implement", "incentivize", "incubate", "innovate",
			"integrate", "iterate", "leverage", "matrix", "maximize",
			"mesh", "monetize", "morph", "optimize", "orchestrate",
			"productize", "recontextualize", "redefine", "reintermediate",
			"reinvent", "repurpose", "revolutionize", "scale", "seize",
			"strategize", "streamline", "syndicate", "synergize",
			"synthesize", "target", "transform", "transition", "unleash",
			"utilize", "visualize", "whiteboard"
		]

(module?.exports ? this).Nonsense = Nonsense;
