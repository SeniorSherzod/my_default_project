class WordGuessQuestion {
  final String question;
  final List<String> imageUrls;
  final String answer;

  const WordGuessQuestion(this.question, this.imageUrls, this.answer);
}


List<WordGuessQuestion> questions = [
  // Question 1: Musical Instrument
  WordGuessQuestion(
      "What musical instrument has 88 keys?",
      ["https://w7.pngwing.com/pngs/987/178/png-transparent-piano-piano-furniture-image-file-formats-piano-thumbnail.png",
        "https://w7.pngwing.com/pngs/35/95/png-transparent-digital-piano-electric-piano-drawing-art-piano-album-furniture-piano-thumbnail.png",
        "https://w7.pngwing.com/pngs/440/520/png-transparent-digital-piano-steinway-sons-musical-instrument-grand-piano-piano-white-furniture-piano-thumbnail.png",
        "https://w7.pngwing.com/pngs/608/781/png-transparent-piano-musical-keyboard-pianist-piano-furniture-piano-photography-thumbnail.png"],
      "piano"),
  // Question 2: Sport
  WordGuessQuestion(
      "What sport involves kicking a ball into a goal?",
      ["https://e7.pngegg.com/pngimages/110/650/png-clipart-football-pitch-goal-soccer-specific-stadium-soccer-field-white-and-black-soccer-ball-on-field-photography-atmosphere-thumbnail.png",
        "https://e7.pngegg.com/pngimages/922/269/png-clipart-soccer-player-logo-football-player-kickball-soccer-player-sport-vertebrate-thumbnail.png",
        "https://e7.pngegg.com/pngimages/746/955/png-clipart-football-goal-futsal-soccer-white-and-black-soccer-ball-on-net-angle-happy-birthday-vector-images-thumbnail.png",
        "https://e7.pngegg.com/pngimages/471/496/png-clipart-soccer-ball-illustration-american-football-futsal-football-cdr-sport-thumbnail.png"],
      "soccer"),
  // Question 3: Transportation
  WordGuessQuestion(
      "What kind of transportation travels on rails?",
      ["https://e7.pngegg.com/pngimages/307/610/png-clipart-train-train-thumbnail.png",
        "https://e7.pngegg.com/pngimages/391/537/png-clipart-black-and-red-train-train-rail-transport-steam-locomotive-black-train-black-hair-black-white-thumbnail.png",
        "https://e7.pngegg.com/pngimages/67/902/png-clipart-train-train-thumbnail.png",
        "https://e7.pngegg.com/pngimages/692/865/png-clipart-train-train-thumbnail.png"],
      "train"),
  // Question 4: Food
  WordGuessQuestion(
      "What is a round, flat bread topped with tomato sauce and cheese?",
      ["https://e7.pngegg.com/pngimages/317/611/png-clipart-pizza-pizza-sticker-pepperoni-pizza-food-pizza-delivery-thumbnail.png",
        "https://e7.pngegg.com/pngimages/658/279/png-clipart-pizza-dish-hawaiian-pizza-ham-pepperoni-meat-pizza-food-beef-thumbnail.png",
        "https://e7.pngegg.com/pngimages/192/0/png-clipart-pizza-pizza-thumbnail.png",
        "https://e7.pngegg.com/pngimages/445/888/png-clipart-pizza-delivery-ham-sushi-mozzarella-pizza-food-recipe-thumbnail.png"],
      "pizza"),
  // Question 5: Landmark
  WordGuessQuestion(
      "What famous landmark in Paris has a large iron frame?",
      ["https://e7.pngegg.com/pngimages/944/627/png-clipart-eiffel-tower-illustration-eiffel-tower-arc-de-triomphe-statue-of-liberty-tokyo-tower-illustration-france-eifel-tower-watercolor-stick-figure-illustration-watercolor-painting-watercolor-thumbnail.png",
        "https://e1.pngegg.com/pngimages/370/810/png-clipart-vintange-eifel-tower-paris-thumbnail.png",
        "https://e7.pngegg.com/pngimages/424/381/png-clipart-eiffel-tower-drawing-eifel-tower-france-brush-thumbnail.png",
        "https://e7.pngegg.com/pngimages/198/486/png-clipart-2015-united-nations-climate-change-conference-convention-energy-advertising-agency-eifel-angle-triangle-thumbnail.png"],
      "Eiffel Tower"),
  // Question 6: Animal
  WordGuessQuestion(
      "What large, spotted cat has a powerful roar?",
      ["https://e7.pngegg.com/pngimages/471/1009/png-clipart-lion-graphy-lion-mammal-animals-thumbnail.png",
        "https://e7.pngegg.com/pngimages/707/823/png-clipart-simba-from-lion-king-simba-lion-lion-king-mammal-heroes-thumbnail.png",
        "https://e7.pngegg.com/pngimages/747/118/png-clipart-lion-logo-roar-lions-lion-y-white-mammal-thumbnail.png",
        "https://e7.pngegg.com/pngimages/796/331/png-clipart-lion-stencil-painted-lion-lion-head-stencil-watercolor-painting-mammal-thumbnail.png"],
      "lion"),

];


