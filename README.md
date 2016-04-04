Merchant's Guide To The Galaxy
========

### Mission
Convert numbers and units based on intergalactic transactions.

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
Clone the repository
```
$ git clone git@github.com:tjblonsk/merchants_guide.git && cd merchants_guide
```
Pass the program a text file that follows the below sample input format:
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
