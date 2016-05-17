Merchant's Guide To The Galaxy
========

### Mission
Convert numbers and units based on intergalactic transactions.

### Roman Numeral Guidelines
* Numbers are formed by combining symbols together and adding the values. For example, MMVI is 1000 + 1000 + 5 + 1 = 2006. Generally, symbols are placed in order of value, starting with the largest values. When smaller values precede larger values, the smaller values are subtracted from the larger values, and the result is added to the total. For example MCMXLIV = 1000 + (1000 − 100) + (50 − 10) + (5 − 1) = 1944.
* The symbols "I", "X", "C", and "M" can be repeated three times in succession, but no more. (They may appear four times if the third and fourth are separated by a smaller value, such as XXXIX.) "D", "L", and "V" can never be repeated.
* "I" can be subtracted from "V" and "X" only. "X" can be subtracted from "L" and "C" only. "C" can be subtracted from "D" and "M" only. "V", "L", and "D" can never be subtracted.
* Only one small-value symbol may be subtracted from any large-value symbol.
* A number written in [16]Arabic numerals can be broken into digits. For example, 1903 is composed of 1, 9, 0, and 3. To write the Roman numeral, each of the non-zero digits should be treated separately. Inthe above example, 1,000 = M, 900 = CM, and 3 = III. Therefore, 1903 = MCMIII.

### Assumptions
* Input will vary but be delivered in a txt file in the format provided in sample output.
* Valid currencies are glob, prok, pish, and tegj.
* Valid minerals are Silver, Gold, and Iron.

### Architecture
* Repos
** One repo for managing each types of data: currency and minerals.
* Input
** Two concerns: parse the incoming data, translate the data to meaningful output.
** FileParser is responsible for parsing incoming data.
** Translator is responsible for translating the input.
* Output
** Outputter is concerned with presenting translations to the user.

### Usage
Make sure you are using Ruby 2.3 or higher
```
$ ruby -v
=> 2.3
```
Clone the repository
```
$ git clone git@github.com:tjblonsk/merchants_guide.git && cd merchants_guide
$ bundle install
```
Pass the program a text file as an argument that follows the below sample input format:
```
ruby app/run.rb 'path/to/input.txt'
```
You can try it out with the test fixture:
```
$ ruby app/run.rb './test/fixtures/input.txt'
pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
```

### Tests
Specs defined using [Minitest](https://github.com/seattlerb/minitest).
Run specs with:
```
ruby -Ilib:test test/path/to/spec
```
Rubcop for code quality.

### Sample Input
glob is I</br>
prok is V</br>
pish is X</br>
tegj is L</br>
glob glob Silver is 34 Credits</br>
glob prok Gold is 57800 Credits</br>
pish pish Iron is 3910 Credits</br>
how much is pish tegj glob glob ?</br>
how many Credits is glob prok Silver ?</br>
how many Credits is glob prok Gold ?</br>
how many Credits is glob prok Iron ?</br>
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?</br>
