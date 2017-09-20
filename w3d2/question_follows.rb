require "sqlite3"
require_relative "users"


class QuestionFollows

  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDBConnection.instance.execute('SELECT * FROM question_follows')
    data.map{|follow| QuestionFollows.new(follow)}
  end

  def self.followers_for_question_id(question_id)
    #return user objects
    var = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN question_follows
        ON  users.id =  question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL
    var.map do |user|
      User.new(user)
    end
  end

  def self.followed_questions_for_user_id(user_id)
    #return question objects
    var = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN question_follows
      ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    var.map {|el| Question.new(el)}
  end

  def self.find_by_id(id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
       FROM
       question_follows
       WHERE
       id = ?
    SQL
    return nil if var.length < 1
    var.map do |el|
      QuestionFollows.new(el)
    end
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end


end
