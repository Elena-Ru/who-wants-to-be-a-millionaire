# QuizQuake
Simple quiz application.

On the main view of the app you can push "Start" button for a creating a new game session or choose "Results" and inspect last results of the game.

<img width="292" alt="Снимок экрана 2023-09-22 в 18 06 52" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/d4abba2b-b33b-4a2c-a97e-ba82ebd10077">

The game view represents by "Question view" and "Answer area" with 4 variants of answer. Only 1 of them is correct. 
If you click a correct answer next question will be available for you. On the top of the game view there are 2 labels. 
They display the number of current question and the percent of correct answers.

<img width="282" alt="Снимок экрана 2023-09-22 в 18 08 54" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/70b23e92-ccb7-46d4-a072-c7db35e65122">


If your answer is failed the app will show you notification and this game will over.

<img width="1009" alt="Снимок экрана 2023-09-22 в 18 12 42" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/c136de64-c78b-4d4a-aaf5-b2e1a416aee0">


If your all answers will be correct, the app will show you "Congratulations" alert. 
After the game is over the application displays Main view again.

Your can tap on "Results" button and inspect your score.
Result view display: 
- the quantity of correct answers;
- the percent of corret answers.

<img width="284" alt="Снимок экрана 2023-09-22 в 18 14 27" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/eec8a72a-e62c-41aa-aaa3-df14272d4fdf">


All results are stores in a Core Data and available after restart application.

Now you can push "Gear" button and go to the setting view. You can switch contoll and shuffle questions for your next game session.

<img width="1034" alt="Снимок экрана 2023-09-22 в 18 16 05" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/55d8ba12-3c74-4685-9e35-44d80228030b">


If you choose to shuffle questions, they will appear in random order.

You can push on the "Plus" button on the main view and add your own question with the variants of answers.

<img width="1000" alt="Снимок экрана 2023-09-22 в 18 19 13" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/9d30dc99-461d-4052-875a-bd1f5ffde5dc">


If you fill all the fileds correctly, your question wil be added to the question data base wich stores in Core Data. 
And new question will be available in your next game, even after restarting application.

<img width="293" alt="Снимок экрана 2023-09-22 в 18 20 54" src="https://github.com/Elena-Ru/who-wants-to-be-a-millionaire/assets/10026372/ac598499-d5bc-4f8e-9a20-b6f01d8be325">


- UI via SnapKit
