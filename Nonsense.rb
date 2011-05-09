class Nonsense
  class LFSR
    attr_accessor :state

    def initialize(seed=0x71a2b3c4, taps=0x48000000)
      @state = seed
      @taps = taps 
    end

    def shift
      lsb = @state & 0x1
      @state >>= 1
      @state ^= @taps if lsb == 1
      @state &= 0x7fffffff
      @state
    end
  end

  def initialize (seed=0x71a2b3c4)
    @lfsr = Nonsense::LFSR.new
  end

  def seed (seed)
    @lfsr.state = seed
  end
  
  #-----------------------------------------------------------[ Numbers ]----
  def integer
    @lfsr.shift
  end

  def frac
    @lfsr.shift.to_f / 0x7fffffff
  end

  def real
    @lfsr.shift + frac
  end

  def integerInRange (min, max)
    realInRange(min, max).floor
  end

  def realInRange (min, max)
    frac * (max.to_f - min.to_f) + min.to_f
  end

  def normal
    1.0 - 2.0 * frac
  end

  def guid
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.gsub!(/[xy]/) do |c|
      r = integerInRange(0, 16)
      if c == 'x'
        v = r
      else
        v = (r&0x3|0x8)
      end
      v.to_s(16)
    end
  end
  
  #------------------------------------------------------------[ Arrays ]----
  def pick (ary)
    ary[integerInRange(0, ary.length)]
  end

  def weightedPick (ary)
    ary[(frac ** 2).to_i * ary.length]
  end

  #----------------------------------------------------------[ Language ]----
  def word
    pick(DATA[:lipsum])
  end

  def words (num=5)
    ret = []
    (0..num).each do |i|
      ret.push(word)
    end

    ret.join(' ')
  end

  def sentence
    (words(integerInRange(2, 16)).capitalize) + '.'
  end
  
  def sentences (num=5)
    ret = []
    (0..num).each do |i|
      ret.push(sentence)
    end

    ret.join(' ')
  end

	#-------------------------------------------------------------[ Dates ]----
  def timestamp
    (946684800000 + (frac * 631138519494).floor)/1000
  end

	#------------------------------------------------------------[ People ]----
  def firstName
		"#{pick(DATA[:names][:first])}"
  end

  def lastName
		"#{pick(DATA[:names][:last])}"
  end

  def name
    "#{firstName} #{lastName}"
  end

  def fancyName
    "#{name} #{pick(DATA[:names][:suffixes])}"
  end

  def jobTitle
		"#{pick(DATA[:departments])} #{pick(DATA[:positions])}"
  end

  def buzzPhrase
		"#{pick(DATA[:buzz][:verbs])} #{pick(DATA[:buzz][:adjectives])} #{pick(DATA[:buzz][:nouns])}"
  end

  DATA = {
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
  }
end
