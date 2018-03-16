# README

This is a simple Lorem Ipsum generator I made for a talk I gave titled "The History and Usage of Lorem Ipsum." In the strain of "Fun" ipsums I created an Ipsum that only returns prepositions, thus: Preposipsum.

The following code is from prepositions controller, and call every time a user hits 'preposipsify'
```ruby
  def index

    #Set Paragraph Length and Paragraph Count variables from params
    plength = params[:plength]
    pnumber = params[:pnumber]

    #Check if variables have been set, then convert from string to integers
    if plength
      plength = plength.to_i
    end

    if pnumber
      pnumber = pnumber.to_i
    end

    #Generate a paragraph, passing in count and number
    if pnumber
      @prepositions = paragraphs(pnumber, plength)
    end

  end
```

The following are are all private methods:

First I create a sentence
```ruby
def sentence

  #declare my sentence variable
  sen = ""

  #call a random word from my database of prepositions as first word in my sentence
  words_first = Preposition.all.shuffle[1]

  #create a list of random words 4 to 9 words long
  words_list = Preposition.all.shuffle[4..9]

  #add my first word to my sentence and capitalize
  sen = sen + words_first.p.capitalize

  #iterate through my list or words and add them all to my sentence
  words_list.each do |w|
    sen = sen + " " + w.p
  end

  #add a period to the end of my sentence
  sen = sen + "."

end

```

Second I create a paragraph from that sentence

```ruby
def paragraph (length)

  #declare a variable for my paragraph
  par = ""

  #call the sentence method a number of times equal to the argument and add the output to my sentence
  length.times do
    par = par + sentence + " "
  end

  #return the paragraph
  par
end
```

Third I create my entire output including possible multiple paragraphs

```ruby
def paragraphs (pnum, plen)

  #declare a variable for my entire output
  para = ""

  #add a number of paragraphs to our output based on the first argument, add line breaks after each paragraph if that paragraph is not the last
  pnum.times do
    pnum -= 1
    para = para + paragraph(plen)
    pnum != 0 ? (para = para + "<br>" + "<br>") : para
  end

  #return the output
  para
end
```
