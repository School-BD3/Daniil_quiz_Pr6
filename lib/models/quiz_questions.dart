import 'question.dart';

const List<Question> quizQuestions = [
  Question(
    text: 'Що таке Flutter?',
    answers: [
      'Мова програмування',
      'Фреймворк для створення інтерфейсів',
      'База даних',
      'Операційна система',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text: 'Яка мова використовується у Flutter?',
    answers: ['Java', 'Python', 'Dart', 'C#'],
    correctAnswerIndex: 2,
  ),
  Question(
    text: 'Який віджет використовується для вертикального розташування?',
    answers: ['Row', 'Column', 'Stack', 'Center'],
    correctAnswerIndex: 1,
  ),
  Question(
    text: 'Який віджет створює кнопку з дією?',
    answers: [
      'Text',
      'Container',
      'ElevatedButton',
      'Scaffold',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: 'Для чого використовується setState()?',
    answers: [
      'Для зміни стану StatefulWidget',
      'Для запуску сервера',
      'Для створення файлу',
      'Для встановлення пакетів',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    text: 'Який віджет є коренем Material Design екрана?',
    answers: ['Scaffold', 'Padding', 'Icon', 'SizedBox'],
    correctAnswerIndex: 0,
  ),
  Question(
    text: 'Що робить віджет StatelessWidget?',
    answers: [
      'Зберігає змінний внутрішній стан',
      'Описує інтерфейс без власного змінного стану',
      'Запускає базу даних',
      'Зберігає файли',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text: 'Який віджет відображає текст?',
    answers: ['Row', 'Text', 'Scaffold', 'Expanded'],
    correctAnswerIndex: 1,
  ),
  Question(
    text: 'Для чого потрібен pubspec.yaml?',
    answers: [
      'Для опису залежностей і метаданих проєкту',
      'Для зберігання відповідей користувача',
      'Для малювання кнопок',
      'Для запуску Dart-коду',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    text: 'Який віджет дозволяє прокручувати довгий список?',
    answers: ['ListView', 'Icon', 'Center', 'Divider'],
    correctAnswerIndex: 0,
  ),
];
