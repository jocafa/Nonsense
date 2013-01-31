Nonsense
========

Generate repeatable random data in JS

Inspired by [Faker.js](http://github.com/Marak/Faker.js)
Uses slightly modified [Alea PRNG](http://baagoe.org/en/wiki/Alea)

## Getting started

For the server, install Nonsense via [npm][npm].
```shell
npm install Nonsense
```

For the browser, download [Nonsense.js][nonsense.js], and include it as a script tag.

```html
<script src="Nonsense.js"></script>
<script>
  var ns = new Nonsense();
  ns.integer(); // Random integer between 0 and 2^32
</script>
```

[npm]: https://npmjs.org/
[nonsense.js]: https://raw.github.com/jocafa/Nonsense/master/Nonsense.js

## Usage

### Instantiation
To create a new Nonsense instance, do `var ns = new Nonsense();`. You can pass any number of arbitrary arguments to the `Nonsense()` constructor to be used as seed data. If you don't pass anything, it will just use the default.

### Seeding
If you want to reset the seed of an instance you already have, call `ns.sow()` and pass in the seed data you want to use. The constructor calls `sow()` internally on instantiation.

### Numbers
  - `integer()` - returns a random integer between 0 and 2^32
  - `frac()` - returns a random real number between 0 and 1
  - `real()` - returns a random real number between 0 and 2^32
  - `integerInRange(min, max)` - returns a random integer between min and max
  - `realInRange(min, max)` - returns a random real number between min and max
  - `normal()` - returns a random real number between -1 and 1

### Utilities
  - `uuid()` - returns a valid v4 UUID hex string
  - `pick(array)` - returns a random member of `array`
  - `weightedPick(array)` - returns a random member of `array`, favoring the earlier entries
  - `timestamp(min, max)` - returns a random timestamp between min and max, or between the beginning of 2000 and the end of 2020 if min and max aren't specified

### Language
  - `word()` - returns a random word of lipsum
  - `words(n)` - returns `n` random words of lipsum, 3 if not specified
  - `sentence()` - returns a random lipsum sentence
  - `sentences(n)` - returns `n` random lipsum sentences, 3 if not specified

### Miscellaneous
  - `firstName()` - returns a random common first name
  - `lastName()` - returns a random common last name
  - `name()` - returns a random first and last name
  - `jobTitle()` - returns a random job title
  - `buzzPhrase()` - returns a random web 2.0 business plan... 

License
-------

Do whatever you want with this code. The consequenses of your actions are your own responsibility.
