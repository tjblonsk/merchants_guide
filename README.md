Merchant's Guide To The Galaxy
========

### Mission
Convert numbers and units based on intergalactic transactions.

### Usage
Clone the repository
```
$ git clone git@github.com:tjblonsk/merchants_guide.git && cd merchants_guide
```
Pass the program a text file that follows the below input contract:
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

### Sample Input
glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?

### Assumptions
Input will vary but be delivered in a txt file in the format provided in sample output.
Valid currencies are glob, prok, pish, and tegj.
Valid minerals are Silver, Gold, and Iron.

### Tests
Specs defined using [Minitest](https://github.com/seattlerb/minitest)
Rubcop for code quality.
