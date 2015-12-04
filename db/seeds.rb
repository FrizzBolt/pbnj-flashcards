cards = [
  {question: "How many peanuts does it take to make one 12-ounce jar of peanut butter?", answer: "540", deck_id: 1},
  {question: "How much money (in millions of dollars) do Americans spend per year on peanut butter on average?", answer: "800", deck_id: 1},
  {question: "Who Invented Peanut Butter?", answer: "George Washington Carver", deck_id: 1},
  {question: "Jams are made by cooking the whole fruit with what ingredient?", answer: "sugar", deck_id: 1},
  {question: "What type of fruit are made into preserves that are generally called Marmalades?", answer: "citrus", deck_id: 1},
  {question: "Who invented the PBNJ sandwich?", answer: "Julia Davis Chandler", deck_id: 1},
  {question: "What letter comes after 'a'?", answer: "b", deck_id: 5},
  {question: "What number comes after '7'?", answer: "8", deck_id: 5},
  {question: "Enter the word 'red'.", answer: "red", deck_id: 5},
  {question: "What number comes before '6'?", answer: "5", deck_id: 5},
  {question: "What is the current President of the United States' name?", answer: "Barack Obama", deck_id: 5},
  {question: "What letter comes before 'b'?", answer: "a", deck_id: 5},
  {question: "What is the name of the lion in The Lion King?", answer: "Simba", deck_id: 3},
  {question: "What is the name of the mermaid in The Little Mermaid?", answer: "Ariel", deck_id: 3},
  {question: "What is the name of the princess in Cinderella", answer: "Cinderella", deck_id: 3},
  {question: "What is the name of the princess in Aladdin?", answer: "Jasmine", deck_id: 3},
  {question: "What is the name of the cowboy in Toy Story?", answer: "Woody", deck_id: 3}
]

cards.each do |card|
  Card.create(question: card[:question], answer: card[:answer], deck_id: card[:deck_id])
end
