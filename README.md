# QuizQuake
Simple quiz application.

On the main view of the app you can push "Start" button for a creating a new game session or choose "Results" and inspect last results of the game.

![MainView](https://user-images.githubusercontent.com/10026372/205705794-a6ee1ecf-2c8b-4812-a89f-741b2018105b.jpg)

The game view represents by "Question view" and "Answer area" with 4 variants of answer. Only 1 of them is correct. 
If you click a correct answer next question will be available for you. On the top of the game view there are 2 labels. 
They display the number of current question and the percent of correct answers.

![GameView](https://user-images.githubusercontent.com/10026372/205709120-cf299ab8-20b8-4a41-9e39-27a10f0966ba.jpg)

If your answer is failed the app will show you notification and this game will over.

![GameOver](https://user-images.githubusercontent.com/10026372/205710148-f2738156-2a28-4cdd-b584-7a811d9efccc.jpg)

If your all answers will be correct, the app will show you "Congratulations" alert. 
After the game is over the application displays Main view again.

Your can tap on "Results" button and inspect your score.
Result view display: 
- the quantity of correct answers;
- the percent of corret answers.

![resultsView](https://user-images.githubusercontent.com/10026372/204151577-2759cdb7-318c-402b-a2df-23e3a74ae0d5.jpg)

All results are stores in a Core Data and available after restart application.

Now you can push "Gear" button and go to the setting view. You can switch contoll and shuffle questions for your next game session.

![Settings](https://user-images.githubusercontent.com/10026372/205707878-44b70ad8-044b-4a13-998f-b4f1470ff2fd.jpg)

If you choose to shuffle questions, they will appear in random order.

You can push on the "Plus" button on the main view and add your own question with the variants of answers.

![AddQuestionView](https://user-images.githubusercontent.com/10026372/205712215-5b694abc-12b1-42f3-8c32-078e74c0dcff.jpg)

If you fill all the fileds correctly, your question wil be added to the question data base wich stores in Core Data. 
And new question will be available in your next game, even after restarting application.

![addQuestionAlerts](https://user-images.githubusercontent.com/10026372/205713509-824e5b25-319b-4547-a242-fcd02e8ed4f3.jpg)

![newQuestion](https://user-images.githubusercontent.com/10026372/205713971-0713b96f-eb46-47c0-a2cd-f33b07cdc906.jpg)

- UI via SnapKit
