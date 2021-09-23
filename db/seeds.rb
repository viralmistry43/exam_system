unless User.any?
  [
    ['Viral', 'viralhmistry@gmail.com'], ['Kevin', 'kevinmistry@gmail.com']
  ].each do |user|
    User.create(name: user[0], email: user[1])
  end
  puts "#{User.count} User created."
end

unless Exam.any?
  Exam.create(name: 'Board', date: '2021-10-15')
  puts "#{Exam.count} Exam created."
end

unless Subject.any?
  Subject.create(exam_id: Exam.find_by_name('Board').id, name: 'Maths', standard: 3)
  puts "#{Subject.count} Subject created."
end

unless Topic.any?
  Topic.create(subject_id: Subject.find_by_name('Maths').id, topic_number: 1, name: 'Plus')
  puts "#{Topic.count} Topic created."
end

unless Chapter.any?
  [
    ['Plus', 1, 'Beginning'], ['Plus', 2, 'Advance']
  ].each do |chapter|
    Chapter.create(topic_id: Topic.find_by_name(chapter[0]).id, chapter_number: chapter[1], name: chapter[2])
  end
  puts "#{Chapter.count} Chapter created."
end

unless Question.any?
  [
    ['Beginning', 1, 'easy', '4 + 3'], ['Beginning', 2, 'easy', '2 + 3'],
    ['Beginning', 3, 'medium', '15 + 7'], ['Beginning', 4, 'medium', '78 + 6'],
    ['Beginning', 5, 'hard', '765 + 236'], ['Beginning', 6, 'hard', '876 + 456'],
    ['Advance', 1, 'easy', '5 + 2 + 6'], ['Advance', 2, 'easy', '3 + 8 + 9'],
    ['Advance', 3, 'medium', '53 + 8 + 54'], ['Advance', 4, 'medium', '64 + 4 + 22'],
    ['Advance', 5, 'hard', '345 + 561 + 673'], ['Advance', 6, 'hard', '284 + 374 + 674']
  ].each do |question|
    Question.create(
      chapter_id: Chapter.find_by_name(question[0]).id, question_number: question[1], category: question[2], name: question[3]
    )
  end
  puts "#{Question.count} Question created."
end

unless QuestionOption.any?
  [
    ['4 + 3', '5', false], ['4 + 3', '8', false], ['4 + 3', '7', true], ['4 + 3', '9', false],
    ['2 + 3', '6', false], ['2 + 3', '8', false], ['2 + 3', '4', false], ['2 + 3', '5', true],
    ['15 + 7', '22', true], ['15 + 7', '25', false], ['15 + 7', '24', false], ['15 + 7', '20', false],
    ['78 + 6', '82', false], ['78 + 6', '84', true], ['78 + 6', '88', false], ['78 + 6', '90', false],
    ['765 + 236', '1010', false], ['765 + 236', '1015', false], ['765 + 236', '1001', true], ['765 + 236', '1000', false],
    ['876 + 456', '1330', false], ['876 + 456', '1340', false], ['876 + 456', '1333', false], ['876 + 456', '1332', true],
    ['5 + 2 + 6', '13', true], ['5 + 2 + 6', '15', false], ['5 + 2 + 6', '17', false], ['5 + 2 + 6', '12', false],
    ['5 + 2 + 6', '15', false], ['5 + 2 + 6', '13', true], ['5 + 2 + 6', '18', false], ['5 + 2 + 6', '19', false],
    ['53 + 8 + 54', '105', false], ['53 + 8 + 54', '111', false], ['53 + 8 + 54', '115', true], ['53 + 8 + 54', '125', false],
    ['64 + 4 + 22', '92', false], ['64 + 4 + 22', '89', false], ['64 + 4 + 22', '100', false], ['64 + 4 + 22', '90', true],
    ['345 + 561 + 673', '1579', true], ['345 + 561 + 673', '1577', false], ['345 + 561 + 673', '1555', false], ['345 + 561 + 673', '1602', false],
    ['284 + 374 + 674', '1345', false], ['284 + 374 + 674', '1332', true], ['284 + 374 + 674', '1342', false], ['284 + 374 + 674', '1362', false],
  ].each do |qo|
    QuestionOption.create(question_id: Question.find_by_name(qo[0]).id, option: qo[1], correct: qo[2])
  end
  puts "#{QuestionOption.count} Question Option created."
end
