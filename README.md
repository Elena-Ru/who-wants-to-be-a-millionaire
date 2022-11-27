# who-wants-to-be-a-millionaire
Simple quiz application.

On the main view of the app you can push "Start" button for a creating a new game session or choose "Results" and inspect last results of the game.

![MainView](https://user-images.githubusercontent.com/10026372/204151793-7a19e5aa-dafc-4b58-8881-dae5168b90ed.jpg)

The game view represents by "Question view" and "Answer area" with 4 variants of answer. Only 1 of them is correct. 
If you click a correct answer next question will be available for you.

![GameView](https://user-images.githubusercontent.com/10026372/204151851-5b431bed-dd55-4bc9-8c4f-7f480d462477.jpg)

But if your answer is failed the app will show you notification and this game will over.

![GameOver](https://user-images.githubusercontent.com/10026372/204151693-4d255fe9-5c30-4756-ba26-a66c9368815f.jpg)

If your all answers will be correct, the app will show you "Congratulations" alert. 
After the game is over the application displays Main view again.

Your can tap on "Results" button and inspect your score.
Result view display: 
- the quantity of correct answers;
- the percent of corret answers.

![resultsView](https://user-images.githubusercontent.com/10026372/204151577-2759cdb7-318c-402b-a2df-23e3a74ae0d5.jpg)

All results are stores in a Core Data and available after restart application.
