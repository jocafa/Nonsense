(function () {
	function LFSR (state, taps) {
		this.state = state || 0x71a2b3c4
		this.taps  = taps  || 0x48000000;
	}

	LFSR.prototype.shift = function () {
		var lsb = this.state & 0x1;
		this.state >>>= 1;
		if (lsb == 1) {
			this.state ^= this.taps;
		}
		return this.state;
	};

	function Nonsense (seed) {
		this.lfsr = new LFSR(seed);
	}

	Nonsense.data = {
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
		],

		names: {
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
			],

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
		},

		departments: [ 'HR', 'IT', 'Marketing', 'Engineering', 'Sales' ],

		positions: [ 'Director', 'Manager', 'Team Lead', 'Team Member' ],

		internet: {
			tlds: ['.com', '.net', '.org', '.edu', '.co.uk']
		},

		buzz: {
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
			],

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
			],

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
		}
	};

	Nonsense.prototype.seed = function (seed) {
		this.state = seed;
	};

	////////////////////////////////////////////////////////////[ Numbers ]////
	Nonsense.prototype.integer = function () {
		return this.lfsr.shift();
	};

	Nonsense.prototype.frac = function () {
		return this.lfsr.shift() / 0x7fffffff;
	};

	Nonsense.prototype.real = function () {
		return this.lfsr.shift() + this.frac();
	};

	Nonsense.prototype.integerInRange = function (min, max) {
		min = min || 0;
		max = max || 100;
		return Math.floor(this.realInRange(min, max));
	};

	Nonsense.prototype.realInRange = function (min, max) {
		min = min || 0;
		max = max || 100;
		return this.frac() * (max - min) + min;
	};

	Nonsense.prototype.normal = function () {
		return 1 - 2 * this.frac();
	};

	Nonsense.prototype.guid = function () {
		return (
			this.integer().toString(16) +
			this.integer().toString(16) +
			this.integer().toString(16) +
			this.integer().toString(16) +
			'00000000000000000000000000000000'
		).substr(0, 32);
	};

	/////////////////////////////////////////////////////////////[ Arrays ]////
	Nonsense.prototype.pick = function (ary) {
		var i = Math.floor(this.frac() * ary.length);
		return ary[i];
	};

	Nonsense.prototype.weightedPick = function (ary) {
		var i = ~~(Math.pow(this.frac(), 2) * ary.length);
		return ary[i];
	};

	///////////////////////////////////////////////////////////[ Language ]////
	Nonsense.prototype.word = function () {
		return this.pick(Nonsense.data.lipsum);
	};

	Nonsense.prototype.words = function (num) {
		var ret = [];
		num = num || 5;

		for (var i = 0; i < num; i++) {
			ret.push(this.word());
		}

		return ret.join(' ');
	};

	Nonsense.prototype.sentence = function () {
		var n = 2 + this.lfsr.shift() & 0xf;
		return this.words(n).replace(/[a-z]/, function (m) { return m.toUpperCase(); }) + '.';
	};

	Nonsense.prototype.sentences = function (num) {
		var ret = [];
		num = num || 5;

		for (var i = 0; i < num; i++) {
			ret.push(this.sentence());
		}

		return ret.join('  ');
	};

	//////////////////////////////////////////////////////////////[ Dates ]////
	Nonsense.prototype.date = function () {
		// 2000 - 2020
		return 946684800000 + ~~(this.frac() * 631138519494); 
	};

	/////////////////////////////////////////////////////////////[ People ]////
	Nonsense.prototype.firstName = function () {
		return this.pick(Nonsense.data.names.first);
	};

	Nonsense.prototype.lastName = function () {
		return this.pick(Nonsense.data.names.last);
	};

	Nonsense.prototype.name = function () {
		return [
			this.firstName(),
			this.lastName()
		].join(' ');
	};

	Nonsense.prototype.fancyName = function () {
		return [
			this.firstName(),
			this.lastName(),
			this.pick(Nonsense.data.names.suffixes)
		].join(' ');
	};

	Nonsense.prototype.jobTitle = function () {
		return [
			this.pick(Nonsense.data.departments),
			this.pick(Nonsense.data.positions)
		].join(' ');
	};

	///////////////////////////////////////////////////////////////[ Buzz ]////
	Nonsense.prototype.buzzPhrase = function () {
		return [
			this.pick(Nonsense.data.buzz.verbs),
			this.pick(Nonsense.data.buzz.adjectives),
			this.pick(Nonsense.data.buzz.nouns)
		].join(' ');
	};


	window.Nonsense = Nonsense;
})();
